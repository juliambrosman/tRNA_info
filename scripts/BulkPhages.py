#!/usr/bin/python

from Bio import Entrez
from Bio import SeqIO
import re
import os
import subprocess


#extract appropriate accession numbers from ncbi summary of website nucleotide search:
keyword="phage.*[genome|genomic sequence|complete|!partial]"
accs=[]
titles=[]
acdict={}

splist=open("./NCBI_phage_genome_search.txt").readlines()
for i in range(1,len(splist),4):
    if re.search(keyword, splist[i]):
        name=splist[i].split(",")[0].split(".")[1]
        name2=re.sub(r"complete genome\n|genomic sequence\n|\n","", name)
        if name not in titles:
            titles.append(name2)
            acc=splist[i+2].split(" ")[0]
            accs.append(acc)
            acdict[acc]=name2
accs_str=",".join(accs)
    
#Extract gbk files from entrez as gbk files, and then convert the gbk files to fasta for input into trnascan

os.mkdir("pgenomes")
Entrez.email="julia.brown@einstein.yu.edu"
for a in accs:
    handle=Entrez.efetch(db="nucleotide", id=str(a), rettype="gb", retmode="text")
    filename="./pgenomes/"+a+".gbk"
    out=open(filename, "w")
    out.write(handle.read())
    out.close()
    handle.close()
    SeqIO.convert("./pgenomes/"+a+".gbk","gb","./pgenomes/"+a+".fasta","fasta")
    print(a+" converted")


#make table of information about phage genomes:
from Bio.SeqUtils import GC

out=open("phage.genome.info.txt","w")
out.write("ncbi_acc\tname\ttax\tsize\tgc\n")
taxdict={}

for phage in accs:
    gbk=SeqIO.parse("./pgenomes/"+phage+".gbk", "genbank")
    for rec in gbk:
        taxonomy=rec.annotations["taxonomy"]
        if len(taxonomy)>4:
            tax=taxonomy[3]
        else:
            tax=taxonomy[-1]
        taxdict[phage]=tax
        gc_content=GC(rec.seq)
        out.write(phage+"\t"+acdict[phage]+"\t"+tax+"\t"+str(len(rec.seq))+"\t"+str(gc_content)+"\n")
out.close()

os.mkdir("./pgenomes/trna/")

#run tRNA scan:
for phage in accs:
    args=("tRNAscan-SE -o ./pgenomes/trna/"+phage+".trnas.txt -G -D ./pgenomes/"+phage+".fasta")
    subprocess.call(args.split(" "))
    print("scanning phage "+ phage +" for tRNAs!")

out=open("phage_tRNA_summary.txt","w")
out.write("phage_short\tphage_full\tbound1\tbound2\ttRNA\tanti_codon\tintron_bound1\titron_bound2\tscore\n")

#ID phages with tRNAs and write summary table about these phages.

tRNA_phages=[]
for n in accs:
    tfile="./pgenomes/trna/"+n+".trnas.txt"
    if os.path.getsize(tfile)>0:
        tRNA_phages.append(n)
    	info=open(tfile).readlines()
    	for line in info[3:]:
        	vec=line.split("\t")
        	out.write(acdict[phage]+"\t"+vec[0]+"\t"+vec[2]+"\t"+vec[3]+"\t"+vec[4]+"\t"+vec[5]+"\t"+vec[6]+"\t"+vec[7]+"\t"+vec[8])
out.close()
print("there are a total of "+str(len(accs))+" phages but only "+str(len(tRNA_phages))+" have tRNAs")

print("....and we're done.")




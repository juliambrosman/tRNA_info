#!usr/bin/python

import re
import os

out=open("phage_tRNA_summary.txt","w")
out.write("phage_short\tphage_full\tbound1\tbound2\ttRNA\tanti_codon\tintron_bound1\titron_bound2\tscore\n")

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
            
count=0

for n in accs:
    tfile="./pgenomes/trna/"+n+".trnas.txt"
    if os.path.getsize(tfile)>0:
        count+=1
    	info=open(tfile).readlines()
    	for line in info[3:]:
        	vec=line.split("\t")
        	out.write(acdict[n]+"\t"+vec[0]+"\t"+vec[2]+"\t"+vec[3]+"\t"+vec[4]+"\t"+vec[5]+"\t"+vec[6]+"\t"+vec[7]+"\t"+vec[8])
out.close()
print("there are a total of "+str(len(accs))+" phages but only "+str(count)+" have tRNAs")

print("....and we're done.")
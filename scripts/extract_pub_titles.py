#!usr/bin/python

from Bio import SeqIO
import re
import os

accs=open("large_acc_list.txt").read().split(",")

out=open("phage_publication_info.txt","w")
out.write("acc_num\tphage_name\tref_title\tpubmed_id\n")

for phage in accs:
    gbk_file="./pgenomes/"+phage+".gbk"
    if os.path.exists(gbk_file):
        gbk=SeqIO.parse(gbk_file, "genbank")
        for rec in gbk:
            ref_title=str(rec.annotations['references'][0]).split("\n")
            for i in ref_title:
                if i.startswith("title"):
                    TITLE=i
                elif i.startswith("pubmed id:"):
                    ID=i
            out.write(phage+"\t"+rec.annotations['source']+"\t"+TITLE.replace("title:","")+"\t"+ID.replace("pubmed id:","")+"\n")
out.close()
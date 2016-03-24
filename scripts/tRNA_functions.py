import subprocess

def run_trna_scan(input_file, output):
    if os.path.exists(output):
        os.remove(output)
    args=["tRNAscan-SE", "-o", output, "-G", "-D","-N", input_file]
    subprocess.call(args)
    print("tRNA scan of "+input_file+" is done!")
    
from Bio import SeqIO
import subprocess
import os

## now extract all CDS from genbank file:
def gbk_to_cds_fasta(gbk, output):
    handle=SeqIO.parse(gbk,"genbank")
    output=open(output,"w")
    count=0
    for g in handle:
        for feature in g.features:
            if feature.type=="CDS":
                count=count+1
                if "locus_tag" in feature.qualifiers.keys():
                    feature_name=feature.qualifiers["locus_tag"][0]
                elif "gene" in feature.qualifiers.keys(): 
                    feature_name=feature.qualifiers["gene"][0]
                else:
                    feature_name=feature.qualifiers["product"][0]
                feature_seq=feature.extract(g.seq)
                output.write(">"+str(feature_name)+"\n"+str(feature_seq)+"\n")
    print(str(count)+ " CDS sequences extracted from "+gbk)
    output.close()

def gbk_to_fasta(gbk, output):
    SeqIO.convert(gbk,"gb",output,"fasta")
    
def run_codonM(fasta, output, codonm_path="./scripts/codonR/codonM"):
    subprocess.call(["perl",codonm_path,fasta,output])
    
def run_codonW(fasta, output, codonw_path="./scripts/codonR/codonW/codonw"):
    options=["-enc","-gc","-gc3s","-L_aa","-nomenu","-nowarn"]
    subprocess.call([codonw_path,fasta, output]+options)
    

def extract_cds_annotations(gbfile, outputfile):
    out=open(outputfile,"w")
    out.write("title\tproduct\n")
    handle=SeqIO.parse(gbfile,"genbank")
    count=0
    for g in handle:
        for feature in g.features:
            if feature.type=="CDS":
                count=count+1
                if "locus_tag" in feature.qualifiers.keys():
                    feature_name=feature.qualifiers["locus_tag"][0]
                elif "gene" in feature.qualifiers.keys(): 
                    feature_name=feature.qualifiers["gene"][0]
                else:
                    feature_name=feature.qualifiers["product"][0]

                if "product" in feature.qualifiers.keys():
                    feature_product=feature.qualifiers["product"][0]
                else:
                    feature_product="unannotated"
                out.write(feature_name+"\t"+feature_product+"\n")

    out.close()
    print(str(count)+" annotated features in "+gbfile)
    
def extract_org_names(gbk):
    handle=SeqIO.parse(gbk,"genbank")
    count=0
    for g in handle:
        return g.annotations['source']
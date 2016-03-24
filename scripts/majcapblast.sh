#!/bin/bash
#SBATCH -n 16
#SBATCH -N 1
#SBATCH -o db.out
#SBATCH -e db.err
#SBATCH -p sched_mit_chisholm

module add engaging/ncbi-blast/2.2.30+

makeblastdb -in majcapprot.faa -dbtype prot

blastp -db majcapprot.faa -query DQ149023.2.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out DQ149023.2vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015289.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015289.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015287.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015287.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015286.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015286.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015282.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015282.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015281.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015281.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015279.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015279.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_006820.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_006820.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_020875.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_020875.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_020847.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_020847.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_021071.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_021071.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_020855.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_020855.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_019722.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_019722.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_015157.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_015157.1vs.majcapprot.out
blastp -db majcapprot.faa -query KJ545483.2.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out KJ545483.2vs.majcapprot.out
blastp -db majcapprot.faa -query HQ317393.2.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ317393.2vs.majcapprot.out
blastp -db majcapprot.faa -query NC_024369.2.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_024369.2vs.majcapprot.out
blastp -db majcapprot.faa -query NC_022747.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_022747.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_003313.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_003313.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_010275.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_010275.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_004456.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_004456.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_027368.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_027368.1vs.majcapprot.out
blastp -db majcapprot.faa -query NC_009016.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out NC_009016.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641354.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641354.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641353.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641353.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641352.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641352.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641351.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641351.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641350.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641350.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641349.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641349.1vs.majcapprot.out
blastp -db majcapprot.faa -query HQ641348.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HQ641348.1vs.majcapprot.out
blastp -db majcapprot.faa -query HG803181.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out HG803181.1vs.majcapprot.out
blastp -db majcapprot.faa -query FN297812.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out FN297812.1vs.majcapprot.out
blastp -db majcapprot.faa -query KC131130.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out KC131130.1vs.majcapprot.out
blastp -db majcapprot.faa -query AY129337.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out AY129337.1vs.majcapprot.out
blastp -db majcapprot.faa -query DQ398053.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out DQ398053.1vs.majcapprot.out
blastp -db majcapprot.faa -query EU826466.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out EU826466.1vs.majcapprot.out
blastp -db majcapprot.faa -query EU826467.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out EU826467.1vs.majcapprot.out
blastp -db majcapprot.faa -query EU826468.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out EU826468.1vs.majcapprot.out
blastp -db majcapprot.faa -query EU826469.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out EU826469.1vs.majcapprot.out
blastp -db majcapprot.faa -query EU826471.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out EU826471.1vs.majcapprot.out
blastp -db majcapprot.faa -query GQ303260.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out GQ303260.1vs.majcapprot.out
blastp -db majcapprot.faa -query GQ303262.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out GQ303262.1vs.majcapprot.out
blastp -db majcapprot.faa -query JF704092.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JF704092.1vs.majcapprot.out
blastp -db majcapprot.faa -query JF704096.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JF704096.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN204348.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN204348.1vs.majcapprot.out
blastp -db majcapprot.faa -query JF704116.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JF704116.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN412588.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN412588.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN412592.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN412592.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN624850.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN624850.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN699625.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN699625.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN699626.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN699626.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN699627.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN699627.1vs.majcapprot.out
blastp -db majcapprot.faa -query JN699013.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JN699013.1vs.majcapprot.out
blastp -db majcapprot.faa -query JQ911768.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out JQ911768.1vs.majcapprot.out
blastp -db majcapprot.faa -query KF006817.1.faa -outfmt 6 -num_descriptions 1 -evalue 0.001 -out KF006817.1vs.majcapprot.out

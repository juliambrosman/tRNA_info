
format_codon_m<-function(codonm, codonw){
    codon_w<-read.table(codonw, header=TRUE, sep="\t", na.strings="*****")
    codonm<-codonm%>%scan%>%matrix(ncol=61, byrow=T)
    rownames(codonm)<-codon_w$title
    ccn<-read.table("./scripts/codonR/codonm_colnames.txt", sep="\t")
    colnames(codonm)<-ccn$V2
    return(codonm)
}

gptr<-function(codonlist, gene){
        anti<-read.table("anti_codon_table.txt", header=TRUE, sep="\t")%>%filter(exact==1)
        codon_prop=vector()    
        codons_tested=vector()
        gene$codon<-rownames(gene)
        colnames(gene)[1]<-"count"
        merge(anti, gene, by="codon")->gene
        gene%>%filter(exact==1)%>%group_by(aa)%>%summarise(aa_count=sum(count))->aa_sum

        for (codon in codonlist){
            if (codon %in% gene$codon) {
            codons_tested=c(codons_tested, codon)
            a=gene$aa[which(codon==gene$codon)]
            n=gene$count[which(codon==gene$codon)]     #the number of exact match codons in the gene
            total=aa_sum$aa_count[which(a==aa_sum$aa)] #the total number of codons for the specific amino acid
            codon_prop=c(codon_prop, n/total)
        }}
        return(cbind.data.frame(codons_tested, codon_prop))
      }

Gptr<-function(codonlist, codonm){
    anti<-read.table("anti_codon_table.txt", header=TRUE, sep="\t")%>%filter(exact==1)
    genome_codon_prop=vector()
    codons_tested=vector()
    genome<-data.frame(colSums(codonm))
    genome$codon<-rownames(genome)
    colnames(genome)[1]<-"count"

    merge(anti, genome, by="codon")->genome

    genome%>%group_by(aa)%>%summarise(aa_count=sum(count))->genome_aa_sum

    for (codon in codonlist){
        if (codon %in% genome$codon){
        codons_tested=c(codons_tested, codon)
        a=genome$aa[which(codon==genome$codon)]
        n=genome$count[which(codon==genome$codon)]     #the number of exact match codons in the gene
        total=genome_aa_sum$aa_count[which(a==genome_aa_sum$aa)] #the total number of codons for the specific amino acid
        genome_codon_prop=c(genome_codon_prop, n/total)
        }}
        output<-cbind.data.frame(codons_tested, genome_codon_prop)
        return(output)
        }

calculate_genome_ptcs<-function(codonm, hcodonm=codonm, codonw, codonlist){
    Genome_rep<-Gptr(codonlist, hcodonm)
    gene_ptcs<-vector()
    for (i in seq(1:nrow(codonm))){
        Gene_rep<-gptr(codonlist, data.frame(codonm[i,]))
        Together<-merge(Genome_rep, Gene_rep, by="codons_tested")%>%mutate(pig=codon_prop/genome_codon_prop)
        ptcs<-mean(na.omit(Together$pig))
        gene_ptcs<-c(gene_ptcs, ptcs)
        }
    return(gene_ptcs)
}   

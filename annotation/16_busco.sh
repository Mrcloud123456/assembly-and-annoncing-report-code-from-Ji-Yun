#!/usr/bin/env bash
module load UHTS/Analysis/busco/4.1.4;
#cd /data/users/jyun/annotation
#mkdir 16_busco
#cd 16_busco
#busco -i /data/users/jyun/annotation/maker/run_mpi.maker.output/run_mpi.all.maker.proteins.fasta.renamed.fasta -l brassicales_odb10 -m proteins -c 8 -f --out 16_busco

cd /data/users/jyun/annotation
#mkdir 16_blast
cd 16_blast
module load Blast/ncbi-blast/2.10.1+;
#cp /data/courses/assembly-annotation-course/CDS_annotation/MAKER/uniprot_viridiplantae_reviewed.fa uniprot_viridiplantae_reviewed.fa
#makeblastdb -in uniprot_viridiplantae_reviewed.fa -dbtype prot
blastp -query /data/users/jyun/annotation/maker/run_mpi.maker.output/run_mpi.all.maker.proteins.fasta.renamed.fasta -db uniprot_viridiplantae_reviewed.fa -num_threads 10 -outfmt 6 -evalue 1e-10 -out blastp
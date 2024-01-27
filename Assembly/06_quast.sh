#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=128G
#SBATCH --time=12:00:00
#SBATCH --job-name=quast
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_quast_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_quast_%j.e

#cd /data/users/jyun/assembly_course/assessment/quast
#with reference
#mkdir reference
#cd reference
#mkdir canu
#mkdir flye

#cat /data/users/jyun/assembly_course/QC/participant_4/pacbio/ERR3415825.fastq.gz /data/users/jyun/assembly_course/QC/participant_4/pacbio/ERR3415826.fastq.gz > merged_pacbio.fastq

#/data/users/jyun/quast-5.2.0/quast.py /data/users/jyun/assembly_course/polishing/flye/pilon.fasta\
# -o /data/users/jyun/assembly_course/assessment/quast/reference/flye --labels flye\
# -t 20 -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz\
# -g /data/courses/assembly-annotation-course/references/TAIR10_GFF3_genes.gff\
# --no-sv --large --eukaryote --pacbio /data/users/jyun/assembly_course/assessment/quast/merged_pacbio.fastq

#/data/users/jyun/quast-5.2.0/quast.py /data/users/jyun/assembly_course/polishing/canu/pilon.fasta\
# -o /data/users/jyun/assembly_course/assessment/quast/reference/canu --labels canu\
# -t 20 -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa.gz\
# -g /data/courses/assembly-annotation-course/references/TAIR10_GFF3_genes.gff\
# --no-sv --large --eukaryote --pacbio /data/users/jyun/assembly_course/assessment/quast/merged_pacbio.fastq

#without reference
cd /data/users/jyun/assembly_course/assessment/quast
mkdir blank
cd blank
mkdir canu
mkdir flye
/data/users/jyun/quast-5.2.0/quast.py /data/users/jyun/assembly_course/polishing/flye/pilon.fasta\
 -o /data/users/jyun/assembly_course/assessment/quast/blank/flye --labels flye\
 -t 20  --est-ref-size 130000000\
 --no-sv --large --eukaryote --pacbio /data/users/jyun/assembly_course/assessment/quast/merged_pacbio.fastq

/data/users/jyun/quast-5.2.0/quast.py /data/users/jyun/assembly_course/polishing/canu/pilon.fasta\
 -o /data/users/jyun/assembly_course/assessment/quast/blank/canu --labels canu\
 -t 20  --est-ref-size 130000000\
 --no-sv --large --eukaryote --pacbio /data/users/jyun/assembly_course/assessment/quast/merged_pacbio.fastq

 
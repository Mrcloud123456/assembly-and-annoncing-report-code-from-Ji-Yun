#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=bowite
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_bowite_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_bowite_%j.e
#SBATCH --partition=pall
module add UHTS/Aligner/bowtie2/2.3.4.1;
module load UHTS/Analysis/MapSplice/2.2.1;
bowtie2-build /data/users/jyun/assembly_course/assembly/flye/scaffolds.fasta bowite_flye --threads 16;
bowtie2 -x bowite_flye --sensitive-local -1 /data/users/jyun/assembly_course/QC/participant_2/Illumina/ERR3624574_1.fastq.gz -2 /data/users/jyun/assembly_course/QC/participant_2/Illumina/ERR3624574_2.fastq.gz -S flye_bowite.sam --threads 16
samtools view -bS flye_bowite.sam -o flye_bowite.bam

bowtie2-build /data/users/jyun/canu-pacbio/canu.contigs.fasta bowite_canu --threads 16;
bowtie2 -x bowite_canu --sensitive-local -1 /data/users/jyun/assembly_course/QC/participant_2/Illumina/ERR3624574_1.fastq.gz -2 /data/users/jyun/assembly_course/QC/participant_2/Illumina/ERR3624574_2.fastq.gz -S canu_bowite.sam --threads 16
samtools view -bS canu_bowite.sam -o canu_bowite.bam
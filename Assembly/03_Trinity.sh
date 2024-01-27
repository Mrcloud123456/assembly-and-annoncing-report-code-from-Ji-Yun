#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=Trinity
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_Trinity_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_Trinity_%j.e
#SBATCH --partition=pcourseassembly
module load UHTS/Assembler/trinityrnaseq/2.5.1;
Trinity --seqType fq --left /data/users/jyun/assembly_course/QC/participant_2/RNAseq/SRR1734309_1.fastq.gz --right /data/users/jyun/assembly_course/QC/participant_2/RNAseq/SRR1734309_2.fastq.gz --CPU 16 --max_memory 63G 
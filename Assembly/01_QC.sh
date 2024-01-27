#!/usr/bin/env bash

#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/jyun/assembly_course/output/output_fastqc_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_fastqc_%j.e
#SBATCH --partition=pall

cd /data/users/jyun/assembly_course
mkdir QC
cd QC
ln -s /data/courses/assembly-annotation-course/raw_data/Ler/participant_2/ ./
module load UHTS/Quality_control/fastqc/0.11.9;
cd participant_2
fastqc ./Illumina/ERR3624574_1.fastq.gz Illumina/ERR3624574_2.fastq.gz pacbio/ERR3415825.fastq.gz pacbio/ERR3415826.fastq.gz RNAseq/SRR1734309_1.fastq.gz RNAseq/SRR1734309_2.fastq.gz -o /data/users/jyun/assembly_course/QC -t 6
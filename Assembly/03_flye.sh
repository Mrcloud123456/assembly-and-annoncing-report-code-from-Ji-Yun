#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=flye
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_flye_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_flye_%j.e
#SBATCH --partition=pall
module load UHTS/Assembler/flye/2.3.4;
flye -g 300m --pacbio-raw /data/users/jyun/assembly_course/QC/participant_2/pacbio/ERR3415825.fastq.gz /data/users/jyun/assembly_course/QC/participant_2/pacbio/ERR3415826.fastq.gz --out-dir /data/users/jyun/assembly_course/assembly --threads 8

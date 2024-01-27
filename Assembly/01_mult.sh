#!/usr/bin/env bash

#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/jyun/assembly_course/output/output_fastqc_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_fastqc_%j.e
#SBATCH --partition=pall

module load UHTS/Analysis/MultiQC
mkdir multiqc_output
multiqc /data/users/jyun/assembly_course/QC -o multiqc_output
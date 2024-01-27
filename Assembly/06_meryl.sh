#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH --job-name=meryl
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_meryl_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_meryl_%j.e

module add UHTS/Assembler/canu/2.1.1

# Define input (illumina) and output directories
course_dir=/data/users/jyun/assembly_course
illumina_dir=/data/users/jyun/assembly_course/QC/participant_4/Illumina
output_dir=/data/users/jyun/assembly_course/assessment/merqury

# Create meryl db (first for each read into $SCRATCH, then merge them and save in course directory)
meryl k=19 count output $SCRATCH/read_1.meryl ${illumina_dir}/*1.fastq.gz
meryl k=19 count output $SCRATCH/read_2.meryl ${illumina_dir}/*2.fastq.gz
meryl union-sum output ${output_dir}/illumina.meryl $SCRATCH/read*.meryl
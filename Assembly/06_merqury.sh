#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=merqury
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_merqury_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_merqury_%j.e

# Define input and output directories
course_dir=/data/users/jyun/assembly_course
meryl_dir=/data/users/jyun/assembly_course/assessment/merqury/illumina.meryl

# Run merqury
cd /data/users/jyun/assembly_course/assessment/merqury
mkdir canu
mkdir flye

cd canu
apptainer exec \
--bind ${course_dir} \
/software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
merqury.sh ${meryl_dir} /data/users/jyun/assembly_course/polishing/canu/pilon.fasta canu

cd /data/users/jyun/assembly_course/assessment/merqury/flye
apptainer exec \
--bind ${course_dir} \
/software/singularity/containers/Merqury-1.3-1.ubuntu20.sif \
merqury.sh ${meryl_dir} /data/users/jyun/assembly_course/polishing/flye/pilon.fasta flye
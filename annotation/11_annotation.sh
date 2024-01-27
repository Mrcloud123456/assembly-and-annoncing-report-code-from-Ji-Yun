#!/usr/bin/env bash

#SBATCH --cpus-per-task=50
#SBATCH --mem=64G
#SBATCH --time=10:00:00
#SBATCH --job-name=annotation
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_nucmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_nucmer_%j.e

COURSEDIR = /data/courses/assembly-annotation-course
WORKDIR = /data/users/jyun/annotation

cd $WORKDIR
singularity exec \
--bind $COURSEDIR \
--bind $WORKDIR \
$COURSEDIR/containers2/EDTA_v1.9.6.sif \
EDTA.pl \
--genome /data/users/ivilela/assembly_annotation_course/bowtie/pilonFlye.fasta \
--species others \
--step all \
--cds /data/courses/assembly-annotation-course/CDS_annotation \
--anno 1 \ 
--threads 50



#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=25G
#SBATCH --time=2:00:00
#SBATCH --job-name=maker
#SBATCH --output=/data/users/jyun/assembly_course/maker/output_nucmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/maker/error_nucmer_%j.e

COURSEDIR=/data/courses/assembly-annotation-course
WORKDIR=/data/users/jyun/assembly_course/maker

singularity exec --bind $WORKDIR --bind $COURSEDIR \
 $COURSEDIR/containers2/MAKER_3.01.03.sif \
 maker -CTL

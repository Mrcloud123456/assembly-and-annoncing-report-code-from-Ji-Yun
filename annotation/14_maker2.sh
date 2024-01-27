#!/usr/bin/env bash

#SBATCH --time=0-20:00:00
#SBATCH --mem-per-cpu=12G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --output=/data/users/jyun/annotation/maker/output/output_maker_%j.o
#SBATCH --error=/data/users/jyun/annotation/maker/output/error_maker_%j.e
cd /data/users/jyun/annotation/maker

COURSEDIR=/data/courses/assembly-annotation-course
WORKDIR=/data/users/jyun/annotation/maker

module load SequenceAnalysis/GenePrediction/maker/2.31.9;

mpiexec -n 16 \
singularity exec --bind $WORKDIR --bind $COURSEDIR \
 $COURSEDIR/containers2/MAKER_3.01.03.sif \
 maker -mpi -base run_mpi maker_opts.ctl maker_bopts.ctl maker_exe.ctl
#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=01:00:00
#SBATCH --job-name=canu
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_canu_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_canu_%j.e
#SBATCH --partition=pall

module load UHTS/Assembler/canu/2.1.1;
canu -p canu -d canu-pacbio genomeSize=3000m -pacbio\
 /data/users/jyun/assembly_course/QC/participant_2/pacbio/ERR3415825.fastq.gz \
 /data/users/jyun/assembly_course/QC/participant_2/pacbio/ERR3415826.fastq.gz \
 maxThreads=16 \
 maxMemory=128\
 gridEngineResourceOption="--cpus-per-task=THREADS --mem-per-cpu=MEMORY --time=1-00:00:00"\
 gridOptions="--mail-user=ji.yun@students.unibe.ch"
#!/usr/bin/env bash

#SBATCH --cpus-per-task=6
#SBATCH --mem-per-cpu=40000M
#SBATCH --time=01:00:00
#SBATCH --job-name=kmer
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_kmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_kmer_%j.e
#SBATCH --partition=pall

module load UHTS/Analysis/jellyfish/2.3.0
jellyfish histo /data/users/jyun/assembly_course/kmer/Illumina.jf > Illumina.histo
#http://genomescope.org/analysis.php?code=VWWP9kL6umaIg3AuLxVI
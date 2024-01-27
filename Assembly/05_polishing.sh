#!/usr/bin/env bash

#SBATCH --cpus-per-task=20
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=polishing
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_polishing_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_polishing_%j.e
#SBATCH --partition=pall
module load UHTS/Assembler/canu/2.1.1;
module load UHTS/Analysis/MapSplice/2.2.1;
samtools index canu_bowite.bam
samtools index flye_bowite.bam
java -Xmx45g -jar /mnt/software/UHTS/Analysis/pilon/1.22/bin/pilon-1.22.jar --genome /data/users/jyun/canu-pacbio/canu.contigs.fasta --bam canu_bowite.bam --threads 20 --outdir /data/users/jyun/assembly_course/polishing/canu
java -Xmx45g -jar /mnt/software/UHTS/Analysis/pilon/1.22/bin/pilon-1.22.jar --genome /data/users/jyun/assembly_course/assembly/scaffolds.fasta --bam flye_bowite.bam --threads 20 --outdir /data/users/jyun/assembly_course/polishing/flye
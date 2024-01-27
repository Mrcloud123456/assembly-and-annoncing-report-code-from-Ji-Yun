#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=40000M
#SBATCH --time=01:00:00
#SBATCH --job-name=kmer
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_kmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_kmer_%j.e
#SBATCH --partition=pall

cd /data/users/jyun/assembly_course_4
mkdir kmer
cd kmer
module load UHTS/Analysis/jellyfish/2.3.0

jellyfish count -C -m 21 -s 5G -o Illumina.jf -t 4 <(zcat /data/users/jyun/assembly_course/QC/participant_4/Illumina/ERR3624574_1.fastq.gz) <(zcat /data/users/jyun/assembly_course/QC/participant_4/Illumina/ERR3624574_2.fastq.gz)
jellyfish count -C -m 21 -s 5G -o pacbio.jf -t 4 <(zcat /data/users/jyun/assembly_course/QC/participant_4/pacbio/ERR3415825.fastq.gz) <(zcat /data/users/jyun/assembly_course/QC/participant_4/pacbio/ERR3415826.fastq.gz)
jellyfish count -C -m 21 -s 5G -o RNAseq.jf -t 4 <(zcat /data/users/jyun/assembly_course/QC/participant_4/RNAseq/SRR1734309_1.fastq.gz) <(zcat /data/users/jyun/assembly_course/QC/participant_4/RNAseq/SRR1734309_2.fastq.gz)

#!/usr/bin/env bash

#SBATCH --cpus-per-task=16
#SBATCH --mem=128G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=busco
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_busco_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_busco_%j.e
module load UHTS/Analysis/busco/4.1.4;
cd /data/users/jyun/assembly_course/assessment/busco
cp -r /software/SequenceAnalysis/GenePrediction/augustus/3.3.3.1/config augustus_config
export AUGUSTUS_CONFIG_PATH=./augustus_config

busco -i /data/users/jyun/assembly_course/assembly/trinity_out_dir/Trinity.fasta -f -l brassicales_odb10 -m transcriptome -o busco_RNA --cpu 16
busco -i /data/users/jyun/assembly_course/polishing/flye/pilon.fasta -f -l brassicales_odb10 -m genome -o busco_flye --cpu 16
busco -i /data/users/jyun/assembly_course/polishing/canu/pilon.fasta -f -l brassicales_odb10 -m genome -o busco_canu --cpu 16
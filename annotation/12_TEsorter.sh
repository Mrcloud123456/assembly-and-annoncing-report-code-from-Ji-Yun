#!/usr/bin/env bash

#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --time=10:00:00
#SBATCH --job-name=TEsorter
#SBATCH --output=/data/users/jyun/annotation/output/output_nucmer_%j.o
#SBATCH --error=/data/users/jyun/annotation/output/error_nucmer_%j.e
cd /data/users/jyun/annotation
module load UHTS/Analysis/SeqKit/0.13.2;
seqkit grep -r -p "Gypsy" /data/users/rschwob/01_assembly_annotation_course/results/5_annotate_TEs_1_EDTA/pilon_bt2_flye.fasta.mod.EDTA.TElib.fa > Gypsy.fasta
seqkit grep -r -p "Copia" /data/users/rschwob/01_assembly_annotation_course/results/5_annotate_TEs_1_EDTA/pilon_bt2_flye.fasta.mod.EDTA.TElib.fa > Copia.fasta
singularity exec \
--bind /data/courses/assembly-annotation-course \
--bind /data/users/jyun/annotation \
/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif \
TEsorter Gypsy.fasta -db rexdb-plant


singularity exec \
--bind /data/courses/assembly-annotation-course \
--bind /data/users/jyun/annotation \
/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif \
TEsorter Copia.fasta -db rexdb-plant

#seqkit grep -r -p "Copia" /data/courses/assembly-annotation-course/CDS_annotation/Brassicaceae_repbase_all_march2019.fasta > Copia_B.fasta
#seqkit grep -r -p "Gypsy" /data/courses/assembly-annotation-course/CDS_annotation/Brassicaceae_repbase_all_march2019.fasta > Gypsy_B.fasta

#singularity exec \
#--bind /data/courses/assembly-annotation-course \
#--bind /data/users/jyun/annotation \
#/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif \
#TEsorter Gypsy_B.fasta -db rexdb-plant

#singularity exec \
#--bind /data/courses/assembly-annotation-course \
#--bind /data/users/jyun/annotation \
#/data/courses/assembly-annotation-course/containers2/TEsorter_1.3.0.sif \
#TEsorter Copia_B.fasta -db rexdb-plant
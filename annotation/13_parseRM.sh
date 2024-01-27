#!/usr/bin/env bash

#SBATCH --cpus-per-task=50
#SBATCH --mem=64G
#SBATCH --time=10:00:00
#SBATCH --job-name=annotation
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_nucmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_nucmer_%j.e
module load UHTS/Analysis/SeqKit/0.13.2;
module load Phylogeny/FastTree/2.1.10
cd /data/users/jyun/annotation
module load Conda/miniconda/latest
conda create -n bioperl -c bioconda perl-bioperl
conda activate bioperl
conda install -c bioconda perl-bioperl

perl parseRM.pl -i /data/users/jyun/annotation/pilon_bt2_flye.fasta.mod.out -l 50,1 -v

sed -i '1d;3d' /data/users/jyun/annotation/pilon_bt2_flye.fasta.mod.out.landscape.Div.Rname.tab

grep Ty3-RT /data/users/jyun/annotation/Gypsy.fasta.rexdb-plant.dom.faa > ls_Gypsy #make a list of RT proteins to extract
grep Ty1-RT /data/users/jyun/annotation/Copia.fasta.rexdb-plant.dom.faa > ls_Copia

sed -i 's/>//' ls_Copia #remove ">" from the header
sed -i 's/ .\+//' ls_Copia #remove all characters following "empty space" from the header
seqkit grep -f ls_Copia /data/users/jyun/annotation/Copia.fasta.rexdb-plant.dom.faa -o Copia_RT.fasta
sed -i 's/|.\+//' Copia_RT.fasta
clustalo -i Copia_RT.fasta -o protein_alignment_Copia.fasta
FastTree -out protein_alignment_Copia.tree protein_alignment_Copia.fasta

cd /data/users/jyun/annotation/ls_Gypsy
sed -i 's/>//' ls_Gypsy #remove ">" from the header
sed -i 's/ .\+//' ls_Gypsy #remove all characters following "empty space" from the header
seqkit grep -f ls_Gypsy /data/users/jyun/annotation/Gypsy.fasta.rexdb-plant.dom.faa -o Gypsy_RT.fasta
sed -i 's/|.\+//' Gypsy_RT.fasta
clustalo -i Gypsy_RT.fasta -o protein_alignment_Gypsy.fasta


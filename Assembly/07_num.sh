#!/usr/bin/env bash

#SBATCH --cpus-per-task=12
#SBATCH --mem=64G
#SBATCH --time=5:00:00
#SBATCH --job-name=nucmer
#SBATCH --mail-type=begin,end
#SBATCH --mail-user=ji.yun@students.unibe.ch
#SBATCH --output=/data/users/jyun/assembly_course/output/output_nucmer_%j.o
#SBATCH --error=/data/users/jyun/assembly_course/output/error_nucmer_%j.e
#cd /data/users/jyun/assembly_course/comparing/flye
module add UHTS/Analysis/mummer/4.0.0beta1
#nucmer /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
# /data/users/jyun/assembly_course/polishing/flye/pilon.fasta -b 1000 -c 1000
export PATH=/software/bin:$PATH
#mummerplot -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
# -Q /data/users/jyun/assembly_course/polishing/flye/pilon.fasta -t png -f --large --layout --fat\
# /data/users/jyun/assembly_course/comparing/flye/out.delta


#cd /data/users/jyun/assembly_course/comparing/canu
#nucmer /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
# /data/users/jyun/assembly_course/polishing/canu/pilon.fasta -b 1000 -c 1000
#mummerplot -R /data/courses/assembly-annotation-course/references/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa\
# -Q /data/users/jyun/assembly_course/polishing/canu/pilon.fasta -t png -f --large --layout --fat\
# /data/users/jyun/assembly_course/comparing/canu/out.delta


cd /data/users/jyun/assembly_course/comparing/cvf
nucmer /data/users/jyun/assembly_course/polishing/flye/pilon.fasta\
 /data/users/jyun/assembly_course/polishing/canu/pilon.fasta -b 1000 -c 1000
mummerplot -R /data/users/jyun/assembly_course/polishing/flye/pilon.fasta\
 -Q /data/users/jyun/assembly_course/polishing/canu/pilon.fasta -t png -f --large --layout --fat\
 /data/users/jyun/assembly_course/comparing/cvf/out.delta
#!/usr/bin/env bash

module load SequenceAnalysis/GenePrediction/maker/2.31.9;
SCRATCH=/data/users/jyun/annotation/maker
export TMPDIR=$SCRATCH
cd /data/users/jyun/annotation/maker
base="run_mpi"
cd ${base}.maker.output
#gff3_merge -d ${base}.datastore_index.log -o ${base}.all.maker.gff
#gff3_merge -d ${base}.datastore_index.log -n -o ${base}.all.maker.noseq.gff
#fasta_merge -d ${base}.datastore_index.log -o ${base}

module load SequenceAnalysis/GenePrediction/maker/2.31.9
#cd ${base}.maker.output
protein=${base}.all.maker.proteins.fasta
transcript=${base}.all.maker.transcripts.fasta
gff=${base}.all.maker.noseq.gff
prefix=${base}_
cp $gff ${gff}.renamed.gff
cp $protein ${protein}.renamed.fasta
cp $transcript ${transcript}.renamed.fasta
maker_map_ids --prefix $prefix --justify 7 ${gff}.renamed.gff > ${base}.id.map
map_gff_ids ${base}.id.map ${gff}.renamed.gff
map_fasta_ids ${base}.id.map ${protein}.renamed.fasta
map_fasta_ids ${base}.id.map ${transcript}.renamed.fasta

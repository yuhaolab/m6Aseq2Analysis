#!/bin/bash -V

##conda activate rna-seq
cd /home/yh/3-tool-ref/m6aatlas/bam/ip20k
bampath=/home/yh/3-tool-ref/m6aatlas/bam/bamstranded
for i in `ls *.bam`;
do
	bash /home/yh/3-tool-ref/m6aatlas/peakcalling/splitbam.sh $i $bampath
done

cd /home/yh/3-tool-ref/m6aatlas/bam/input20k6m
for i in `ls *.bam`;
do
	bash /home/yh/3-tool-ref/m6aatlas/peakcalling/splitbam.sh $i $bampath
done
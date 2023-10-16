#!/bin/bash -V

##conda activate rna-seq
cd /home/yh/3-tool-ref/m6aatlas/bam/input
bampath=/home/yh/3-tool-ref/m6aatlas/bam
for i in `ls *.bam`;
do
	samtools view -h -q 60 $i | grep -P "(NH:i:1|^@)" | samtools view -Sb - > ${bampath}/inputfilter/${i}
	samtools index ${bampath}/inputfilter/${i}
	samtools view -h ${bampath}/inputfilter/${i} | awk 'substr($0,1,1)=="@" || ($9>-20000 && $9<20000)' | samtools view -Sb \
		> ${bampath}/input20k/${i/bam/20k.bam}
	samtools index ${bampath}/input20k/${i/bam/20k.bam}
done
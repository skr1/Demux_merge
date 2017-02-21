#!/bin/sh
##A Script to merge sample-specific fastqs spreaded across different lanes.
##Author: Shrey Sukhadia.
##Run it as: ./Merge.sh
##To execute this script you should be already inside the "Unaligned" folder under the Hiseq run-folder. Put this script under "Unaligned" folder and then execute it from there.

for j in `awk -F "," '{print $3}' ../../SampleSheet.csv | grep -v 'Sample_ID' | sort |uniq`
do
zcat Sample_$j/$j*R1*gz > Sample_$j/$j.R1.fastq
echo "R1 done for Sample_$j"
zcat Sample_$j/$j*R2*gz > Sample_$j/$j.R2.fastq
echo "R2 done for Sample_$j"
zcat Sample_$j/$j*R3*gz > Sample_$j/$j.R3.fastq
echo "R3 done for Sample_$j"
gzip Sample_$j/*fastq
done

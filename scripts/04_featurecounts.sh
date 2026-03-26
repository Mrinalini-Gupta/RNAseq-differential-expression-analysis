#!/bin/bash
set -euo pipefail

mkdir -p results/counts

GTF="/user/home/qo25519/RNA_seq/Genome/Homo_sapiens.GRCh38.115.gtf"

featureCounts \
-a ${GTF} \
-o results/counts/gene_counts.txt \
results/alignment/Mock_1.sorted.bam \
results/alignment/Mock_2.sorted.bam \
results/alignment/Mock_3.sorted.bam \
results/alignment/SARS_CoV_2_1.sorted.bam \
results/alignment/SARS_CoV_2_2.sorted.bam 
echo "featureCounts complete."

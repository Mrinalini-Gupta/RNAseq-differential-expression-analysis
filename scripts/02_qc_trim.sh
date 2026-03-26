#!/bin/bash
set -euo pipefail

mkdir -p trimmed_data results/qc

for SAMPLE in Mock_1 Mock_2 Mock_3 SARS_CoV_2_1 SARS_CoV_2_2
do
    echo "Running fastp on ${SAMPLE}"

    fastp \
    -i merged_data/${SAMPLE}.fastq.gz \
    -o trimmed_data/${SAMPLE}.trimmed.fastq.gz \
    --html results/qc/${SAMPLE}_fastp.html \
    --json results/qc/${SAMPLE}_fastp.json \
    --length_required 30
done

echo "Trimming complete."

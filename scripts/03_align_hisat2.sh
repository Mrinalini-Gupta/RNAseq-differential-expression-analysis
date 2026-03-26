#!/bin/bash
set -euo pipefail

mkdir -p results/alignment

INDEX="/user/home/qo25519/RNA_seq/Genome/index_hisat2/grch38/genome"
THREADS="${SLURM_CPUS_PER_TASK:-4}"

for SAMPLE in Mock_1 Mock_2 Mock_3 SARS_CoV_2_1 SARS_CoV_2_2
do
    echo "Aligning ${SAMPLE}"

    TMP_SAMPLE="${TMPDIR:-/tmp}/sort_${USER}_${SAMPLE}"
    mkdir -p "${TMP_SAMPLE}"

    hisat2 \
        -p "${THREADS}" \
        -x "${INDEX}" \
        -U "trimmed_data/${SAMPLE}.trimmed.fastq.gz" \
        --summary-file "results/alignment/${SAMPLE}_summary.txt" \
        2> "results/alignment/${SAMPLE}.log" \
    | samtools sort \
        -@ "${THREADS}" \
        -T "${TMP_SAMPLE}/${SAMPLE}" \
        -o "results/alignment/${SAMPLE}.sorted.bam"

    samtools index "results/alignment/${SAMPLE}.sorted.bam"

    rm -rf "${TMP_SAMPLE}"
done

echo "Alignment complete."

#!/bin/bash
set -euo pipefail

mkdir -p raw_data merged_data

download_and_merge () {
    SAMPLE_NAME=$1
    shift
    RUNS=("$@")

    echo "Processing ${SAMPLE_NAME}"

    for RUN in "${RUNS[@]}"; do
        if [ -f "raw_data/${RUN}.fastq.gz" ]; then
            echo "${RUN} already exists, skipping download."
            continue
        fi

        if [ -f "raw_data/${RUN}.fastq" ]; then
            echo "${RUN}.fastq exists, compressing."
            gzip -f "raw_data/${RUN}.fastq"
            continue
        fi

        echo "Downloading ${RUN}"
        prefetch "${RUN}"
        fasterq-dump "${RUN}" -e 8 -O raw_data
        gzip -f "raw_data/${RUN}.fastq"
    done

    echo "Merging runs for ${SAMPLE_NAME}"
    cat $(printf "raw_data/%s.fastq.gz " "${RUNS[@]}") > "merged_data/${SAMPLE_NAME}.fastq.gz"
}
download_and_merge "Mock_1" SRR11412215 SRR11412216 SRR11412217 SRR11412218
download_and_merge "Mock_2" SRR11412219 SRR11412220 SRR11412221 SRR11412222
download_and_merge "Mock_3" SRR11412223 SRR11412224 SRR11412225 SRR11412226 
download_and_merge "SARS_CoV_2_1" SRR11412227 SRR11412228 SRR11412229 SRR11412230
download_and_merge "SARS_CoV_2_2" SRR11412231 SRR11412232 SRR11412233 SRR11412234

echo "All downloads and merges complete."

# RNA-seq Differential Expression Analysis of SARS-CoV-2 Infection in NHBE Cells

## Overview
This project presents a reproducible RNA-seq differential expression workflow to investigate the host transcriptional response of normal human bronchial epithelial (NHBE) cells to SARS-CoV-2 infection.

The analysis includes:
- download of public RNA-seq data
- quality control and read trimming
- alignment to the human reference genome
- gene-level quantification
- differential expression analysis with DESeq2
- visualization using volcano plot, PCA, and heatmap

---

## Biological Question
Which host genes are differentially expressed in NHBE cells following SARS-CoV-2 infection compared with mock-treated controls?

---

## Dataset
Public RNA-seq data were obtained from NCBI SRA from a SARS-CoV-2 host-response study in NHBE cells.

### Samples used
- Mock_1
- Mock_2
- Mock_3
- SARS_CoV_2_1
- SARS_CoV_2_2

---

## Project Structure

 RNAseq-differential-expression-analysis/n
â|--- metadata/n
â|    |--- samplesheet.csv
â|--- scripts/n
â|    |--- 01_download_data.sh
â|    |--- 02_qc_trim.sh
â|    |--- 03_align_hisat2.sh
â|    |--- 04_featurecounts.sh
â|    |--- 05_deseq2_analysis.R
â|    |--- 06_pretty_plots.R
â|--- results/
â|    |--- plots/
â|    |--- tables/
â|--- docs/
â|--- README.md
â|--- .gitignore

## Software and Requirements

### HPC modules
- module load fastp
- module load hisat2
- module load samtools
- module load subread
- module load R

### R packages
- install.packages("BiocManager")
- BiocManager::install("DESeq2")
- install.packages("ggplot2")
- install.packages("pheatmap")

## Reference Files
- Reference Files Reference genome: GRCh38
- Gene annotation: Homo_sapiens.GRCh38.110.gtf

## Reproducible Workflow 
1. Download sequencing data
	bash scripts/01_download_data.sh
 
2. Perform quality control and trimming 
	bash scripts/02_qc_trim.sh 

3. Align reads to the human genome 
	bash scripts/03_align_hisat2.sh 

4. Quantify reads at gene level 
	bash scripts/04_featurecounts.sh 

5. Run differential expression analysis 
	Rscript scripts/05_deseq2_analysis.R 

6. Generate publication-style plots 
	Rscript scripts/06_plots 

## Analysis Summary 
- Reads were processed with fastp to remove low-quality bases and improve downstream alignment quality.

- Trimmed reads were aligned to the human reference genome using HISAT2, and alignments were sorted and indexed using SAMtools. 

- Gene-level counts were generated using featureCounts. 

- Differential expression analysis was performed using DESeq2 with condition design: ~ condition, low-count gene filtering and sfType = "poscounts" to handle sparse count structure 

## Key Outputs 
Figures: Located in results/plots/ 
- volcano_plot_pretty.png 
- PCA_plot.png 
- top30_heatmap.png 

Tables: Located in results/tables/
- DESeq2_results.csv 
- normalized_counts.csv
- significant_genes_padj_lt_0.05.csv

## Reproducibility Notes
- Raw FASTQ files, BAM files, and other large intermediate outputs are excluded from the GitHub repository using .gitignore. 

- All analysis steps are scripted and reproducible from raw public data accessions. 

- This repository contains only scripts, metadata, processed result tables, and figures.

## Limitations 
- One infected replicate (`SARS_CoV_2_3`) was excluded because of corrupted sequence output during preprocessing.
- The final differential expression analysis therefore used 5 samples instead of the original 6.

## Future Work 
Potential extensions of this project include: 
- Pathway enrichment analysis
- Gene Ontology enrichment 
- KEGG pathway analysis
- Annotation of top interferon-stimulated or immune-response genes

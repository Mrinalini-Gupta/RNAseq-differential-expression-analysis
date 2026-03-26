## Introduction
  
Severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2), the causative agent of COVID-19, has emphasized the need to understand host transcriptional responses to viral infection. RNA sequencing enables genome-wide analysis of gene expression changes in infected cells. Previous studies report that SARS-CoV-2 induces an atypical immune response, characterized by reduced type I and III interferon signaling alongside elevated pro-inflammatory cytokine expression (Blanco-Melo et al., 2020). In this study, we analyze RNA-seq data from NHBE cells to identify differentially expressed genes associated with SARS-CoV-2 infection, providing insights into host antiviral responses and inflammation pathways.
---

## Methods

RNA-seq data were obtained from the Gene Expression Omnibus(GEO) dataset GSE147507 (Blanco-Melo et al., 2020), which includes transcriptomic profiles of human bronchial epithelial (NHBE) cells under mock-treated and SARS-CoV-2-infected conditions. The dataset consists of biological replicates for each condition, generated using high-throughput sequencing. Raw sequencing reads were processed using fastp for quality control and adapter trimming. Cleaned reads were aligned to the human reference genome (GRCh38) using HISAT2. Resulting alignments were sorted and indexed with SAMtools. Gene-level counts were generated using featureCounts based on GTF annotation. Differential expression analysis was performed in R using DESeq2 with a design formula of ~ condition. Low-count genes were filtered prior to analysis, and size factors were estimated using the "poscounts" method to account for zero-inflated data.
---

## Results

   ### 3.1 Quality Control Summary
   ### 3.2 Alignment Statistics
   ### 3.3 Differential Expression Results
   ### 3.4 PCA Analysis
   ### 3.5 Volcano Plot Interpretation
   ### 3.6 Heatmap Interpretation

## Discussion
   - Biological meaning of results
   - Host response explanation
   - Limitations (missing replicate)
   - Reliability

## Conclusion
   - What was achieved

## References

Blanco-Melo, D., Nilsson-Payant, B. E., Liu, W. C., Uhl, S., Hoagland, D., Møller, R., Jordan, T. X., Oishi, K., Panis, M., Sachs, D., Wang, T. T., Schwartz, R. E., Lim, J. K., & tenOever, B. R. (2020). SARS-CoV-2 launches a unique transcriptional signature from in vitro, ex vivo, and in vivo systems. Cell, 181(5), 1036-1045.e9.

Blanco-Melo D, Nilsson-Payant BE, Liu WC, Uhl S et al. Imbalanced Host Response to SARS-CoV-2 Drives Development of COVID-19. Cell 2020 May 28;181(5):1036-1045.e9. PMID: 32416070

Daamen AR, Bachali P, Owen KA, Kingsmore KM et al. Comprehensive transcriptomic analysis of COVID-19 blood, lung, and airway. Sci Rep 2021 Mar 29;11(1):7052. PMID: 33782412


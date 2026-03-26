## Introduction
  
Severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2), the causative agent of COVID-19, has emphasized the need to understand host transcriptional responses to viral infection. 
RNA sequencing enables genome-wide analysis of gene expression changes in infected cells. Previous studies report that SARS-CoV-2 induces an atypical immune response, characterized by reduced type I and III interferon signaling alongside elevated pro-inflammatory cytokine expression (Blanco-Melo et al., 2020). In this study, we analyze RNA-seq data from NHBE cells to identify differentially expressed genes associated with SARS-CoV-2 infection, providing insights into host antiviral responses and inflammation pathways.

---

## Methods

RNA-seq data were obtained from the Gene Expression Omnibus(GEO) dataset GSE147507 (Blanco-Melo et al., 2020), which includes transcriptomic profiles of human bronchial epithelial (NHBE) cells under mock-treated and SARS-CoV-2-infected conditions. The dataset consists of biological replicates for each condition, generated using high-throughput sequencing. 
Raw sequencing reads were processed using fastp for quality control and adapter trimming. Cleaned reads were aligned to the human reference genome (GRCh38) using HISAT2. Resulting alignments were sorted and indexed with SAMtools. Gene-level counts were generated using featureCounts based on GTF annotation. Differential expression analysis was performed in R using DESeq2 with a design formula of ~ condition. Low-count genes were filtered prior to analysis, and size factors were estimated using the "poscounts" method to account for zero-inflated data.

---

## Results

### 3.1 Quality Control Summary

Quality control and adapter trimming were performed using fastp for all retained samples. Overall sequencing quality was high before and after filtering, with Q20 values above 95% and Q30 values above 91% across samples, indicating that most bases were of good quality. GC content remained stable at approximately 49-51% before and after filtering, suggesting no major compositional bias introduced during preprocessing. The majority of reads passed filters in all samples, with approximately 98.7-98.8% retained after trimming. Only a small proportion of reads were removed because of low quality, excessive ambiguous bases, or short length. These results indicate that the sequencing reads were of sufficient quality for downstream alignment and differential expression analysis.

### 3.2 Alignment Statistics

Trimmed reads were aligned to the human reference genome (GRCh38) using HISAT2. Alignment rates were consistently high across all retained samples, ranging from 97.59% to 97.97%. Most reads mapped uniquely to the genome (approximately 93.1-94.1%), while a smaller fraction mapped to multiple locations (approximately 3.8-4.7%). Only about 2.0-2.4% of reads remained unmapped. These results indicate that the sequencing reads were of high quality and well matched to the reference genome, supporting reliable downstream quantification and differential expression analysis.

### 3.3 Gene Quantification Summary

Gene-level quantification was performed using featureCounts. The number of reads successfully assigned to annotated genes was high across all retained samples, ranging from 4.68 million to 18.78 million reads. Mock samples and one infected sample showed particularly strong assignment counts, while SARS_CoV_2_2 had a lower but still usable number of assigned reads. The main categories of unassigned reads were ambiguity, multimapping, lack of annotated features, and unmapped reads. No substantial losses were observed for mapping quality, chimeric reads, secondary alignments, or duplicate assignments. Overall, the quantification results were sufficient for downstream differential expression analysis.

### 3.3 Differential Expression Results

DESeq2 identified a large number of genes with statistically significant expression changes between mock-treated and SARS-CoV-2-infected NHBE cells. Several of the top differentially expressed genes had extremely small adjusted p-values, indicating a robust transcriptional response to infection. Among the most significant results, many genes showed positive log2 fold-change values of approximately 1.5 to 3.2, consistent with strong upregulation in infected cells, while other genes showed negative fold changes, indicating downregulation.
Normalized count values confirmed that sequencing-depth differences had been appropriately corrected across samples. Although some genes showed zero counts across all samples, which is common in RNA-seq data, the overall dataset contained a strong and biologically meaningful differential expression signal suitable for downstream visualization and interpretation.

### 3.5 Volcano Plot

The volcano plot showed a clear pattern of differential expression between mock and SARS-CoV-2-infected samples. Most of the highly significant genes were located on the positive side of the log2 fold-change axis, indicating widespread upregulation in response to infection. Several genes showed both large fold changes and extremely small adjusted p-values, highlighting them as the strongest transcriptional responders. A smaller set of significantly downregulated genes was also observed on the negative side of the plot. Overall, the volcano plot indicates that SARS-CoV-2 infection induces a pronounced host transcriptional response dominated by gene activation.

### 3.4 PCA Analysis

Principal component analysis (PCA) of the variance-stabilized count data showed clear separation between mock-treated and SARS-CoV-2-infected samples along the first principal component (PC1), which explained 64% of the total variance. All mock samples clustered on the negative side of PC1, whereas infected samples clustered on the positive side, indicating that infection status is the major source of variation in the dataset. The second principal component (PC2), which explained 17% of the variance, captured variability within each condition, particularly among the mock replicates. Overall, the PCA plot demonstrates that SARS-CoV-2 infection produces a strong and distinct transcriptional shift in NHBE cells.

### 3.6 Heatmap Interpretation

The heatmap of the top 30 differentially expressed genes revealed a strong condition-specific expression pattern. The three mock samples clustered together on one side of the dendrogram, while the two SARS-CoV-2-infected samples clustered together on the other, indicating clear separation by treatment condition. Across most of the displayed genes, mock samples showed relatively lower normalized expression values, whereas infected samples showed consistently higher expression levels. This suggests that the top differentially expressed genes are predominantly induced in response to SARS-CoV-2 infection. The heatmap therefore provides additional evidence that infection status is the primary source of transcriptional variation in this dataset.

 
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


library(DESeq2)
library(ggplot2)

counts <- read.delim("results/counts/gene_counts.txt", comment.char = "#")
countdata <- counts[,7:ncol(counts)]
rownames(countdata) <- counts$Geneid

colnames(countdata) <- c("Mock_1","Mock_2","Mock_3",
                         "SARS_CoV_2_1","SARS_CoV_2_2")

coldata <- data.frame(
  row.names = colnames(countdata),
  condition = factor(c("Mock","Mock","Mock",
                       "SARS_CoV_2","SARS_CoV_2"))
)

dds <- DESeqDataSetFromMatrix(
  countData = round(countdata),
  colData = coldata,
  design = ~ condition
)

dds <- DESeq(dds, sfType = "poscounts")
res <- results(dds)
resOrdered <- res[order(res$padj),]

write.csv(as.data.frame(resOrdered), "results/tables/DESeq2_results.csv")

normalized_counts <- counts(dds, normalized = TRUE)
write.csv(as.data.frame(normalized_counts), "results/tables/normalized_counts.csv")

res_df <- as.data.frame(resOrdered)

png("results/plots/volcano_plot.png", width = 1000, height = 800)
plot(res_df$log2FoldChange,
     -log10(res_df$padj),
     pch = 20,
     xlab = "log2 Fold Change",
     ylab = "-log10 adjusted p-value",
     main = "NHBE SARS-CoV-2 vs Mock")
dev.off()

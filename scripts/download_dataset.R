#install.packages("UCSCXenaTools")
#install.packages("tidyverse")

#load libraries
library(UCSCXenaTools)
library(tidyverse)

#load XenaData ## UPDATE IF required
data(XenaData)

# select dataset
stad_datasets <- XenaData %>%
  filter(str_detect(XenaCohorts, "TCGA Stomach Cancer"))

#Generate Queries
query_expr <- XenaGenerate(subset = XenaDatasets == "TCGA.STAD.sampleMap/HiSeqV2_PANCAN")
query_clin <- XenaGenerate(subset = XenaDatasets == "TCGA.STAD.sampleMap/STAD_clinicalMatrix")

#Download and prepare data

expr_data <- XenaQuery(query_expr) %>%
  XenaDownload() %>%
  XenaPrepare()

clinical_data <- XenaQuery(query_clin) %>%
  XenaDownload() %>%
  XenaPrepare()

write.csv(expr_data, "../results/TCGA_STAD_expr_PANCAN.csv")
write.csv(clinical_data, "../results/TCGA_STAD_clinical.csv")

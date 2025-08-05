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
query_expr <- XenaGenerate(
  dataset = ""
)
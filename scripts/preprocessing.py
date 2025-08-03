# Preprocessing script for gene expression data
import pandas as pd

def normalize_expresssion(df):
  return df.div(df.sum(axis=0), axis=1)

def filter_genes(df, gene_list):
   return df[df.index.isin(gene_list)]


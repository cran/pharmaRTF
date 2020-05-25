## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(tidyverse)
library(pharmaRTF)
library(readxl)

## ----requirements, echo=FALSE-------------------------------------------------
requirements <- data.frame(
  Variable = c('type', 'text1', 'text2', 'align', 'bold', 'italic', 'font', 'font_size', 'index'),
  `Column Types`= c('character', 'character', 'character', 'character', 'logical', 'logical', 'character', 'numeric', 'numeric'),
  Required = c('Yes', 'Yes', 'No', 'No', 'No', 'No', 'No', 'No', 'No')
)

knitr::kable(requirements)

## ----example_file, echo=FALSE-------------------------------------------------
knitr::kable(read_excel('titles.xlsx'))


## ----example_custom_reader----------------------------------------------------
example_custom_reader <- function(..., table_number=NULL) {

  # If a column isn't populated then the type may be guessed wrong so force it
  col_types <- c('text', 'numeric', 'text', 'text', 'text', 'text', 'logical', 'logical')
  # pass through arguments from ...
  df <- readxl::read_excel(..., col_types=col_types)

  # Subset and return that dataframe
  df[df$table_number==table_number, !names(df) == 'table_number']
}


## ----use_custom_Reader--------------------------------------------------------
example_custom_reader('titles.xlsx', table_number = '14-2.01')

## ----prep_huxtable, echo=FALSE, results='hide'--------------------------------
huxtable::as_hux(load('t14_4_01.Rdata'))

## ----show_huxtable, echo=FALSE------------------------------------------------
ht

## ----create_rtfdoc, eval=FALSE------------------------------------------------
#  doc <- rtf_doc(ht, header_rows = 2) %>% titles_and_footnotes_from_df(
#    from.file='../data/titles.xlsx',
#    reader=example_custom_reader,
#    table_number='14-4.01') %>%
#    set_column_header_buffer(top=1) %>%
#    set_font_size(10)
#  
#  write_rtf(doc, file="table16.rtf")

## ----table1_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table16_img1.png")


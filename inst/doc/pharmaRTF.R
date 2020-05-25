## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(tidyverse)
library(pharmaRTF)

## ----huxtable_code------------------------------------------------------------
dat <- iris %>% 
  select(Species, everything())

ht <- huxtable::as_hux(dat, add_colnames=TRUE) %>% 
  huxtable::set_bold(1, 1:ncol(dat), TRUE) %>% 
  huxtable::set_bottom_border(1, 1:ncol(dat), 1) %>% 
  huxtable::set_width(1.5)
ht[1:10]

## ----table1, eval=FALSE-------------------------------------------------------
#  doc <- rtf_doc(ht, titles=list(hf_line("The Iris Dataset", bold=TRUE)))
#  
#  write_rtf(doc, file="table1.rtf")
#  

## ----table1_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table1_img1.png")

## ----table1_img2, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table1_img2.png")

## ----table2, eval = FALSE-----------------------------------------------------
#  doc <- rtf_doc(ht, titles=list(hf_line("The Iris Dataset", bold=TRUE))) %>%
#    set_pagesize(c(height=5, width=5)) %>%
#    set_font('Times New Roman') %>%
#    set_margins(c(top=2, bottom=2, left=2, right=2)) %>%
#    set_font_size(7)
#  
#  write_rtf(doc, file="table2.rtf")
#  

## ----table2_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table2_img1.png")

## ----table3, eval = FALSE-----------------------------------------------------
#  doc <- rtf_doc(ht)
#  font(doc) <- 'Times New Roman'
#  font_size(doc) <- 10
#  doc <- add_titles(doc, hf_line("The Iris Dataset", bold=TRUE))
#  doc <- add_footnotes(doc, hf_line("Note: This is a footnote!", italic=TRUE, align='left'))
#  
#  write_rtf(doc, file="table3.rtf")

## ----table3_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table3_img1.png")


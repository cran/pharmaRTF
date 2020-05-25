## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(tidyverse)
library(pharmaRTF)

## ----orientation1-------------------------------------------------------------
ht <- huxtable::as_hux(iris, add_colnames=TRUE) %>% 
  huxtable::set_width(1.2)

doc <- rtf_doc(ht)
pagesize(doc)


## ----orientation2-------------------------------------------------------------
doc <- rtf_doc(ht) %>% 
  # Set orientation to portrait
  set_orientation('portrait')

# Page size does not change
pagesize(doc)


## ----orientation3, echo=FALSE, eval=FALSE-------------------------------------
#  write_rtf(doc, file="table5.rtf")
#  

## ----table5_img1, out.width = "400px", echo = FALSE---------------------------
knitr::include_graphics("table5_img1.png")

## ----column_headers1----------------------------------------------------------
# Create the column headers data frame
column_headers <- data.frame(
  Species = c("", "Species of Flower"),
  Sepal.Length = c("Sepal", "Length"),
  Sepal.Width = c("", "Width"),
  Petal.Length = c("Petal", "Length"),
  Petal.Width = c("", "Width"),
  stringsAsFactors = FALSE
)

# Create the huxtable table
ht <- huxtable::as_hux(rbind(column_headers, iris)) %>% 
  # Merge the Sepal cell over the Length and Width
  huxtable::merge_cells(1, 2:3) %>% 
  # Merge the Petal cell over the Length and Width
  huxtable::merge_cells(1, 4:5) %>% 
  # Align the top cells for both Sepal and Petal
  huxtable::set_align(1,2, 'center') %>% 
  huxtable::set_align(1,4, 'center') %>% 
  # Bold all the column header rows
  huxtable::set_bold(1:2, 1:ncol(iris), TRUE) %>% 
  # Bottom border on 1st column header row 
  huxtable::set_bottom_border(1, 2:4, 1) %>% 
  # Bottom border on 2nd row
  huxtable::set_bottom_border(2, 1:ncol(iris), 2) %>% 
  # Set the page width
  huxtable::set_width(1.5)

ht[1:10]

## ----column_headers2, eval=FALSE----------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2)
#  
#  write_rtf(doc, file="table6.rtf")
#  

## ----table6_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table6_img1.png")

## ----ignore_cell_padding, eval=FALSE------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    set_ignore_cell_padding(TRUE)
#  
#  # Or avoiding piping
#  ignore_cell_padding(doc) <- TRUE
#  
#  write_rtf(doc, file="table7.rtf")
#  

## ----table7_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table7_img1.png")

## ----column_header_buffer1, eval=FALSE----------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    set_ignore_cell_padding(TRUE) %>%
#    set_column_header_buffer(top=2, bottom=1) %>%
#    add_titles(hf_line("The Iris Dataset", bold=TRUE, font_size=20))
#  
#  
#  write_rtf(doc, file="table8.rtf")
#  

## ----table8_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table8_img1.png")

## ----hf_line------------------------------------------------------------------
hf_line('Text1', 'Text2')

## ----column_header_buffer2, eval=FALSE----------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("I'm on the left", "I'm on the right", bold=TRUE, align='split'))
#  
#  
#  write_rtf(doc, file="table9.rtf")
#  

## ----table9_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table9_img1.png")

## ----page_format1, eval=FALSE-------------------------------------------------
#  hf_line('PAGE_FORMAT: Page %s of %s")

## ----page_format2, eval=FALSE-------------------------------------------------
#  hf_line('PAGE_FORMAT: %s | %s")

## ----page_format3, eval=FALSE-------------------------------------------------
#  hf_line('PAGE_FORMAT: Page %s")

## ----page_format4, eval=FALSE-------------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("PAGE_FORMAT: Page %s of %s", bold=TRUE, align='right'))
#  
#  
#  write_rtf(doc, file="table10.rtf")

## ----table10_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table10_img1.png")

## ----page_format5, eval=FALSE-------------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("Text on the left", "PAGE_FORMAT: Page %s of %s", bold=TRUE, align='split'))
#  
#  
#  write_rtf(doc, file="table11.rtf")

## ----table11_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table11_img1.png")

## ----date_format1, eval=FALSE-------------------------------------------------
#  hf_line("DATE_FORMAT: %Y-%m-%dT%H:%M:%S")
#  

## ----date_format2, eval=FALSE-------------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("Text on the left", "DATE_FORMAT: %Y-%m-%dT%H:%M:%S", bold=TRUE, align='split'))
#  
#  
#  write_rtf(doc, file="table12.rtf")

## ----table12_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table12_img1.png")

## ----date_format3, eval=FALSE-------------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("Text on the left", "DATE_FORMAT: Document run on %H:%M %A, %B %d, %Y", bold=TRUE, align='split'))
#  
#  
#  write_rtf(doc, file="table13.rtf")

## ----table13_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table13_img1.png")

## ----date_format4, eval=FALSE-------------------------------------------------
#  doc <- rtf_doc(ht, header_rows=2) %>%
#    add_titles(hf_line("Text on the left", "FILE_PATH: Run from: %s", bold=TRUE, align='split'))
#  
#  
#  write_rtf(doc, file="table14.rtf")

## ----table14_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table14_img1.png")

## ----date_format5, eval=FALSE-------------------------------------------------
#  source('file_path_example.r')

## ----table15_img1, out.width = "800px", echo = FALSE--------------------------
knitr::include_graphics("table15_img1.png")


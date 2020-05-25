## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(tidyverse)
library(pharmaRTF)

## ----display------------------------------------------------------------------
ht <- huxtable::as_hux(iris[, c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")], 
                       add_colnames=TRUE)
ht[1:10, c('Species', 'Petal.Width')]

## ----print_screen-------------------------------------------------------------
huxtable::print_screen(ht[1:10])

## ----set width----------------------------------------------------------------
# Assign the attribute
huxtable::width(ht) <- 1.5

# Pipe the attribute
ht <- ht %>% 
  huxtable::set_width(1.5)

ht[1:10]


## ----column_widths------------------------------------------------------------
# Assign the attribute
huxtable::col_width(ht) <- c(.4, .15, .15, .15, .15)

# Pipe the attribute
ht <- ht %>% 
  huxtable::set_col_width(c(.4, .15, .15, .15, .15))

ht[1:10]


## ----column names-------------------------------------------------------------
ht[1,]

## ----column names from data frame---------------------------------------------
column_headers <- data.frame(
  Species = "Species of Flower",
  Sepal.Length = "Sepal Length",
  Sepal.Width = "Sepal Width",
  Petal.Length = "Petal Length",
  Petal.Width = "Petal Width",
  stringsAsFactors = FALSE
)

ht <- huxtable::as_hux(rbind(column_headers, iris))
ht[1:10]

## ----cell formatting----------------------------------------------------------
# Assign attributes directly to object
huxtable::bold(ht[1, ]) <- TRUE
huxtable::italic(ht[2, ]) <- TRUE

# Use piping
ht <- ht %>%
  # Bottom border top row
  huxtable::set_bottom_border(1, 1:ncol(ht), 1) %>% 
  # Thicker bottom border on 2nd row
  huxtable::set_bottom_border(2, 1:ncol(ht), 4) %>% 
  # Align the 3rd row, 2nd column right
  huxtable::set_align(3, 2, 'right') 

ht[1:10]


## ----spanning header----------------------------------------------------------

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
  huxtable::set_bottom_border(2, 1:ncol(iris), 2)

ht[1:10]

## ----line breaks--------------------------------------------------------------
# Overwrite the column header cell
ht[2, 1] <- "Species of\\line flower"
# Set escape contents to false
huxtable::escape_contents(ht) <- FALSE
# Set display width
huxtable::width(ht) <- 1.5
ht[1:10]

doc <- rtf_doc(ht, header_rows = 2)
write_rtf(doc, file='table4.rtf')

## ----table4_img1, out.width = "800px", echo = FALSE---------------------------
knitr::include_graphics("table4_img1.png")


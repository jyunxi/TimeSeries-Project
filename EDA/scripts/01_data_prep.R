# 01_data_prep.R
# Load and clean Singapore births and fertility data

library(dplyr)
library(tidyr)
library(tsibble)

raw <- read.csv(
  "C:/Users/29078/Desktop/my-project/data/singapore_births.csv",
  skip = 9, header = TRUE, nrows = 17
)

colnames(raw)[1] <- "DataSeries"

# Filter TLB and TFR only
dat <- raw |>
  filter(grepl(
    "Total Live-Births|Total Fertility Rate \\(TFR\\) \\(Per Female\\)",
    DataSeries
  ))
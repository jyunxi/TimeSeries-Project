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

# Pivot to long format
dat_long <- dat |>
  mutate(across(-DataSeries, as.character)) |>
  pivot_longer(
    cols = -DataSeries,
    names_to = "year",
    values_to = "value"
  ) |>
  mutate(
    year = as.integer(gsub("X", "", year)),
    value = suppressWarnings(as.numeric(value))
  ) |>
  filter(year >= 1960 & year <= 2024) |>
  filter(!is.na(value))

# Separate and join
tlb <- dat_long |>
  filter(grepl("Total Live-Births", DataSeries)) |>
  select(year, TLB = value)

tfr <- dat_long |>
  filter(grepl("Total Fertility Rate", DataSeries)) |>
  select(year, TFR = value)

sg_data <- left_join(tlb, tfr, by = "year") |>
  as_tsibble(index = year)

# Training and test split
sg_train <- sg_data |> filter(year <= 2012)
sg_test  <- sg_data |> filter(year >= 2013)
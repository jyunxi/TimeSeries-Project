# 03_acf_structure.R
# ACF and PACF of original TLB and TFR (training set only)

library(dplyr)
library(ggplot2)
library(feasts)
library(tsibble)

source("C:/Users/29078/Desktop/my-project/EDA/scripts/00_theme.R")
source("C:/Users/29078/Desktop/my-project/EDA/scripts/01_data_prep.R")

# TLB
sg_train |>
  ACF(TLB, lag_max = 20) |>
  autoplot() +
  labs(title = "ACF of Total Live Births (1960-2012)",
       x = "Lag (years)", y = "ACF") +
  my_theme

sg_train |>
  PACF(TLB, lag_max = 20) |>
  autoplot() +
  labs(title = "PACF of Total Live Births (1960-2012)",
       x = "Lag (years)", y = "PACF") +
  my_theme

# TFR
sg_train |>
  ACF(TFR, lag_max = 20) |>
  autoplot() +
  labs(title = "ACF of Total Fertility Rate (1960-2012)",
       x = "Lag (years)", y = "ACF") +
  my_theme

sg_train |>
  PACF(TFR, lag_max = 20) |>
  autoplot() +
  labs(title = "PACF of Total Fertility Rate (1960-2012)",
       x = "Lag (years)", y = "PACF") +
  my_theme
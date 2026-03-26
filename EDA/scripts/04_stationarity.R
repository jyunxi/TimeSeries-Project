# 04_stationarity.R
# Stationarity assessment via unit root tests,
# differencing and ACF/PACF (training set only)

library(dplyr)
library(ggplot2)
library(feasts)
library(tsibble)
library(tseries)

source("C:/Users/29078/Desktop/my-project/EDA/scripts/00_theme.R")
source("C:/Users/29078/Desktop/my-project/EDA/scripts/01_data_prep.R")

# Unit root tests on original series
adf.test(sg_train$TLB)
adf.test(sg_train$TFR)
kpss.test(sg_train$TLB)
kpss.test(sg_train$TFR)

# First-order differencing
sg_diff <- sg_train |>
  mutate(
    TLB_diff1 = difference(TLB, 1),
    TFR_diff1 = difference(TFR, 1)
  )

# Plot differenced series
ggplot(sg_diff |> filter(!is.na(TLB_diff1)),
       aes(x = year, y = TLB_diff1)) +
  geom_line(colour = "#2C7BB6", linewidth = 0.8) +
  geom_hline(yintercept = 0, linetype = "dashed",
             colour = "grey40") +
  labs(title = "First-Order Differenced TLB (1961-2012)",
       x = "Year", y = "Δ Total Live Births") +
  my_theme

ggplot(sg_diff |> filter(!is.na(TFR_diff1)),
       aes(x = year, y = TFR_diff1)) +
  geom_line(colour = "#D7191C", linewidth = 0.8) +
  geom_hline(yintercept = 0, linetype = "dashed",
             colour = "grey40") +
  labs(title = "First-Order Differenced TFR (1961-2012)",
       x = "Year", y = "Δ TFR (per female)") +
  my_theme

# Unit root tests on differenced series
adf.test(na.omit(sg_diff$TLB_diff1))
adf.test(na.omit(sg_diff$TFR_diff1))
kpss.test(na.omit(sg_diff$TLB_diff1))
kpss.test(na.omit(sg_diff$TFR_diff1))

# ACF and PACF of differenced series
sg_diff |>
  filter(!is.na(TLB_diff1)) |>
  ACF(TLB_diff1, lag_max = 20) |>
  autoplot() +
  labs(title = "ACF of Differenced TLB (1961-2012)",
       x = "Lag (years)", y = "ACF") +
  my_theme

sg_diff |>
  filter(!is.na(TLB_diff1)) |>
  PACF(TLB_diff1, lag_max = 20) |>
  autoplot() +
  labs(title = "PACF of Differenced TLB (1961-2012)",
       x = "Lag (years)", y = "PACF") +
  my_theme

sg_diff |>
  filter(!is.na(TFR_diff1)) |>
  ACF(TFR_diff1, lag_max = 20) |>
  autoplot() +
  labs(title = "ACF of Differenced TFR (1961-2012)",
       x = "Lag (years)", y = "ACF") +
  my_theme

sg_diff |>
  filter(!is.na(TFR_diff1)) |>
  PACF(TFR_diff1, lag_max = 20) |>
  autoplot() +
  labs(title = "PACF of Differenced TFR (1961-2012)",
       x = "Lag (years)", y = "PACF") +
  my_theme

# Second-order differencing for TFR
sg_diff2 <- sg_train |>
  mutate(TFR_diff2 = difference(difference(TFR, 1), 1))

ggplot(sg_diff2 |> filter(!is.na(TFR_diff2)),
       aes(x = year, y = TFR_diff2)) +
  geom_line(colour = "#D7191C", linewidth = 0.8) +
  geom_hline(yintercept = 0, linetype = "dashed",
             colour = "grey40") +
  labs(title = "Second-Order Differenced TFR (1962-2012)",
       x = "Year", y = "Δ² TFR (per female)") +
  my_theme

sg_diff2 |>
  filter(!is.na(TFR_diff2)) |>
  ACF(TFR_diff2, lag_max = 20) |>
  autoplot() +
  labs(title = "ACF of Second-Order Differenced TFR (1962-2012)",
       x = "Lag (years)", y = "ACF") +
  my_theme

sg_diff2 |>
  filter(!is.na(TFR_diff2)) |>
  PACF(TFR_diff2, lag_max = 20) |>
  autoplot() +
  labs(title = "PACF of Second-Order Differenced TFR (1962-2012)",
       x = "Lag (years)", y = "PACF") +
  my_theme

kpss.test(na.omit(sg_diff2$TFR_diff2))
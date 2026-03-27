# 05_model_exploration.R
# Candidate ARIMA models for TLB and TFR
# Training period: 1960-2012

library(dplyr)
library(ggplot2)
library(feasts)
library(fable)
library(tsibble)
library(ggtime)

source("C:/Users/29078/Desktop/my-project/EDA/scripts/00_theme.R")
source("C:/Users/29078/Desktop/my-project/EDA/scripts/01_data_prep.R")

# TLB candidate models
tlb_models <- sg_train |>
  model(
    arima_010 = ARIMA(TLB ~ pdq(0,1,0)),
    arima_110 = ARIMA(TLB ~ pdq(1,1,0)),
    arima_011 = ARIMA(TLB ~ pdq(0,1,1)),
    arima_111 = ARIMA(TLB ~ pdq(1,1,1)),
    arima_100 = ARIMA(TLB ~ pdq(1,0,0)),
    arima_200 = ARIMA(TLB ~ pdq(2,0,0)),
    trend_reg = TSLM(TLB ~ trend())
  )

glance(tlb_models) |>
  select(.model, AIC, AICc, BIC) |>
  arrange(AIC)

tlb_models |>
  select(arima_010) |>
  gg_tsresiduals() +
  labs(title = "Residual Diagnostics - TLB ARIMA(0,1,0)") +
  my_theme

augment(tlb_models |> select(arima_010)) |>
  features(.innov, ljung_box, lag = 10)

tlb_models |>
  select(trend_reg) |>
  gg_tsresiduals() +
  labs(title = "Residual Diagnostics - TLB Trend Regression") +
  my_theme

augment(tlb_models |> select(trend_reg)) |>
  features(.innov, ljung_box, lag = 10)

# TFR candidate models
tfr_models <- sg_train |>
  model(
    arima_110 = ARIMA(TFR ~ pdq(1,1,0)),
    arima_011 = ARIMA(TFR ~ pdq(0,1,1)),
    arima_111 = ARIMA(TFR ~ pdq(1,1,1)),
    arima_210 = ARIMA(TFR ~ pdq(2,1,0)),
    arima_211 = ARIMA(TFR ~ pdq(2,1,1)),
    arima_021 = ARIMA(TFR ~ pdq(0,2,1)),
    arima_020 = ARIMA(TFR ~ pdq(0,2,0)),
    arima_121 = ARIMA(TFR ~ pdq(1,2,1)),
    ets_model = ETS(TFR)
  )

glance(tfr_models) |>
  select(.model, AIC, AICc, BIC) |>
  arrange(AIC)

tfr_models |>
  select(arima_111) |>
  gg_tsresiduals() +
  labs(title = "Residual Diagnostics - TFR ARIMA(1,1,1)") +
  my_theme

augment(tfr_models |> select(arima_111)) |>
  features(.innov, ljung_box, lag = 10)

tfr_models |>
  select(arima_021) |>
  gg_tsresiduals() +
  labs(title = "Residual Diagnostics - TFR ARIMA(0,2,1)") +
  my_theme

augment(tfr_models |> select(arima_021)) |>
  features(.innov, ljung_box, lag = 10)
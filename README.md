# TimeSeries-Project

## Overview
This project analyses Singapore's demographic trends using time series methods, focusing on two key indicators:

- **Total Live Births (TLB)**
- **Total Fertility Rate (TFR)**

The data spans from 1960 to 2024, covering a period of dramatic demographic change in Singapore — from post-war high fertility in the 1960s to one of the world's lowest TFRs today.

## Research Question
What are the temporal patterns in Singapore's TLB and TFR, and what time series models are appropriate for forecasting these indicators from 2013 to 2024?

## Why This Is Interesting
Singapore's fertility decline is often cited as one of the most rapid demographic transitions in modern history. The TFR stood at approximately 5.76 in 1960, and had already fallen below the replacement level of 2.1 by 1975 — within a single generation.

Two major policy phases are likely to have created visible structural breaks in the data:

- **Anti-natalist phase (1966–1986):** The "Stop at Two" campaign, formally launched in 1970, used financial disincentives and public messaging to suppress fertility.
- **Pro-natalist phase (1987–present):** The slogan shifted to "Have Three or More, If You Can Afford It", reversing earlier policies with tax rebates and childcare subsidies.

## Project Stages
- **Stage 1 – EDA** *(complete)*: Explore and visualise the data, assess stationarity, examine ACF/PACF structure, and identify candidate models.
- **Stage 2 – Final Report** *(upcoming)*: Fit and compare at least 2 time series models per indicator, forecast 2013–2024, and evaluate model performance.

## Repository Structure
- `data/` – Raw data downloaded from SingStat
- `EDA/scripts/` – R scripts for each stage of EDA analysis
  - `00_theme.R` – Global ggplot theme
  - `01_data_prep.R` – Data loading and cleaning
  - `02_visualisation.R` – Time series plots and smoothing
  - `03_acf_structure.R` – ACF and PACF analysis
  - `04_stationarity.R` – Differencing and stationarity tests
  - `05_model_exploration.R` – Candidate model identification
- `EDA/EDA_report.Rmd` – EDA report (in progress)

## R Packages Used
- `tsibble`, `dplyr`, `tidyr` – Data wrangling
- `ggplot2`, `slider` – Visualisation and smoothing
- `feasts`, `ggtime` – ACF/PACF and decomposition
- `fable` – Time series modelling
- `tseries` – Unit root tests
- `patchwork` – Figure layout
- Base R – `acf()`, `pacf()`, `diff()`

## Data Source
Singapore Department of Statistics (SingStat)
Births and Fertility Rates, Annual
https://tablebuilder.singstat.gov.sg/table/TS/M810091

*Note: Analysis covers 1960–2012 for model fitting, with 2013–2024 reserved for forecast evaluation.*

## References
- Singapore Department of Statistics (2026). *Births and Fertility Rates, Annual*. Retrieved from https://tablebuilder.singstat.gov.sg/table/TS/M810091

- National Library Board Singapore (2025). *Two-child policy*. Singapore Infopedia. Retrieved from https://www.nlb.gov.sg/main/article-detail?cmsuuid=0613c852-aed1-4b29-81fb-faf7de447092

- Wong, J. (2025). *An Analysis of Singapore's Total Fertility Rate, Population Dynamics, and Government Policies*. SGDecoded. Retrieved from https://medium.com/sgdecoded/an-analysis-of-singapores-total-fertility-rate-population-dynamics-and-government-policies-dde1e27c7210

- Yap, M. T. (2003). *Fertility and Population Policy: The Singapore Experience*. Journal of Population and Social Security. Retrieved from https://www.ipss.go.jp/webj-ad/webjournal.files/population/2003_6/24.yap.pdf
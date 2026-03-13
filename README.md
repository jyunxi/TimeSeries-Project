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

These policy shifts, combined with rapid socioeconomic development and urbanisation, make Singapore a particularly interesting case for time series modelling — the series is unlikely to behave as a simple smooth trend.

## Project Stages
This repository will be updated progressively through the semester:

- **Stage 1 – EDA** *(current)*: Explore and visualise the data, assess stationarity, examine ACF/PACF structure, and identify candidate models.
- **Stage 2 – Final Report** *(upcoming)*: Fit and compare at least 2 time series models per indicator, forecast 2013–2024, and evaluate model performance.

## Data Source
Singapore Department of Statistics (SingStat)
Births and Fertility Rates, Annual
https://tablebuilder.singstat.gov.sg/table/TS/M810091

*Note: Analysis will cover 1960–2012 for model fitting, with 2013–2024 reserved for forecast evaluation.*

## References
- Singapore Department of Statistics (2026). *Births and Fertility Rates, Annual*. Retrieved from https://tablebuilder.singstat.gov.sg/
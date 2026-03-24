# 02_visualisation.R
# Time series plots for TLB and TFR (1960-2024)

library(dplyr)
library(ggplot2)
library(slider)

source("C:/Users/29078/Desktop/my-project/EDA/scripts/00_theme.R")
source("C:/Users/29078/Desktop/my-project/EDA/scripts/01_data_prep.R")

# Add moving averages
sg_data <- sg_data |>
  mutate(
    TLB_ma5 = slide_dbl(TLB, mean, .before = 2, .after = 2),
    TFR_ma5 = slide_dbl(TFR, mean, .before = 2, .after = 2)
  )

# TLB raw
ggplot(sg_data, aes(x = year, y = TLB)) +
  geom_line(colour = "#2C7BB6", linewidth = 0.8) +
  geom_point(colour = "#2C7BB6", size = 1.0) +
  geom_vline(xintercept = 2012.5, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  annotate("text", x = 2009, y = 61000,
           label = "Train | Test", colour = "grey40",
           size = 3, family = "Times New Roman") +
  labs(title = "Total Live Births in Singapore (1960-2024)",
       x = "Year", y = "Total Live Births") +
  my_theme

# TFR raw
ggplot(sg_data, aes(x = year, y = TFR)) +
  geom_line(colour = "#D7191C", linewidth = 0.8) +
  geom_point(colour = "#D7191C", size = 1.0) +
  geom_hline(yintercept = 2.1, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  geom_vline(xintercept = 2012.5, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  annotate("text", x = 1968, y = 2.28,
           label = "Replacement level (2.1)",
           colour = "grey40", size = 3,
           family = "Times New Roman") +
  annotate("text", x = 2009, y = 5.5,
           label = "Train | Test", colour = "grey40",
           size = 3, family = "Times New Roman") +
  labs(title = "Total Fertility Rate in Singapore (1960-2024)",
       x = "Year", y = "TFR (per female)") +
  my_theme

# TFR with policy markers
ggplot(sg_data, aes(x = year, y = TFR)) +
  geom_line(colour = "#D7191C", linewidth = 0.8) +
  geom_hline(yintercept = 2.1, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  geom_vline(xintercept = 1970, linetype = "dotted",
             colour = "#756BB1", linewidth = 0.8) +
  geom_vline(xintercept = 1987, linetype = "dotted",
             colour = "#31A354", linewidth = 0.8) +
  geom_vline(xintercept = 2012.5, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  annotate("text", x = 1971, y = 5.3,
           label = "Stop at Two (1970)",
           colour = "#756BB1", size = 3,
           hjust = 0, family = "Times New Roman") +
  annotate("text", x = 1988, y = 5.3,
           label = "Have Three or More (1987)",
           colour = "#31A354", size = 3,
           hjust = 0, family = "Times New Roman") +
  annotate("text", x = 2009, y = 5.5,
           label = "Train | Test", colour = "grey40",
           size = 3, family = "Times New Roman") +
  labs(title = "TFR with Key Policy Interventions (1960-2024)",
       x = "Year", y = "TFR (per female)") +
  my_theme

# TLB with moving average
ggplot(sg_data, aes(x = year)) +
  geom_line(aes(y = TLB), colour = "#2C7BB6",
            linewidth = 0.5, alpha = 0.4) +
  geom_line(aes(y = TLB_ma5), colour = "#2C7BB6",
            linewidth = 1.2) +
  geom_vline(xintercept = 2012.5, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  annotate("text", x = 2009, y = 61000,
           label = "Train | Test", colour = "grey40",
           size = 3, family = "Times New Roman") +
  labs(title = "TLB with 5-Year Moving Average (1960-2024)",
       x = "Year", y = "Total Live Births") +
  my_theme

# TFR with moving average
ggplot(sg_data, aes(x = year)) +
  geom_line(aes(y = TFR), colour = "#D7191C",
            linewidth = 0.5, alpha = 0.4) +
  geom_line(aes(y = TFR_ma5), colour = "#D7191C",
            linewidth = 1.2) +
  geom_hline(yintercept = 2.1, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  geom_vline(xintercept = 2012.5, linetype = "dashed",
             colour = "grey40", linewidth = 0.6) +
  annotate("text", x = 2009, y = 5.5,
           label = "Train | Test", colour = "grey40",
           size = 3, family = "Times New Roman") +
  labs(title = "TFR with 5-Year Moving Average (1960-2024)",
       x = "Year", y = "TFR (per female)") +
  my_theme
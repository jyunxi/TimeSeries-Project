# 02_visualisation.R
# Time series plots for TLB and TFR

library(dplyr)
library(ggplot2)

source("C:/Users/29078/Desktop/my-project/EDA/scripts/00_theme.R")
source("C:/Users/29078/Desktop/my-project/EDA/scripts/01_data_prep.R")

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
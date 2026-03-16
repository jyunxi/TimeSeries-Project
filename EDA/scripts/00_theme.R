# 00_theme.R
# Global ggplot theme

library(ggplot2)
library(extrafont)
loadfonts(device = "win", quiet = TRUE)

my_theme <- theme_minimal() +
  theme(
    text = element_text(family = "Times New Roman"),
    plot.title = element_text(hjust = 0.5, face = "bold",
                              family = "Times New Roman"),
    axis.title = element_text(family = "Times New Roman"),
    axis.text = element_text(family = "Times New Roman"),
    panel.grid.major = element_line(colour = "grey90",
                                    linewidth = 0.3),
    panel.grid.minor = element_blank()
  )
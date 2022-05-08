library(readr)
library(dplyr)
library(ggplot2)
library(statebins)
# This read command won't work because you are changing folders incorrectly   -10
us_states <- read_csv("Assignment 5/us-states.csv") %>%
  group_by(state) %>%
  summarize(total_cases = max(cases), 
            total_deaths = max(deaths))

png(filename="./cases.png")
statebins(us_states, value_col="total_cases", name = "Total Cases") +
  theme_statebins(legend_position="right")
dev.off()
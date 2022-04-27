library(readr)
library(dplyr)
library(ggplot2)
library(statebins)

us_states <- read_csv("./us-states.csv") %>%
  group_by(state) %>%
  summarize(total_cases = max(cases), 
            total_deaths = max(deaths))

png(filename="./cases.png")
statebins(us_states, value_col="total_cases", name = "Total Cases") +
  theme_statebins(legend_position="right")
dev.off()
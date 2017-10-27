library(readr)
library(tidyverse)
library(brewer)
dat <- read_csv("CDC_opiate_cause_of_death_1999-2015.csv")

dat$`Deaths per 100k` <- ifelse(dat$`Deaths per 100k` == "Unreliable", "NA", dat$`Deaths per 100k`)
dat <- filter(dat, years_old >= 18 & years_old <= 80)
dat$`Deaths per 100k` <- as.numeric(dat$`Deaths per 100k`)

ggplot(dat, aes(x = year, y = years_old)) + 
  geom_tile(aes(fill = `Deaths per 100k`)) + 
  scale_fill_distiller(palette = "RdYlBu") + 
  theme_bw() +
  xlab(NULL) +
  ylab("Age") 

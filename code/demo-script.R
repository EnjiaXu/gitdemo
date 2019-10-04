# ===================================================================
# Title: Lab05 R script file
# Description:
#   This script computes descriptive statistics, as well as 
#   various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary data files, and plots
# Author: Enjia Xu
# Date: 10-03-2019
# ===================================================================

# packages
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

# 6 Exporting some data tables
dat <- read.csv("../data/nba2018-players.csv", header = 1)
warriors <- dat %>% filter(team == "GSW") %>% arrange(salary)
write.csv(warriors, "../data/warriors.csv", row.names = FALSE)

# 7 Exporting some R output
sink(file = "../output/data-structure.txt")
str(dat)
sink()

sink(file = "../output/summary-warriors.txt")
summary(warriors)
sink()

lakers <- dat %>% filter(team == "LAL") %>% arrange(salary)
sink(file = "../output/summary-lakers.txt")
summary(lakers)
sink()

# 8 Exporting graphs
jpeg(filename = "../images/histogram-age.jpeg", width = 600, height = 400)
hist(dat$age, main = "Age Frequencies of NBA Players 2018", xlab = "Age")
dev.off()

png(filename = "../images/scatterplot2-height-weight.png", width = 1920, height = 1080, pointsize = 20)
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

ggplot(dat) + 
  geom_point(aes(x = height, y = weight)) + 
  facet_wrap(~ position)
ggsave(filename = "../images/height_weight_by_position.pdf", width = 15, height = 15, units = "in")

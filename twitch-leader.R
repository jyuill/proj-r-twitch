## A Look at Relationships in Twitch Leaderboard data ##
## all data compiled from www.sullygnome.com 

library(tidyverse)
library(scales)
library(lubridate)
library(PerformanceAnalytics)

## import data
twitch.data <- read_csv('data-input/twitch-leader.csv')
twitch.data$date <- as.Date(twitch.data$date, format='%m/%d/%y')
## filter for 7d look-back to focus on most common view
twitch.data7d <- twitch.data %>% filter(days=='7d')
## filter for single title to make it simpler to start
data.7d.apex <- twitch.data7d %>% filter(Game=='Apex Legends')

## compare trends
ggplot(data.7d.apex, aes(x=date, y=`Watch time`))+geom_line()+
  geom_line(aes(y=`Average viewers`))

ggplot(data.7d.apex, aes(x=`Watch time`, y=`Average viewers`))+geom_point()
cor.test(data.7d.apex$`Watch time`,data.7d.apex$`Average viewers`)

chart.Correlation(data.7d.apex[,c(4:10)], histogram = TRUE)
chart.Correlation(data.7d.apex[,c(4,6,8,9,12,13)], histogram = TRUE)

library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(gganimate)
library(gifski)
library(av)
library(gapminder)
library(colorspace)

#Bar Plot

newDATA %>% 
  ggplot(aes(x=State))+
  geom_bar()+
  coord_flip()
newDATA %>% 
  ggplot(aes(x=State,fill = State))+
  geom_bar()

#Box Plot

newDATA %>% ggplot(aes(x = State, y = Mileage,fill = State))+geom_boxplot()


#Scatter Plot
newDATA %>% 
  ggplot(aes(x=fc,
             y=Mileage,
             color = State))+
  geom_point()+
  stat_smooth(se = 0)+
  facet_wrap(~State)

#Histogram 
newDATA %>% 
  ggplot(aes(x=Mileage, fill = State))+
  geom_histogram(binwidth = 5000,
                 color = 'blue',
                 alpha = 0.8)+
  facet_wrap(~State)+
  ggtitle('Failure milage distribution',
          'Top 3 States')

newDATA %>% ggplot(aes(x=lh, y=lc))+
  geom_point()+
  facet_wrap(~State)+
  ggtitle("Labot hours Vs labor cost",
          subtitle = 'Source: vehiclefailure.csv')+
  geom_smooth(method = 'lm',
              col = 'red')+
  scale_x_continuous("Labor Hours",
                     limits = c(0,40))+
  scale_y_continuous("Labor Cost in $",
                     limits = c(0,3000))+
  theme_bw()
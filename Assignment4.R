library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(gganimate)
library(gifski)
library(av)
library(gapminder)
library(colorspace)

#labor Cost vs Labor Hour
veh %>% ggplot(aes(x=lh, y=lc))+
  geom_point()+
  facet_wrap(~State)+
  ggtitle("Labot hours Vs labor cost")+
  geom_smooth(method = 'lm',
              col = 'red')+
  scale_x_continuous("Labor Hours",
                     limits = c(0,40))+
  scale_y_continuous("Labor Cost in $",
                     limits = c(0,3000))+
  theme_bw()

#Bar Plot of first 2 months

newDATA %>% 
  ggplot(aes(x=State))+
  geom_bar()+
  coord_flip()
veh %>% 
  ggplot(aes(x=State,fill = State))+
  geom_bar()
veh %>% filter(fc==1 |fc==2) %>% 
  ggplot(aes(x=State,fill=State))+
  geom_bar()+
  facet_grid(. ~ fc)+
  ggtitle('Failure in Top 3 States',
          'Failure months 1 & 2')

#Box Plot

veh %>% ggplot(aes(x = State, y = Mileage,fill = State))+geom_boxplot()

#Scatter Plot
veh %>% 
  ggplot(aes(x=fc,
             y=Mileage,
             color = State))+
  geom_point()+
  stat_smooth(se = 0)+
  facet_wrap(~State)

#Histogram 
veh %>% 
  ggplot(aes(x=Mileage, fill = State))+
  geom_histogram(binwidth = 5000,
                 color = 'blue',
                 alpha = 0.8)+
  facet_wrap(~State)+
  ggtitle('Failure milage distribution',
          'Top 3 States')

#Bivariate Bar Plot

# Animated time series plot
datanew %>% group_by(date_confirmation) %>% 
  summarise(count = n()) %>% 
  mutate(cuml = cumsum(count)) %>% 
  ggplot(aes(x = date_confirmation, y = cuml)) +
  geom_line(color = 'red') +
  geom_point(size = 1.5) +
  geom_area(fill = 'pink') 

# Data completion
datanew$day <- day(datanew$date_confirmation)
datanew$month <- month(datanew$date_confirmation)

new <- datanew %>% 
  filter(month == 3) %>% 
  group_by(day, country) %>% 
  summarise(count = n())
new <- data.frame(complete(new, day, country,
                           fill = list(count = 0)))

# Animated daily line plot
new %>% filter(country == 'United States' |
                 country == 'France' |
                 country == 'United Kingdom' |
                 country == 'Germany') %>% 
  ggplot(aes(x = day, y = count, 
             group = country,
             color = country)) +
  geom_line() +
  geom_point() 

# Data for bar plot
new <- datanew %>% 
  filter(country == 'United States' |
           country == 'France' |
           country == 'United Kingdom' |
           country == 'Germany') %>% 
  filter(month == 2| month == 3) %>% 
  group_by(country, month) %>% 
  summarise(count = n()) 

# Bar plot
p <- new %>% ggplot(aes(x = country, 
                        y = count,
                        fill = country)) +
  geom_bar(stat = 'identity') +
  geom_point(size = 1.5) +
  scale_y_log10() +
  theme_bw() +
  guides(fill = F) 

# Animated bar plot by month
p + transition_time(as.integer(month)) 

# Animated bar plot by country
p + transition_states(count) 

# Data
p <- ggplot(gapminder,
            aes(x = gdpPercap, y = lifeExp,
                size = pop, color = country)) +
  geom_point(show.legend = F, alpha = 0.7) +
  scale_x_log10() +
  labs(x = 'GDP Per Capita',
       y = 'Life Expectancy') +
  scale_size(range = c(2, 15))

# Animated bubble plot
p + transition_time(year) 

#Datathon26


#Topic 1 Economic Opportunity - how GDP is associated with unemployment

# how do unemployment rates (female and male) look with GDP?

#importing
library(readr)
Datathon_2026 <- read_csv("Datathon_2026.csv")
View(Datathon_2026)

attach(Datathon_2026)


#importing libraries
library (ggplot2)

#data exploration
head(Datathon_2026)

names(Datathon_2026)

dim(Datathon_2026)

summary(Datathon_2026)

# checking for null values
sum(is.na(Datathon_2026)) # 1217 null values


# Drop rows where col1 and col2 contains NA
Datathon_clean <- Datathon_2026[!is.na(Datathon_2026$gdp_per_capita_growth_pct) &
                                  !is.na(Datathon_2026$gdp_per_capita_usd) &
                                  !is.na(Datathon_2026$female_unemployment_pct) &
                                  !is.na(Datathon_2026$male_unemployment_pct), ]

#columns of interest: country_name, gdp_per_capita_growth_pct, inflation_pct, gdp_per_capita_usd,
#female_unemployment_pct, male_unemployment_pct, net_migration_people

#open cleaned dataframe
View(Datathon_clean)

#visualizing relationships
#all unemployment compared to capita growth


#both unemployment rates
ggplot(Datathon_clean, aes(x = gdp_per_capita_growth_pct,
                         y = female_unemployment_pct + male_unemployment_pct, col=female_unemployment_pct))+
  geom_point()+
  labs(x = "GPD per Capita Growth (%)",
       y = "Male and Female Combined Unemployment (%)")
  geom_smooth(method=lm, se=FALSE)


#Female unemployment
ggplot(Datathon_clean, aes(x = gdp_per_capita_growth_pct,
                           y = female_unemployment_pct)) +
  geom_point(color= "purple", alpha = 0.6) +
  labs(x = "GDP per Capita Growth (%)",
       y = "Female Unemployment (%)")

#Male unemployment
ggplot(Datathon_clean, aes(x = gdp_per_capita_growth_pct,
                           y = male_unemployment_pct)) +
  geom_point(color = "forestgreen", alpha = 0.6) +
  labs(x = "GDP per Capita Growth (%)",
       y = "Male Unemployment (%)")

#mean and averages of both unemployment rates
summary(Datathon_clean$female_unemployment_pct)
summary(Datathon_clean$male_unemployment_pct)


# Header --------

## R script to tidy data downloaded from http://data.worldbank.org/indicator/SP.POP.TOTL
## 13.07.2017
## Lars Schoebitz

# Comments ---------

##

# Clear R's brain ------

rm(list = ls())

# read data ---------

pop <- read_csv(file = "classes/data/API_SP.POP.TOTL_DS2_en_csv_v2/API_SP.POP.TOTL_DS2_en_csv_v2.csv", skip = 4)

pop %>% 
  rename(
    country = `Country Name`,
    country_code = `Country Code`
  ) %>% 
  select(country, code, 5:62) %>% 
  filter(code == "ARG" | code == "IRL")

pop %>% 
  rename(
    country = `Country Name`,
    country_code = `Country Code`
  ) %>% 
  select(country, code, 5:62) %>% 
  filter(code %in% c("ARG", "IRL"))

## prepare a time series plot for argentina and ireland from 1990 to 2015

pop %>% 
  rename(
    country = `Country Name`,
    code = `Country Code`,
    year = `1999`
  ) %>% 
  select(country, code, 5:62) %>% 
  filter(code %in% c("ARG", "IRL")) %>%
  select(country, code, `1990`:`2015`) %>% 
  gather(key = year, value = population, `1990`:`2015`)



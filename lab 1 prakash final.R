
# Name : Prakash Sharma
# Roll No : 22
# Lab Work 1 : COVID-19 Web Scraping and Data Analysis

# 1. Load Required Libraries

library(rvest)
library(dplyr)
library(ggplot2)
library(stringr)
library(jsonlite)

# 2. Scraping Data from Website

url <- "https://www.worldometers.info/coronavirus/"
page <- read_html(url)

all_tables <- html_nodes(page, "table")
covid_raw <- html_table(all_tables[[1]], fill = TRUE)

head(covid_raw)


# 3. Data Cleaning and Tidying


# Clean column names (remove special characters)
names(covid_raw) <- str_replace_all(names(covid_raw), "[^[:alnum:]]", "_")

# Remove summary rows and convert numeric columns
covid_clean <- covid_raw %>%
  filter(!Country_Other %in% c("", "Total:")) %>%
  mutate(across(-Country_Other,
                ~as.numeric(gsub(",", "",
                                 str_replace_all(., "[^0-9.-]", "")))))

# View structure
str(covid_clean)

# Check missing values
colSums(is.na(covid_clean))

# Dataset dimensions
dim(covid_clean)

# 4. Statistical Summary

summary(covid_clean)

# Additional descriptive insight
mean(covid_clean$TotalCases, na.rm = TRUE)
median(covid_clean$TotalCases, na.rm = TRUE)
sd(covid_clean$TotalCases, na.rm = TRUE)

# 5. Graphical Visualization


# Histogram (Total Cases)
ggplot(covid_clean, aes(x = TotalCases)) +
  geom_histogram(fill = "darkorange", color = "black", bins = 30) +
  labs(title = "Distribution of Total COVID-19 Cases",
       x = "Total Cases",
       y = "Frequency")

# Scatterplot (Cases vs Deaths)
ggplot(covid_clean, aes(x = TotalCases, y = TotalDeaths)) +
  geom_point(color = "darkred", alpha = 0.6) +
  labs(title = "Relationship between Total Cases and Total Deaths",
       x = "Total Cases",
       y = "Total Deaths")

# Top 10 Countries Bar Chart
top10 <- covid_clean %>%
  arrange(desc(TotalCases)) %>%
  slice(1:10)

ggplot(top10, aes(x = reorder(Country_Other, TotalCases),
                  y = TotalCases)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 10 Countries by Total Cases",
       x = "Country",
       y = "Total Cases")

# 6. Reproducing Trend Graphs

api_url <- "https://disease.sh/v3/covid-19/historical/all?lastdays=all"
api_data <- fromJSON(api_url)

daily_data <- data.frame(
  date = as.Date(names(api_data$cases), "%m/%d/%y"),
  cases = as.numeric(api_data$cases),
  deaths = as.numeric(api_data$deaths)
)

daily_data <- daily_data %>%
  arrange(date) %>%
  mutate(
    new_cases = c(NA, diff(cases)),
    new_deaths = c(NA, diff(deaths))
  )

# Linear Trend Graph (Cases)
ggplot(daily_data, aes(date, new_cases)) +
  geom_line(color = "blue") +
  labs(title = "Daily New Cases (Linear Scale)",
       x = "Date",
       y = "New Cases")

# Linear Trend Graph (Deaths)
ggplot(daily_data, aes(date, new_deaths)) +
  geom_line(color = "purple") +
  labs(title = "Daily New Deaths (Linear Scale)",
       x = "Date",
       y = "New Deaths")

# Log Scale Graph (remove zero values)
daily_log <- daily_data %>%
  filter(new_cases > 0, new_deaths > 0)

ggplot(daily_log, aes(date, new_cases)) +
  geom_line(color = "darkgreen") +
  scale_y_log10() +
  labs(title = "Daily New Cases (Logarithmic Scale)",
       x = "Date",
       y = "Log(New Cases)")

ggplot(daily_log, aes(date, new_deaths)) +
  geom_line(color = "brown") +
  scale_y_log10() +
  labs(title = "Daily New Deaths (Logarithmic Scale)",
       x = "Date",
       y = "Log(New Deaths)")


# 7. Interpretation


# The histogram shows a highly right-skewed distribution,
# meaning only a few countries have extremely high case counts
# while most countries have relatively lower cases.

# The scatterplot demonstrates a positive relationship
# between total cases and total deaths, indicating that
# countries with more infections generally report more deaths.

# The top 10 bar chart highlights the countries that were
# most affected during the pandemic period.

# The daily trend graphs show clear waves of infection,
# including rapid increases followed by gradual declines.

# The logarithmic scale graph makes early exponential growth
# more visible and helps compare growth rates over time.




# Cyclistic Bike Sharing: 2021

## Overview
Welcome to the *Cyclistic Bike Sharing: 2021* project, a data analytics capstone I completed during the Google Data Analytics Professional Certificate. I handled a large dataset, cleaning and preprocessing the data to uncover key insights. By performing in-depth analysis and creating compelling visualizations, I supported Cyclistic’s goal of understanding how annual members and casual riders use bikes differently. 
These insights were used to inform marketing strategies to convert casual riders into annual members.

## Business Task
**How do annual members and casual riders use Cyclistic bikes differently?**

The insights derived from this analysis will guide Cyclistic’s marketing team in crafting targeted strategies to maximize annual memberships, a key revenue driver.

## Tools and Technologies
- **Programming Language:** R
- **Libraries Used:** tidyverse, dplyr, lubridate, ggmap, ggthemes
- **Visualization Techniques:** Bar charts, maps, and summary tables

## The 6-Step Data Analysis Process

### 1. Ask
The primary question is how annual members and casual riders differ in their bike usage. These insights aim to inform marketing strategies that encourage casual riders to convert into members.

### 2. Prepare
Data was sourced from [Divvy’s historical trip data](https://divvy-tripdata.s3.amazonaws.com/index.html), covering all 12 months of 2021. The data adheres to ROCCC standards: Reliable, Original, Comprehensive, Current, and Cited.

### 3. Process
- Cleaned and filtered over 400,000 rows and 17 columns of data.
- Removed irrelevant entries, such as rides for maintenance ("HQ QR") and negative ride durations.
- Added derived columns for day, month, and weekday for trend analysis.
- Ensured consistency by sorting weekdays in logical order and removing NA values.

### 4. Analyze
Key insights include:
- **Ride Duration:** Casual riders average 24.3 minutes per ride, while members average 13.18 minutes.
- **Weekly Trends:** Casual riders ride more on weekends, while members’ usage is consistent throughout the week.
- **Seasonal Trends:** Highest usage is observed from June to September.

### 5. Share
Data visualizations and insights are designed for stakeholders, including the marketing director and analytics team. These include:
- **Bar Charts:** Comparing number of rides and average ride duration by user type.
- **Maps:** Visualizing ride density during peak months like July and December.

### 6. Act
Recommendations for Cyclistic:
- Launch summer membership campaigns to capitalize on peak ridership months.
- Focus on weekends to convert casual riders through targeted promotions.
- Utilize ride density maps to strategically place advertisements.

## Visualizations
### Key Visualizations
- **Ride Trends:** Clear bar charts showing ride duration and number of rides by user type and day.
- **Seasonal Usage:** Month-by-month comparisons highlight peak riding seasons.
- **Maps:** Geographical visualization of ride density in Chicago.

## Skills Demonstrated
1. **Data Cleaning and Wrangling:** Processed raw CSV files from multiple sources, ensuring data quality and consistency.
2. **Data Analysis:** Leveraged R to derive actionable insights and perform statistical analysis.
3. **Data Visualization:** Created compelling visuals to support decision-making.
4. **Critical Thinking:** Developed actionable recommendations aligned with business objectives.

## How to Reproduce This Project
1. Download the datasets from the [Divvy trip data site](https://divvy-tripdata.s3.amazonaws.com/index.html).
2. Clone this repository.
3. Ensure R and the required packages are installed (e.g., tidyverse, ggmap).
4. Run the R script to reproduce the analysis and visualizations.

## LinkedIn
Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/syed-amjad-ali-a43666a6) to discuss this project further.

## Acknowledgements
This project is part of the Google Data Analytics Professional Certificate program. Data was provided by Divvy under its [data license agreement](https://ride.divvybikes.com/data-license-agreement).

---

### Looking Forward
This capstone project highlights my technical and analytical skills. I’m excited to bring this expertise to real-world business challenges. Reach out if you’re looking for a data analyst passionate about turning data into actionable insights!


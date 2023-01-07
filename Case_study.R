library(tidyverse) 
library(dplyr)
library(readr)
library(hms)
library(lubridate)
library(ggmap)
library(ggthemes)

#-----
data_list <- list.files( pattern = "*.csv")  #There are 12 csv files in this directory for each of the months in 2021
df <- readr::read_csv(data_list, id = "file_name") #I am reading in the csv files for 12 months in a single data frame.

df<-df[order(as.Date(df$started_at, format="%Y-%m-%d")),] #sorted the date using the started at column

df<-df %>% select(-file_name,-ride_id,
                  -start_station_id,-end_station_id)#removing the file_name,ride_id columns,start id, end id

df$date <- as.Date(df$started_at) #The default format is yyyy-mm-dd
df$day <- format(as.Date(df$date), "%d")
df$month <- format(as.Date(df$date), "%m")
#df$year <- format(as.Date(df$date), "%Y")
df$day_of_week <- format(as.Date(df$date), "%A")
#Adding separate columns for day of week , month, etc
#this will help in our analysis later. 

df$ride_length <- difftime(df$ended_at,df$started_at)
#ride_length column is the duration of a ride

#str(df) #checking for structure of all the coloumns 


#is.factor(df$ride_length)
df$ride_length <-as.numeric(as.character(df$ride_length))
#conversion from factor to numeric to be able to perform calculations
#is.numeric(df$ride_length)

#So now lets clean the data even more
#Let's check for negative durations or any other
#unnessary data. 

#df %>% count(ride_length<0,sort = TRUE)
#there seems to be 147 such cells. 

df<- df[!(df$start_station_name == "HQ QR" |df$ride_length<0),] #removing negative ride_length and start station HQ QR, which is the times when the bikes were taken for
#servicing etc

df<-df[!(df$rideable_type=="docked_bike"),] #Removing docked bike, since the two main bike types are electric and classic

df<-na.omit(df) #getting rid of cells containing "na" values

# Notice that the days of the week are out of order. Let's fix that.
df$day_of_week <- ordered(df$day_of_week, levels=c("Sunday", 
                                                   "Monday", "Tuesday", "Wednesday", "Thursday", 
                                                   "Friday", "Saturday"))

df

#------
chicago <- get_stamenmap(bbox = c(left = -87.6470, bottom = 41.8814, 
                                  right = -87.6034, top = 41.8996),
                         maptype = "terrain",
                         zoom = 15)
ggmap(chicago)

#--------
July<-df %>% filter(between(date, as.Date('2021-07-01'), as.Date('2021-07-31')))

ggmap(chicago)+
  geom_point(data=July,
             aes(x=start_lng,
                 y=start_lat),
             alpha = 0.05,
             
             size=0.2)+
  
  geom_point(data=July,
             aes(x=end_lng,
                 y=end_lat),
             alpha = 0.05,
             
             size=0.2)+
  
  theme_map()
















#-------
December<- df %>% filter(date > '2021-12-01')

ggmap(chicago)+
  geom_point(data=December,
             aes(x=start_lng,
                 y=start_lat),
             alpha = 0.05,
             
             size=0.2)+
  
  geom_point(data=December,
             aes(x=end_lng,
                 y=end_lat),
             alpha = 0.05,
             
             size=0.2)+
  
  theme_map()

#------
summary(df$ride_length/60)#summary of ride_length in minutes

#-----
aggregate(df$ride_length/60 ~ df$member_casual, FUN = mean)













#------

aggregate(df$ride_length/60 ~ df$member_casual + 
            df$day_of_week, FUN = mean)









#--------

df %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%  #groups by user type and weekday
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,average_duration = mean(ride_length)) %>% 		# calculates the average duration
  arrange(member_casual, weekday)















#-------
# Let's visualize the number of rides by rider type per week day
df %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()/1000,
            average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")






#-------
#Let's visualize the number of rides by rider type per month
df %>% 
  #mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, month) %>% 
  summarise(number_of_rides = n()/1000,
            average_duration = mean(ride_length)) %>% 
  arrange(member_casual, month)  %>% 
  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")









#---------

# Let's create a visualization for average duration
df %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)/60) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")












#--------













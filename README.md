Exploring and finding insights from a bike company dataset.<br>
Here is the link of the [repository](https://github.com/Rasoir-genereux/Data-analysis-project_1)

## Introduction
This project is an entry level project which is about helping a bike company marketing analyics team to create retrieve insights from the 2022 dataset.
As a junior data anlayst in the company, our stakeholders are :
* the director of marketing who is our manager, 
* the marketing analytics team and
* the executive team who decide whether to approve the recommended marketing program.<br>
For a context purpose, the company offers bike service which attracts  two type of client: the members who have an annual subscription and the casual riders.
For the current year, the marketing team decide to increase the number of annual members because they are more profitable. Therefore, they want to convert the casual
clients into annual members.<br>
In conclusion, for this project our business task is to answer to the question " How do annual members and casual riders use Cyclistic bikes diﬀerently?"

## Business task
In the business task, we are trying to compare the Cyclistic member’s habits with the casual riders’ ones. 
It can be in term of average time spent on the bikes, average time of the day of most users, average period days of the week most riding. 
Based on the data we found, the marketing team can use those data in their advertising in order to convince the casual
users to spend one unique subscription instead of multiple payments.

## Data analysis phases 
### Prepare
The  Cyclistic data is an open source data located on the company’s website and is a structured data.
As the data is owned by the City of Chicago and the company is an ownership of the City, it is a first party data.
In fact, even if it is made available to the public by Motivational International,
the fact that we can download it directly from the company’s website and read the legal terms make it ROCCC.
For the purpose of this analysis, the data of the entire year of 2022 is used.
The data is relevant to our analysis, since the variable show the habits of the type of clients.
The thing that is noticeable right away is the inconsistency of the data type of start_station_id and end_station_id. 

### Process
The dataset is available on the company’s website. Each month has more than 100000 rows.
For it is an analysis that will require to combine those 12 monthly dataset together, it is convenient to use SQL to retrieve our requests.
The dataset in full of NULL. But overall, the dates are in consistent format, the primary keys are unique, the rideable bike column and member 
columns respects their constraints.
Nevertheless, they are some NULL in the member_casual column.


### Analyse
While querying the data in SQL we had to convert the ride_length column into minutes with the function DATEPART or DATEDIFF.
We also had to convert the started_at column in month or day of the week in order to know the frequency of use by type of client.
We discovered that although members are greater than casual riders, casual clients use the service more than members do. 
To sum up, it is a good idea to convert casual riders into annual member since they spend more time riding on our bikes,
they can save time and money by having a membership.

### Share
Let’s share our findings with the rest of the marketing analytics team including our manager.
In regards to their level in the company, they should have a busy schedule.
Therefore, our visualization should be concise and easy to understand.
The next lines are the visualisation that could be displayed on the presentation

1. Viz on the number of ride by client type
2. Viz on the AVG time of ride length by client type
3. Viz on the rideable type used by the riders each weekday
4. Viz on the AVG time of ride length by client type each weekday
5. Viz on the AVG time of ride length by client type each month
6. Viz on the rideable type used by the riders by month

### Act
After creating and looking at the visualizations, we come theses conclusion:
Members use the bikes mostly in office days, probably to commute to work.
Therefore, they use the bikes more frequently than casual riders.
In the other hand, Casual riders use the bikes on weekends and they spend more time riding than members.
It’s could because they don’t have a specific place to go. Finally, only casual riders use docked bike. 
These findings show that casual members only want to use the bikes for a limited time on weekends. 
So the advertising could be done in a way that makes the membership customized the casual riders for a period like in summer.





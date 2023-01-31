

create database fifa19;

use fifa19;

select * from tbl_players;


----***Data Analysis on  FIFA data***----

--Q1 How many players are there in the datasets?

select count(*) as Total_Players from tbl_players;
--since there are no duplicates count will show total distinct players


--Q2 How many nationalities do these players belong to?

select count(nationality) as number_of_nationalities from tbl_players;
--will show duplicates nationalities as well

select count(distinct nationality) as number_of_nationalities from tbl_players;
--will show unique count of nationalities


--Q3 Which nationality has the highest number of players, what are the top 3 nationalities by # of players?

select count(*) as frequency, nationality from tbl_players group by nationality;
--will show natinality frequency

select count(*) as frequency, nationality from tbl_players group by nationality order by frequency desc;
--will show nationality frequency in decreasing order

select top 3 count(*) as frequency, nationality from tbl_players group by nationality order by frequency desc;
--will show top 3 nationality. In case of MySQL, instead of top 3 at beginning limit 3 is used at the end.


--Q4 What is the total wage given to all players? What's the average and standard deviation?

select sum(wage) as total_wage, avg(wage) as average_wage, STDEV(wage) as std_wage from tbl_players;
--will show data type error varchar

alter table tbl_players
alter column wage float(50);

select sum(wage) as total_wage, avg(wage) as average_wage, STDEV(wage) as std_wage from tbl_players;
--now this will show the results


--Q5 Which player has the highest wage? Who has the lowest?

select max(wage) from tbl_players
--will show highest wage

select name from tbl_players where wage=565000
--will show the name of player with highest wage

select name from tbl_players where wage=(select max(wage) from tbl_players);
--will show name of player with highest wage using sub query

select name from tbl_players where wage=(select min(wage) from tbl_players);
--will show 4770 names with lowest wage


--Q6 The player having the best overall rating? Worst Overall rating?

select name from tbl_players where overall=(select max(overall) from tbl_players);
--will show player with best overall rating

select name from tbl_players where overall=(select min(overall) from tbl_players);
--will show player with worst overall rating


--Q7 Club having the highest total of overall rating? Highest Average of overall rating?

select sum(overall) as total_rating, club from tbl_players group by club order by total_rating desc;
--will show data type error varchar

alter table tbl_players
alter column  overall float(50);

select sum(overall) as total_rating, club from tbl_players group by club order by total_rating desc;
--will now show the results. Highest rating-Real Madrid, FC Barcelona, Manchester United

select top 3 sum(overall) as total_rating, club from tbl_players group by club order by total_rating desc;
--will top 3 clubs based on total rating -Real Madrid, FC Barcelona, Manchester United

select top 3 avg(overall) as average_rating, club from tbl_players group by club order by average_rating desc;
--will top 3 clubs based on total rating -Juventus, Napoli, Inter


--Q8 What are the top 5 clubs based on the average ratings of their players?

select top 5 avg(overall) as average_rating, club from tbl_players group by club order by average_rating desc;
--will top 3 clubs based on total rating -Juventus, Napoli, Inter, Real Madrid, FC Barcelona


--Q9 What is the distribution of players whose preferred foot is left vs right?

select count(*) as frequency, [preferred foot] from tbl_players group by [preferred foot] order by frequency desc;
--will show left and right foot distribution. In case of MySQL, numbers can be used instead of column name


--Q10 Which jersey number is the luckiest?

select sum(wage) as total_wage, [jersey number] from tbl_players group by [jersey number] order by total_wage desc;
--will show total wage in desc order wrt to jersey number

select top 1 sum(wage) as total_wage, [jersey number] from tbl_players group by [jersey number] order by total_wage desc;
--will show top jersey number with highest wage


--Q11 What is the frequency distribution of nationalities among players whose club name starts with M?

select count(*) as freq, nationality, club from tbl_players where club like 'M%' group by nationality, club;
--will show nationality frequency based on club name start with M


--Q12 How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019(both inclusive)?

select count(*) from tbl_players where joined between '2018-05-20' and '2019-04-10';
--will show the count of players who joined between the given dates


--Q13 How many players have joined their respective clubs date wise?

select count(*) as freq, joined  from tbl_players  group by joined order by freq desc;
--will show daily joining frequency of players


--Q14 How many players have joined their respective clubs yearly?

select count(*) as freq, year(joined) from tbl_players  group by year(joined) order by freq desc;
--will show year wise joining players












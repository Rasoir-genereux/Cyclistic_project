SELECT *
FROM Cyclistic.dbo.[All_2022]

/* UNION STATEMENT: POUR FUSIONNER TOUTES LES DONNÉES DES 12 MOIS*/

--SELECT *
--INTO All_2022

--FROM
--(
--SELECT *
--FROM Cyclistic.dbo.[202201]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202202]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202203]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202204]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202205]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202206]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202207]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202208]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202209]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202210]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202211]

--UNION ALL

--SELECT *
--FROM Cyclistic.dbo.[202212]

--) AS All_2022


--Création d'une table temporaire
Select DATEDIFF(MINUTE, started_at, ended_at) as time_diff --Pour trouver le temps de chaque trajet en seconde
FROM Cyclistic..All_2022
--Pour trouver le temps de chaque trajet en minutes



--la moyenne de temps sur un trajet par type de client
Select member_casual,
AVG (DATEDIFF(MINUTE, started_at, ended_at)) as time_diff_avg --Pour trouver le temps de chaque trajet en minutes
FROM Cyclistic..All_2022
GROUP BY member_casual

-- Pour trouver combien de null existe dans la colonne member_casual
Select member_casual,COUNT(member_casual)
FROM Cyclistic..All_2022
GROUP BY member_casual


--Pour trouver la moyenne de temps d'utilisation du vélo par type de client par jour de la semaine
WITH TEST_1 AS -- TABLE TEMPORAIRE
(
SELECT weekday, member_casual,
AVG (DATEDIFF(MINUTE, started_at, ended_at)) AS avg_minutes --Pour trouver le temps de chaque trajet en minutes
FROM Cyclistic..All_2022
GROUP BY weekday, member_casual
HAVINg member_casual IS NOT NULL
)

SELECT  
	(CASE
		WHEN weekday = 1 THEN 'Sunday'
		WHEN weekday = 2 THEN 'Monday'
		WHEN weekday = 3 THEN 'Tueday'
		WHEN weekday = 4 THEN 'Wednesday'
		WHEN weekday = 5 THEN 'Thursday'
		WHEN weekday = 6 THEN 'Friday'
		WHEN weekday = 7 THEN 'Saturday'
		ELSE 'No_Day'
	END) as W_Day,
member_casual, avg_minutes
FROM TEST_1
ORDER BY weekday


--Pour trouver la moyenne de temps d'utilisation du vélo par type de client par mois
--Pour trouver le mois-jour-minute, on peut aussi utiliser DATEPART(MONTH, la colonne) OU DATEDIFF(MONTH, Colonne_1, Colonne_2) OU MONTH(colonne)
WITH TEST_2 AS(
SELECT MONTH(started_at) AS S_month, member_casual,
AVG (DATEDIFF(MINUTE, started_at, ended_at)) AS avg_minutes --Pour trouver le temps de chaque trajet en minutes
FROM Cyclistic..All_2022
GROUP BY MONTH(started_at), member_casual
HAVINg member_casual IS NOT NULL)

SELECT(
CASE 
	WHEN S_month = 1 THEN 'January'
	WHEN S_month = 2 THEN 'February'
	WHEN S_month = 3 THEN 'March'
	WHEN S_month = 4 THEN 'April'
	WHEN S_month = 5 THEN 'May'
	WHEN S_month = 6 THEN 'June'
	WHEN S_month = 7 THEN 'July'
	WHEN S_month = 8 THEN 'August'
	WHEN S_month = 9 THEN 'September'
	WHEN S_month = 10 THEN 'October'
	WHEN S_month = 11 THEN 'November'
	WHEN S_month = 12 THEN 'December'
	ELSE 'No Month'
END) AS Month_, member_casual, avg_minutes
FROM TEST_2
ORDER BY S_month


--Pour trouver le MAXIMUM de temps d'utilisation par type de client
SELECT member_casual, MAX(DATEPART(MINUTE, ride_length))
FROM Cyclistic..All_2022
GROUP BY member_casual


-- Pour trouver les types de vélo utilité par type de client
SELECT member_casual, rideable_type, COUNT(rideable_type) AS type
FROM Cyclistic..All_2022
GROUP BY member_casual, rideable_type
HAVING member_casual IS NOT NULL

-- Pour trouver le nombre d'utilisation par type de client
SELECT member_casual, COUNT(rideable_type) AS Use_count
FROM Cyclistic..All_2022
GROUP BY member_casual
HAVING member_casual IS NOT NULL

--Pour trouver le type de vélo utilité par jour de la semaine par type de client
SELECT weekday, member_casual, rideable_type, COUNT(rideable_type) AS type
FROM Cyclistic..All_2022
GROUP BY weekday, member_casual, rideable_type
HAVING member_casual IS NOT NULL
ORDER BY weekday, member_casual

--Pour trouver le type de vélo utilité par mois par type de client
SELECT MONTH(started_at) AS S_month,
(CASE 
	WHEN MONTH(started_at) = 1 THEN 'January'
	WHEN MONTH(started_at) = 2 THEN 'February'
	WHEN MONTH(started_at) = 3 THEN 'March'
	WHEN MONTH(started_at) = 4 THEN 'April'
	WHEN MONTH(started_at) = 5 THEN 'May'
	WHEN MONTH(started_at) = 6 THEN 'June'
	WHEN MONTH(started_at) = 7 THEN 'July'
	WHEN MONTH(started_at) = 8 THEN 'August'
	WHEN MONTH(started_at) = 9 THEN 'September'
	WHEN MONTH(started_at) = 10 THEN 'October'
	WHEN MONTH(started_at) = 11 THEN 'November'
	WHEN MONTH(started_at) = 12 THEN 'December'
	ELSE 'No Month'
END) AS Month_
, member_casual, rideable_type, COUNT(rideable_type) AS type
FROM Cyclistic..All_2022
GROUP BY MONTH(started_at), member_casual, rideable_type
HAVING member_casual IS NOT NULL
ORDER BY MONTH(started_at), member_casual



--Pour trouver la somme de temps d'utilisaiton par type de client 
SELECT member_casual, SUM (DATEDIFF(MINUTE, started_at, ended_at))
FROM Cyclistic..All_2022
GROUP BY member_casual

--Pour trouver la localisation des type de client (trop de données pour Excel)
SELECT member_casual, rideable_type start_lat, start_lng, end_lat, end_lng
FROM Cyclistic..All_2022













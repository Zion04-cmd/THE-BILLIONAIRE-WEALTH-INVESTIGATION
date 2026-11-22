SELECT *
FROM Top200RichestPersonintheWorld;

-- 1. Retrieve the 20 richest billionaires. 
SELECT *
FROM Top200RichestPersonintheWorld
ORDER BY networth_billion DESC
LIMIT 20;

--2. Identify the five youngest billionaires. 
SELECT *
FROM Top200RichestPersonintheWorld
ORDER BY age ASC
LIMIT 5;

--3. Calculate the average age and average net worth. 
SELECT AVG(age) AS Average_Age,
		AVG(networth_billion) AS Average_Networth
FROM Top200RichestPersonintheWorld;

--4. Identify the five most represented countries.
SELECT country,
       COUNT(*) AS Number_of_Billionaires
FROM Top200RichestPersonintheWorld
GROUP BY country
ORDER BY Number_of_Billionaires DESC
LIMIT 5;

--5. Calculate the combined net worth of billionaires from each country. 
SELECT country,
		SUM(networth_billion) AS Combined_Networth
FROM Top200RichestPersonintheWorld
GROUP BY 1
ORDER BY 2 DESC;

--6. Identify the five industries with the highest number of billionaires. 
SELECT industry,
       COUNT(*) AS Number_of_Billionaires
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY Number_of_Billionaires DESC
LIMIT 5;

--7. Find countries with at least five billionaires. 
SELECT country,
       COUNT(*) AS Number_of_Billionaires
FROM Top200RichestPersonintheWorld
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY Number_of_Billionaires DESC;

--8. Calculate the total wealth of billionaires younger than 50. 
SELECT SUM(networth_billion) AS Total_Wealth
FROM Top200RichestPersonintheWorld
WHERE age < 50;

--9. Identify billionaires whose net worth exceeds the overall average net worth. 
SELECT name,
       age,
       country,
       networth_billion
FROM Top200RichestPersonintheWorld
WHERE networth_billion >
      (SELECT AVG(networth_billion)
       FROM Top200RichestPersonintheWorld)
ORDER BY networth_billion DESC;

--10. Identify the industry with the highest average net worth.
SELECT industry,
       AVG(networth_billion) AS Average_Networth
FROM Top200RichestPersonintheWorld
GROUP BY industry
ORDER BY Average_Networth DESC
LIMIT 1;
USE covid19;

-- Show the chance of a person would will die in the case of them being infected? What about in the specific location Brazil?
SELECT `Country/Region`, (sum(Deaths)/sum(Confirmed) * 100) AS death_infected_chance
FROM full_grouped
group by `Country/Region`
order by `Country/Region`;

SELECT `Country/Region`, (sum(Deaths)/sum(Confirmed) * 100) AS death_infected_chance
FROM full_grouped
WHERE `Country/Region` LIKE "%Brazil%"
group by `Country/Region`
order by `Country/Region`;

-- Show the chance of a person would will recover per 100 cases of being infected?
SELECT `Country/Region`, ROUND((SUM(Recovered) / SUM(Confirmed) * 100), 2) AS recovered_per_100
FROM full_grouped
GROUP BY `Country/Region`
ORDER BY `Country/Region`;


-- Show the top 5 country/region that would have the highest amount of new cases from the week of April 1, 2020 - April 7, 2020?
SELECT `Country/Region`, SUM(`New cases`) AS total_new_cases
FROM full_grouped
WHERE Date >= '2020-04-01' AND Date <= '2020-04-07'
GROUP BY `Country/Region`
ORDER BY total_new_cases DESC
LIMIT 5; 

-- Which country/region has the highest death rate from being infected?
SELECT `Country/Region`, Sum(Deaths) as Totaldeaths, (Sum(Deaths) / Sum(Confirmed) * 100) AS Highestdeathrate
From full_grouped
Group by `Country/Region`
Order by Highestdeathrate DESC;
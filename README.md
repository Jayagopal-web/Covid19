# Covid19
 
![Covid Dashboard](https://github.com/Jayagopal-web/Covid19/assets/66839291/a9c2fd82-f51c-40cf-9999-2a6033364311)

[Covid19 Dashboard](https://public.tableau.com/app/profile/jayagopal.k/viz/Covid19_16915094975520/Dashboard1)


## Import Dataset


#### Download dataset from Our World in Data Website
[Download link](https://ourworldindata.org/coronavirus)

#### Note:
Although this is a single-sheet dataset, I have separated it into two datasets **CovidDeaths** and **CovidVaccinated** because I will need to use a Join query in SQL.

First, import the **CovidDeaths** and **CovidVaccinated** datasets into Microsoft SQL Server for data exploration.

In the **CovidDeaths** dataset, we will utilize the following columns:
* continent	
* location
* date
* total_cases
* new_cases
* new_deaths
* total_deaths
* population

In the **CovidVaccinated** dataset, we will utilize the following columns:
* continent	
* location
* date
* total_vaccinations
* people_vaccinated
* people_fully_vaccinated


After Data Exploration, Execute the Following Query to Generate Four Tables
Remember to save the resulting tables as four separate Excel sheets.

```SQL
--percent population infected per country
SELECT
 location,
 population,
 MAX(CAST(total_cases as bigint))  as HighestInfectionCount,
 MAX((total_cases/population))*100 as PercentPopulationInfection,
 MAX((total_deaths/population)*100) as PercentPopulationDeath
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population
order by 2,3
```

```SQL
--Percent population Infection Timeline
SELECT 
 location,
 population,
 date,
 MAX(CAST(total_cases as bigint))  as HighestInfectionCount, 
 MAX((total_cases/population))*100 as PercentPopulationInfection, 
 MAX((total_deaths/population))*100 as PercentPopulationDeath
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY PercentPopulationInfection desc
```

```SQL
--Percent population Deaths Timeline
SELECT 
 location,
 population,
 date,
 MAX(CAST(total_cases as bigint))  as HighestInfectionCount, 
 MAX((total_deaths/population))*100 as PercentPopulationDeath
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY PercentPopulationDeath desc
```

```SQL
--Total Population Vs Vaccinated Per Conutry
SELECT 
  death.location, 
  death.population,
  MAX(CAST(vaccinated.total_vaccinations as bigint)) as total_vaccinated,
  MAX(CAST(vaccinated.people_vaccinated as bigint)) as people_vaccinated,
  MAX(CAST(vaccinated.people_fully_vaccinated as bigint)) as people_fully_vaccinated
FROM covid19..CovidDeaths$ as death 
JOIN covid19..CovidVaccinated$ as vaccinated
ON death.location = vaccinated.location AND
   death.date = vaccinated.date
WHERE death.continent IS NOT NULL
GROUP BY death.location, death.population
ORDER BY 1,2
```

## Import these excel sheet in visualization tool 
You can use **Tableau** or **Power BI** 

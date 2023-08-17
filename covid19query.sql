SELECT location, date, total_cases, new_cases, new_deaths, total_deaths, population
FROM covid19..CovidDeaths$
WHERE location = 'India'
order by 1,2

SELECT *
FROM covid19..

--Vaccinated Table 
SELECT 
  location, 
  date,
  total_vaccinations,
  people_vaccinated,
  people_fully_vaccinated
FROM covid19..CovidVaccinated$
WHERE location = 'India'
ORDER BY 1,2


--Total death percentage
SELECT 
  location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
FROM covid19..CovidDeaths$
WHERE location = 'India'

SELECT location, date, total_cases, new_cases, new_deaths, total_deaths, population
FROM covid19..CovidDeaths$
WHERE location = 'India'
order by 1,2

SELECT *
FROM covid19..

--Vaccinated Table 
SELECT 
  location, 
  date,
  total_vaccinations,
  people_vaccinated,
  people_fully_vaccinated
FROM covid19..CovidVaccinated$
WHERE location = 'India'
ORDER BY 1,2


--Total death percentage
SELECT 
  location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
FROM covid19..CovidDeaths$
WHERE location = 'India'
order by 1,2

-- Group by location and continent, to see
SELECT 
  location, 
  MAX(total_cases) AS max_total_cases,
  MAX(total_deaths) AS max_total_deaths,
  population  
FROM covid19..CovidDeaths$
WHERE continent IS NULL
GROUP BY location, population
ORDER BY 1

--percent population infected per country
--percent population infected Timeline/Deaths
SELECT continent,location, date, CAST(total_cases As bigint) as total_cases, new_cases, new_deaths, total_deaths, population  
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL AND location = 'Afghanistan'
order by 2,3

--Total Population Vs Vaccinated
SELECT 
  death.location, 
  death.date,
  death.population,
  vaccinated.total_vaccinations,
  vaccinated.people_vaccinated,
  vaccinated.people_fully_vaccinated
FROM covid19..CovidDeaths$ as death 
JOIN covid19..CovidVaccinated$ as vaccinated
ON death.location = vaccinated.location AND
   death.date = vaccinated.date
WHERE death.continent IS NOT NULL AND death.location = 'Afghanistan'
ORDER BY 1,2

-- Group by location and continent, to see
SELECT 
  location, 
  MAX(total_cases) AS max_total_cases,
  MAX(total_deaths) AS max_total_deaths,
  population  
FROM covid19..CovidDeaths$
WHERE continent IS NULL
GROUP BY location, population
ORDER BY 1

--percent population infected per country
--percent population infected Timeline/Deaths
SELECT location, population, MAX(CAST(total_cases as bigint))  as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfection, MAX((total_deaths/population)*100) as PercentPopulationDeath
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population
order by 2,3




--Total Population Vs Vaccinated
SELECT 
  death.location, 
  death.date,
  death.population,
  vaccinated.total_vaccinations,
  vaccinated.people_vaccinated,
  vaccinated.people_fully_vaccinated
FROM covid19..CovidDeaths$ as death 
JOIN covid19..CovidVaccinated$ as vaccinated
ON death.location = vaccinated.location AND
   death.date = vaccinated.date
WHERE death.continent IS NOT NULL
ORDER BY 1,2


--Tableau Visualization tool

--percent population infected per country
SELECT location, population, MAX(CAST(total_cases as bigint))  as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfection, MAX((total_deaths/population)*100) as PercentPopulationDeath
FROM covid19..CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population
order by 2,3

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
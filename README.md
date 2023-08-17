# Covid19
 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Dashboard")

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


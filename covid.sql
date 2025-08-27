Select *
From PortfolioProject.. CovidDeaths
order by 3,4

Select *
From PortfolioProject.. CovidVaccinations
order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population 
From PortfolioProject.. CovidDeaths
order by 1,2

Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage 
From PortfolioProject.. CovidDeaths
Where location like '%austria'
order by 1,2

-- Looking at Total Cases vs Population 

Select location, date, total_cases, population, (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject.. CovidDeaths
Where location like '%austria'
order by 1,2

--Looking at Countries Highest Inflation Rate compared to Population 
Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject.. CovidDeaths
--Where location like '%austria'
GROUP by location, population
order by PercentPopulationInfected desc
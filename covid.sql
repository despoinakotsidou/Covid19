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
order by 1,2

Select *
From PortfolioProject.. CovidDeaths
Where continent is not NULL
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


-- Showing Countries with hoghest DeathCount per Population 
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject.. CovidDeaths
--Where location like '%austria'
Where continent is not NULL
GROUP by location
order by TotalDeathCount desc

-- BY CONTINENT


-- Showing the Continent with highest death count per populatuon

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject.. CovidDeaths
--Where location like '%austria'
Where continent is not NULL
GROUP by continent
order by TotalDeathCount desc

--BY GLOBAL 

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, 
SUM(cast(new_deaths as int))/SUM(new_cases)*100 AS DaethPercentage  
From PortfolioProject.. CovidDeaths
--Where location like '%austria'
Where continent is not NULL
GROUP by date
order by 1,2

--Join the Tbles 

-- Looking at Total Population vs Vacination 

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
    On dea.location = vac.location 
    and dea.date = vac.date 
Where dea.continent is not NULL
order by 2,3


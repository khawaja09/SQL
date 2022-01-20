use portfolioProject
-- select all from coviddeaths
select * from coviddeaths$


-- select specific columns/attributes

select date, location, population, new_cases, new_deaths
from covidDeaths$


-- select pakistan record only

select date, location, population, new_cases, new_deaths
from covidDeaths$
where location = 'Pakistan'

-- select pakistan record of 2022 only order by date

select date, location, population, new_cases, new_deaths
from covidDeaths$
where location = 'Pakistan' and date > '2021-12-31'
order by date

-- select date and location when maximum death recorded

select date, location, new_deaths
from covidDeaths$
where new_deaths = (select max(new_deaths) from covidDeaths$)

-- total deaths recorded in each country in 2022 in descending order

select location, sum(convert(int, new_deaths)) TotalDeaths
from covidDeaths$
where date > '2021-12-31'
group by location
order by TotalDeaths desc

--

--countries with hiegest chances of effected with COVID

select location, population, sum(new_cases) as TotalCases, sum(convert(int, new_deaths)) as TotalDeaths,
round(sum(new_cases)/population*100,2) as ChancesofCOVID,
round(sum(convert(int, new_deaths))/sum(new_cases)*100,2) as DeathRatio
from covidDeaths$
group by location, population
order by DeathRatio desc

use portfolioProject

-- Join
-- Inner Join

select dea.location, dea.population, dea.date, vacc.new_vaccinations 
from covidDeaths$ as dea inner join covidVaccination$ as vacc
	on dea.location = vacc.location
	and dea.date = vacc.date
	order by convert(int, vacc.new_vaccinations) desc

select dea.continent, dea.location, dea.population, dea.date, vacc.new_vaccinations 
from covidDeaths$ as dea inner join covidVaccination$ as vacc
	on dea.location = vacc.location
	and dea.date = vacc.date
where dea.continent is not null
	order by 1,2


select dea.location, dea.population, sum(convert(bigint,vacc.new_vaccinations)) as TotalVaccinations 
from covidDeaths$ as dea inner join covidVaccination$ as vacc
	on dea.location = vacc.location
	and dea.date = vacc.date
where dea.continent is not null
group by dea.location, dea.population
	order by 1,2

-- total cases, deaths & vaccinations in pakistan

select dea.location, dea.population, sum(dea.new_cases) as TotalCases, sum(convert(int,dea.new_deaths)) as TotalDeaths, sum(convert(bigint,vacc.new_vaccinations)) as TotalVaccinations 
from covidDeaths$ as dea inner join covidVaccination$ as vacc
	on dea.location = vacc.location
	and dea.date = vacc.date
where dea.location = 'Pakistan'
group by dea.location, dea.population


select dea.continent, dea.location, dea.population, dea.date, vacc.new_vaccinations, sum(convert(bigint, vacc.new_vaccinations)) 
over (partition by dea.location order by dea.location, dea.Date)
from covidDeaths$ as dea inner join covidVaccination$ as vacc
	on dea.location = vacc.location
	and dea.date = vacc.date
	where dea.continent is not null
	order by 2,4

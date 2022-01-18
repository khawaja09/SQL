use portfolioProject

select * from covidDeaths$
where new_deaths = (select max(CONVERT(int, new_deaths)) from covidDeaths$)



select date, round(AVG(new_cases),1) as AverageCases, AVG(cast(new_deaths as int)) as AverageDeaths
from covidDeaths$
where date > '2022-01-01'
group by date
order by 2,3 desc


select location, max(CONVERT(int, new_deaths)) as MaxDeaths, max(new_cases) as MaxCases 
from covidDeaths$
where continent is not null
group by location
order by 2 desc


--countries with minimum death ratio 
select location, max(new_cases) as MaxCases, max(CONVERT(int, new_deaths)) as MaxDeaths,
max(CONVERT(int, new_deaths))/max(new_cases)*100 as DeathRatio
from covidDeaths$
where continent is not null
group by location
order by DeathRatio desc


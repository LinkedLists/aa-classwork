# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  select name
  from countries
  where gdp > (
    select MAX(gdp)
    from countries
    where continent = 'Europe'
  ) AND
  continent != 'Europe'
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  select continent, name, area
  from countries
  where area IN (
    select MAX(area)
    from countries
    group by continent 
  )
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  select name, continent
  from countries AS a
  where population/3 > ALL (
    select population
    from countries AS b
    where a.continent = b.continent
    and a.name != b.name
  )
  SQL
end

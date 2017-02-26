/*Name: Swapnil Sharma*/
use Immigration
/*Having a look at data*/
select * from [dbo].[Country_PR]

/*People from (208) different  countries were given PR*/

select count(*) as NumberOfRecords from [dbo].[Country_PR]

/*total number of PR given year wise*/

select sum(year_2005) as 'Total PR in 2005',
       sum(year_2006) as 'Total PR in 2006',
   sum(year_2007) as 'Total PR in 2007',
   sum(year_2008) as 'Total PR in 2008',
   sum(year_2009) as 'Total PR in 2009',
   sum(year_2010) as 'Total PR in 2010',
   sum(year_2011) as 'Total PR in 2011',
   sum(year_2012) as 'Total PR in 2012',
   sum(year_2013) as 'Total PR in 2013',
   sum(year_2014) as 'Total PR in 2014'
   from [dbo].[Country_PR]
  
/* Highest number of PR given between 2005-2014 to people from  a country (Mexico-189989 people-year2008) */
select top 1  country,totalpr,year from (
select country,year,TotalPR from (  
select country,'2006' as Year,year_2006 as TotalPR , row_number() over(order by year_2006 desc)  as PR from [Country_PR] union 
select country,'2007' as Year,year_2007 as TotalPR , row_number() over(order by year_2007 desc)  as PR from [Country_PR] union 
select country,'2008' as Year,year_2008 as TotalPR , row_number() over(order by year_2008 desc)  as PR from [Country_PR] union 
select country,'2009' as Year,year_2009 as TotalPR , row_number() over(order by year_2009 desc)  as PR from [Country_PR] union 
select country,'2010' as Year,year_2010 as TotalPR , row_number() over(order by year_2010 desc)  as PR from [Country_PR] union 
select country,'2011' as Year,year_2011 as TotalPR , row_number() over(order by year_2011 desc)  as PR from [Country_PR] union 
select country,'2012' as Year,year_2012 as TotalPR , row_number() over(order by year_2012 desc)  as PR from [Country_PR] union 
select country,'2013' as Year,year_2013 as TotalPR , row_number() over(order by year_2013 desc)  as PR from [Country_PR] union 
select country,'2014' as Year,year_2014 as TotalPR , row_number() over(order by year_2014 desc)  as PR from [Country_PR] 
 ) QWE
where qwe.pr =1) asd
order by TotalPR desc


/* People from these six countries got max PR in 2014 */
   select top 6
   country,
   Year_2014
       from [Country_PR]
   ORDER BY  Year_2014 desc

   /*Having a look at data*/
select * from [dbo].[State_PR]


/*Average number of PR given by states from 2005-2014*/

select state,round( (select AVG(c)
              from (values(year_2005),
			  (year_2006),
			  (year_2007),
			  (year_2008),
			  (year_2009),
			  (year_2010),
			  (year_2011),
			  (year_2012),
			  (year_2013),
			  (year_2014)) T (c)),0) as [Average_PR_Granted]
			  from [dbo].[State_PR] order by [Average_PR_Granted] desc
			  
/* exploring data in table*/
select * from [dbo].[Classification_2014]

/* Finding classification of PR given for top 10 countries explored in table 1*/

select * from [dbo].[Classification_2014]
where country in (select top 6
   country
       from [Country_PR]
   ORDER BY  Year_2014 desc)

/* Adoption Table data viewing*/
select * from [dbo].[Adoption_2014]

/* Top 10 country whose people got adopted*/

select top 10 country,male + Female as TotalAdoption
from [dbo].[Adoption_2014]
where male + Female is not NULL
order by TotalAdoption desc
  
  /*max % of female out of total for a country adopted*/

  select country,round(female*100/(male+female),2) as PercentFemaleAdopted
  from [dbo].[Adoption_2014]
  where male is not null and female is not null
  order by PercentFemaleAdopted desc
create database crop;

select * from climate_agriculture;
select * from crop_production;

#1. Display total production for each state. Sort in descending order.

select STATE, SUM(PRODUCTION) as TOTAL_PRODUCTION from crop_production 
group by crop_production.state order by total_production desc;

#2Find average annual rainfall.

select AVG(ANNUAL_RAINFALL) as AVERAGE_ANNUAL_RAINFALL from climate_agriculture;

#3.Display crops with production greater than 50,000.

select distinct CROP,PRODUCTION from crop_production where production >50000;

#4. Show total production and average rainfall for each crop.

select CP.CROP, SUM(CP.PRODUCTION) AS TOTAL_PRODUCTION,AVG(CA.ANNUAL_RAINFALL) as AVERAGE_RAINFALL
from crop_production cp join climate_agriculture ca on CP.record_id =CA.record_id group by CP.crop ;

#5. Display states where total production is greater than 200000.

select state,SUM(Production) as Total_Production from Crop_Production GROUP by State having SUM(Production) > 200000;

#6. Find crops whose average production is higher than overall average production.

select CROP, AVG(PRODUCTION) as AVG_CROP_PRODUCTION from CROP_PRODUCTION group by CROP
having AVG(PRODUCTION)>(select AVG(PRODUCTION) from crop_production);

#7. Display state-wise total production and average fertilizer usage.

select CP.STATE, SUM(CP.PRODUCTION) as TOTAL_PRODUCTION,AVG(CA.FERTILIZER) as AVERAGE_FERTILIZER
from crop_production cp join climate_agriculture ca on CP.record_id = CA.record_id group by CP.state ;

#8. Find the state with the highest total production.

select STATE, SUM(PRODUCTION) as TOTAL_PRODUCTION from CROP_PRODUCTION
group by STATE order by total_production desc limit 1;

#9.Find crops grown where rainfall is above overall average rainfall.

select distinct CP.CROP from crop_production cp 
join climate_agriculture ca on CP.record_id =CA.record_id 
where CA.annual_rainfall >(select AVG(ANNUAL_RAINFALL) from CLIMATE_AGRICULTURE);

#10.Find states where the total production is greater than 200000 and the average annual rainfall is greater 
#than 800 mm.Display state, total production, and average rainfall. Sort by total production in descending order. 

SELECT cp.State, SUM(cp.Production) AS Total_Production, 
AVG(ca.Annual_Rainfall) AS Average_Rainfall
FROM Crop_Production cp
JOIN Climate_Agriculture ca ON cp.Record_ID = ca.Record_ID
GROUP BY cp.State
HAVING SUM(cp.Production) > 200000 
   AND AVG(ca.Annual_Rainfall) > 800 order by Total_Production desc;





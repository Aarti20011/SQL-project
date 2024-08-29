use data;
select * from online_retail_ii;

-- 1.how many distint stockcodes are there?
SELECT count(distinct stockcode) AS distinct_stockcode_count
From online_retail_ii;

-- 2.List all distinct stockcodes and show their associate description?
SELECT distinct stockcode , description
from online_retail_ii; 

-- 3.(visualization) find the top 10 product(stockcode) across all countries?
SELECT stockcode, count(stockcode) as countproducts
from online_retail_ii
where stockcode is not null
group by stockcode
order by countproducts Desc
limit 10;

-- 4. Group the stockcodes based upon the country ,display the total count of distinct stockcodes, countrywise, to find out the diversity in each country
select country, count(distinct stockcode) as total_distinct_stocks
from online_retail_ii
group by Country
order by total_distinct_stocks DESC;

-- 5. (visualization) find the countries with lowest diversity of stock linit by 10?
select country, count(stockcode) as countstockcode
from online_retail_ii
group by country
order by country limit 10;

-- 6. find the least ordered 10 products(stockcode) across all countries?
select stockcode, count(stockcode) as LeastOrderedItems
from  online_retail_ii
where stockcode is not null
group by stockcode
having LeastOrderedItems Between 1  and 10
order by leastOrderedItems ASC; 

-- 7. (Visualization) group by all stockcodes based upon the cuntry, to find out the biggest market
select country, count(stockcode) as total_stocks
from online_retail_ii
where StockCode is not null
group by country
order by total_stocks Desc;

-- 8.(visualization) rank the top 10 items which are ordered in highest quantity
select stockcode, count(stockcode) as count_of_items, SUM(Quantity) as Quantity
from online_retail_ii
group by stockcode
order by quantity desc
limit 10;


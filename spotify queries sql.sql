-- spotify Data Analysis by Mysql
use data;
select * from spotifydata;

-- 1. find the top 10 longest songs in top 50 list?
SELECT artists, name,duration_ms
from spotifydata
order by duration_ms DESC
LIMIT 10;

-- 2. find the top 10 most popular songs in top 50
select artists, name, popularity 
from spotifydata
order by popularity DESC
limit 10;

-- 3. find the old songs which has made a comeback in 2023
select artists ,name,release_date
from spotifydata
where release_date < 2023-01-01;

-- 4. find the tracks with less energy than average
select * from spotifydata 
where energy < (select avg(energy) from spotifydata) ;

-- 5. Find the artists with more than one song in top 50's
SELECT artists, count(name) songs
FROM spotifydata
GROUP BY artists
HAVING count(name) > 1
order by songs DESC;

-- 6. Find the top 10 most energetic artists
SELECT artists, round(avg(energy),3) artist_energy
FROM spotifydata
GROUP BY artists
order by artist_energy DESC
limit 10; 

-- 7. Find the top 10 songs with liveness (multiple people in recording)
SELECT *
FROM spotifydata
ORDER BY liveness DESC
LIMIT 10;

-- 8. Find the 10 most acoustic songs
SELECT *
FROM spotifydata
ORDER BY acousticness DESC
LIMIT 10;

-- 9. Top 10 Songs with most spoken words
SELECT *
FROM spotifydata
ORDER BY speechiness
LIMIT 10;

-- 10. Common Key Mode in the Top 50
SELECT mode, count(*) count_songs
FROM spotifydata
GROUP BY mode
ORDER BY count(*) DESC
LIMIT 10;
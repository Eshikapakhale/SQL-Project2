use  museumdata;
-- use painting;

 show tables;


-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select 
artist.full_name as artist_name,
museum.name as museum_name
from artist
join work on artist.artist_id=work.artist_id
join museum on work.museum_id=museum.museum_id
order by artist.full_name;


-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.

SELECT artist.full_name as artist_Name, 
count(work.work_id) as Work_Count
from artist
join work on artist.artist_id = work.artist_id
group by artist.full_name
order by Work_Count desc;


-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.

select museum.name as museum_name,
count(work.work_id) as work_count
from museum
join work on museum.museum_id=work.museum_id
group by museum.name
order by work_count desc
limit 5;


-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.

select work.name as work_name,
work.style as work_style,
museum.name as museum_name
from work
join museum on work.museum_id=museum.museum_id
order by museum.name asc
limit 10;


-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.

select artist.full_name as artist_name,
sum(product_size.sale_price) as total_sale_price
from artist
join work on artist.artist_id=work.artist_id
join product_size on work.work_id=product_size.work_id
group by artist.full_name
order by total_sale_price desc;


-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.

select artist.full_name as artist_name,
count(work.work_id) as work_count
from artist
join work on artist.artist_id=work.artist_id
group by artist.full_name
having count(work.work_id)>3;


-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
 
 select work.name as work_name,
 artist.full_name as artist_name
 from work
 join artist on work.artist_id=artist.artist_id
 join product_size on work.work_id=product_size.work_id
 where product_size.sale_price < product_size.regular_price
 order by artist.full_name asc;
 


-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.

select artist.full_name as artist_name,
 avg(work.height) as avg_height,
avg(work.width) as avg_width
from work
join artist on work.artist_id = artist.artist.id
group by artist.full_name;



-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.

select museum.name as museum_name,
MAX(product_size.sale_price) as max_sale_price
from museum
join work on  museum.museum_id = work.museum_id
join product_size on work.work_id = product_size.work_id
group by museum.name;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

SELECT CONCAT(artist.first_name, ', ', artist.last_name, ' ,', artist.nationality) AS artist_info,
    COUNT(work.work_id) AS work_count
from artist
join work on artist.artist_id = work.artist_id
group by artist.artist_id
order by work_count desc;




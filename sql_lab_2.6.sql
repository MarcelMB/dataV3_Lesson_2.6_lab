USE sakila;

-- In the table actor, which are the actors whose last names are not repeated? 
SELECT  last_name, count(*) FROM actor
GROUP BY last_name
HAVING count(*)=1;

-- Which last names appear more than once? 
SELECT  last_name, count(*) FROM actor
GROUP BY last_name
HAVING count(*)>1
ORDER BY count(*) ASC;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT  staff_id, count(*) FROM rental
GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.

SELECT  release_year, count(film_id) FROM film
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.

SELECT  rating, count(film_id) FROM film
GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT  rating, round(AVG(length),2) FROM film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT  rating, round(AVG(length),2) AS mean_duration FROM film
GROUP BY rating
HAVING mean_duration>120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, rank() OVER (ORDER BY length) AS 'rank' FROM film
WHERE NOT (length is null) and (length>0)
ORDER BY length;


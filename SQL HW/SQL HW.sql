USE SAKILA;

-- 1A
SELECT actor_ID,first_name, last_name FROM actor;

-- 1B
SELECT concat(first_name, ' ', last_name) AS 'Actor Name' FROM actor; 

-- 2A
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Joe';

-- 2B
SELECT * FROM actor
WHERE last_name LIKE '%GEN%';

-- 2C
SELECT * FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

-- 2D
SELECT country, country_id FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3A
ALTER TABLE actor RENAME to oldactor;
CREATE TABLE actor(
	actor_id SMALLINT(5),
    first_name VARCHAR(45),
    middle_name VARCHAR(45),
    last_name VARCHAR(45),
	last_update timestamp
);
INSERT INTO actor (actor_id, first_name, last_name, last_update) select actor_id, first_name, last_name, last_update from oldactor;
ALTER TABLE actor
ADD PRIMARY KEY (actor_id);

-- 3B
ALTER TABLE actor
CHANGE COLUMN `middle_name` `middle_name` BLOB;

-- 3C
ALTER TABLE actor
DROP COLUMN middle_name;

-- 4A
SELECT COUNT(actor_id), last_name
FROM actor
GROUP BY last_name;

-- 4B
SELECT COUNT(actor_id), last_name
FROM actor
GROUP BY last_name
HAVING COUNT(actor_id) > 1;

-- 4C
UPDATE actor
SET first_name = 'HARPER'
WHERE actor_id = 172;

-- 4D
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPER';

-- 6A
SELECT staff.first_name, staff.last_name, address.address 
FROM staff
RIGHT JOIN address ON staff.address_id = address.address_id
WHERE first_name is NOT NULL;

-- 6B
SELECT payment.staff_id, SUM(payment.amount) as 'Total Sales', staff.first_name, staff.last_name
FROM payment
RIGHT JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY staff_id;

-- 6C
SELECT film.title , film_actor.film_id, COUNT(film_actor.actor_id) as 'Number of Actors'
FROM film
INNER JOIN film_actor on film.film_id = film_actor.film_id
GROUP BY film_id;

-- 6D
SELECT COUNT(film_id) as 'Number of Hunchback Impossible' FROM inventory
WHERE film_id = 439;

-- 6E
SELECT payment.customer_id, SUM(payment.amount) as 'Total Spent', customer.last_name
FROM payment
RIGHT JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.last_name;

-- 7A
SELECT title
FROM film
WHERE title LIKE 'K%' or 'Q%' AND language_id = (SELECT language_id
												FROM language
                                                WHERE name = 'English');
                                                
-- 7B
SELECT COUNT(actor_id) as 'Number of Actors in Alone Trip' 
FROM film_actor
WHERE film_id = (SELECT film_id
				FROM film
                WHERE title = 'Alone Trip');
                
-- 7C
SELECT email, first_name, last_name
FROM customer
		JOIN address on (customer.address_id = address.address_id)
        JOIN city on (address.city_id = city.city_id)
        JOIN country on (city.country_id = country.country_id)
WHERE country = 'Canada';
                                    
-- 7D
SELECT title
FROM film
		JOIN film_category on (film.film_id = film_category.film_id)
        JOIN category on (film_category.category_id = category.category_id)
WHERE name = 'Family';

-- 7E
SELECT COUNT(rental.inventory_id) as 'Num of Rentals', film.title
FROM film
		JOIN inventory ON (film.film_id = inventory.film_id)
        JOIN rental ON (inventory.inventory_id = rental.inventory_id)
GROUP BY film.title
ORDER BY COUNT(rental.inventory_id) DESC;

-- 7F
SELECT SUM(payment.amount) as 'Revenue of Rentals', staff.store_id
FROM payment
		JOIN staff ON (payment.staff_id = staff.staff_id)
GROUP BY store_id;

-- 7G
SELECT store.store_id, city.city, country.country
FROM store
		JOIN address on (store.address_id = address.address_id)
        JOIN city on (address.city_id = city.city_id)
        JOIN country on (city.country_id = country.country_id);
        
-- 7H
SELECT SUM(payment.amount) as 'Revenue of Categories', category.name
FROM payment
		JOIN rental ON (payment.rental_id = rental.rental_id)
        JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
        JOIN film_category ON (inventory.film_id = film_category.film_id)
        JOIN category ON (film_category.category_id = category.category_id)
GROUP BY category.name
ORDER BY SUM(payment.amount) DESC
LIMIT 5;

-- 8A
CREATE OR REPLACE VIEW top_grossing_view as
SELECT SUM(payment.amount) as 'Revenue of Categories', category.name
FROM payment
		JOIN rental ON (payment.rental_id = rental.rental_id)
        JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
        JOIN film_category ON (inventory.film_id = film_category.film_id)
        JOIN category ON (film_category.category_id = category.category_id)
GROUP BY category.name
ORDER BY SUM(payment.amount) DESC
LIMIT 5;

-- 8B
SELECT * FROM top_grossing_view;

-- 8C
DROP VIEW top_grossing_view;
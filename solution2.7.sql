/*How many films are there for each of the categories in the category table. Use appropriate join to write this query.
Display the total amount rung up by each staff member in August of 2005.
Which actor has appeared in the most films?
Most active customer (the customer that has rented the most number of films)
Display the first and last names, as well as the address, of each staff member.
List each film and the number of actors who are listed for that film.
Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
List number of films per category.*/

select category.category_id, count(film_category.film_id)  from category
join film_category 
on category.category_id = film_category.category_id
group by category_id;

select sum(amount), staff_id from payment
group by staff_id;

select count(film_actor.film_id), actor.first_name, actor.last_name from film_actor
join actor 
on film_actor.actor_id = actor.actor_id
group by film_actor.actor_id
order by count(film_actor.film_id) desc
limit 1;

select count(rental.rental_id) as no_of_rentals, customer.first_name, customer.last_name from rental
join customer
on rental.customer_id =customer.customer_id
group by customer.customer_id
order by no_of_rentals desc 
limit 1;

select staff.first_name, staff.last_name, address.address from staff
join address 
On staff.address_id = address.address_id;

SELECT film.title, COUNT(film_actor.actor_id) AS num_actors
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY num_actors DESC;

SELECT customer.last_name, SUM(payment.amount) AS total_paid
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY customer.last_name;


SELECT category.name, COUNT(film_category.film_id) AS num_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;


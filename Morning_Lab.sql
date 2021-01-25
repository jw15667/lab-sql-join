use sakila;

-- List number of films per category.
SELECT COUNT(fc.film_id) n_films, c.category_id, c.name category
FROM film_category fc
JOIN category c
ON c.category_id = fc.category_id
GROUP BY 2,3;


-- Display the first and last names, as well as the address, of each staff member.
Select s.first_name, s.last_name, a.address
from staff as s
join address as a
on a.address_id = s.address_id;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT 
	count(l.amount) as 'total_payment', s.staff_id, s.first_name, s.last_name from payment as l
JOIN staff as s
on s.staff_id = l.staff_id
where DATE_FORMAT(payment_date, "%M %Y")='August 2005'
group by staff_id;
	

-- List each film and the number of actors who are listed for that film.
SELECT f.title, count(fc.actor_id) as 'Number of Actors' from film f
join film_actor fc
on f.film_id = fc.film_id
GROUP by f.title
ORDER BY f.title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
SELECT sum(p.amount) as 'Total_Customer_Spend', p.customer_id, c.first_name, c.last_name from payment as p
right join customer as c
on p.customer_id = c.customer_id
GROUP BY 2,3,4
ORDER BY 4 ASC;
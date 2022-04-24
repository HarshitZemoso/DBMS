#1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.
select distinct f.title from film f inner join film_category fc  on f.film_id=fc.film_id 
	inner join category c on fc.category_id=c.category_id 
    where f.rating="PG-13" and c.name="comedy";
    
# 2. Find out the top 3 rented horror movies.
select f.title from film f inner join film_category fc on f.film_id=fc.film_id 
	inner join category c on c.category_id=fc.category_id,
    inventory inv inner join rental r on inv.inventory_id=r.inventory_id
    where c.name="Horror" 
     limit 3;
     
# 3. Find out the list of customers from India who have rented sports movies.
select * from customer_list where country="India" and id in 
(select rental.customer_id from film_list inner join inventory inner join rental  where film_list.category="sports");

#4.Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies. 
select * from customer_list where country='canada' and id in(
	select r.customer_id from actor a inner join film_actor fa on a.actor_id=fa.actor_id
    inner join inventory i on fa.film_id=i.film_id
    inner join rental r on i.inventory_id=r.inventory_id 
    where a.first_name='nick' and a.last_name='wahlberg');     
    
#5.Find out the number of movies in which “SEAN WILLIAMS” acted  
select count(title) from film_list where actors like '%sean williams%';
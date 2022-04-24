#  1 Find out the number of documentaries with deleted scenes.

select count(distinct f.title)"DeletedScenesInDoc" from film f inner join film_category fc on f.film_id=fc.film_id
	inner join category c on fc.category_id=c.category_id where f.special_features like '%Deleted Scenes%'
    and c.name = 'Documentary';


#  2 Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

select count(*) from inventory join rental on inventory.inventory_id=rental.inventory_id where film_id in(select FID from film_list where category='Sci-Fi') and (staff_id,store_id)=(select ID,SID from staff_list where name='Jon Stephens');
    
#  3. Find out the total sales from Animation movies.  

select total_sales from sales_by_film_category where category = "ANIMATION";


#  4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
  
select fl.category, count(fl.category)"Count" from film_list fl where fl.FID in 
        (select i.film_id from customer_list cl, rental r, inventory i
		where cl.name = 'PATRICIA JOHNSON' and cl.ID = r.customer_id and r.inventory_id = i.inventory_id 
        Group by i.film_id)Group by fl.category limit 3;
        

# 5. Find out the number of R rated movies rented by “SUSAN WILSON”.   

select count(*)as count_freq from (select rental_id,inventory_id from rental join customer_list on  rental.customer_id=customer_list.id where name='SUSAN WILSON')as rental_inventory join (select inventory_id,inventory.film_id,rating from inventory join film on inventory.film_id=film.film_id)as invent_film on rental_inventory.inventory_id=invent_film.inventory_id where rating='R';




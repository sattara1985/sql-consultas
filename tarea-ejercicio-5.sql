1Selecciona las columnas film_id y title de la tabla film.
select film_id, title from film

2Selecciona 5 filas de la tabla film, obteniendo todas las columnas.
select * from film limit 5

3Selecciona filas de la tabla film donde film_id sea menor que 4.
select * from film where film_id<4

4Selecciona filas de la tabla film donde el rating sea PG o G.
select * from film where rating='G' OR rating='PG'

5Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.
select * from actor where first_name IN ('Angela','Angelina','Audrey')

6Obtén una lista de actores con el nombre Julia.
select * from actor where first_name like '%ulia'
select * from actor where lower (first_name) like  '%julia%'

7Obtén una lista de actores con los nombres Chris, Cameron o Cuba.
select * from actor where first_name='Chris' OR first_name='Cameron' or  first_name='Cuba'

8Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.
select * from customer where lower(first_name)='jamie' and lower(last_name) ='rice'

9Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.
select amount as monto, payment_date as fecha from payment where amount<1;

10¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?
select rental_duration from film group by rental_duration

11Ordena las filas en la tabla city por country_id y luego por city.
SELECT * from city order by country_id, city 


12¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?
select rental_id from rental order by return_date desc limit 3

13¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?
select COUNT(*) from film WHERE rating='NC-17' or rating='PG' OR  rating='PG-13' group by rating 

14¿Cuántos clientes diferentes tienen registros en la tabla rental?
select * from rental
select customer_id, count(*) from  rental group by customer_id order by customer_id
select distinct customer_id as total_clientes from rental order by customer_id desc

respuesta 14:
select count(distinct customer_id) as total_clientes from rental 

15¿Hay algún cliente con el mismo apellido?
select * from customer
select  last_name, count(*) as cantidad_clientes from customer group by last_name order by cantidad_clientes 
select  last_name, count(*) as cantidad_clientes from customer group by last_name HAVING COUNT(*) > 1;
respuesta: 15:
no hay ninguno con el mismo apellido


16¿Qué película (id) tiene la mayor cantidad de actores?
select * from film_actor
select film_id, count(*) as cantidad_actores from film_actor group by film_id order by cantidad_actores desc limit 1
respuesta 16: 
la 508 con 15 actores
 

17¿Qué actor (id) aparece en la mayor cantidad de películas?
select actor_id, count(*) as aparecio_peliculas from film_actor group by actor_id order by aparecio_peliculas desc limit 1

respuesta17;
es el actor con id 107 apareciendo en 42 peliculas

18Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
select * from city order by country_id where country_id=76
select * from city where country_id=76
respuesta18:
select country_id, count(*) as cantidad_ciudades from city group by country_id order by cantidad_ciudades


19¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?
select * from payment
select ROUND(avg(amount),2) from payment

respuesta 19:

la tarifa promedio de alquiler es 4.20



20Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).
select * from actor

select concat(first_name,last_name) as nombre_completo, 
length(concat(first_name,last_name)) as tamano_nombre 
from actor order by tamano_nombre desc limit 10






querys de prueba no tener en cuenta
select * from actor limit 10

select * from actor limit 5 offset 100
select * from film where rating='PG' OR rating='G'
select * from payment;
SELECT customer_id, avg(amount) as promedio from payment group by customer_id order by promedio desc










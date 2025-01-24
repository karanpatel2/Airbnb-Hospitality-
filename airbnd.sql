create database airbnd;
 use airbnd;
 show tables;
 
select * from bd;
select * from lt;

#Write a query to show names from Listings table
select name from lt;

#Write a query to fetch total listings from the listings table
select count(id) from lt;

#Write a query to fetch total listing_id from the booking_details table
select count(listing_id) from bd;

#Write a query to fetch host ids from listings table
select host_id from lt;

#Write a query to fetch all unique host name from listings table
select host_name from lt;

#Write a query to show all unique neighbourhood_group from listings table
select neighbourhood_group from lt;

#Write a query to show all unique neighbourhood from listings table
select neighbourhood from lt;

#Write a query to fetch unique room_type from listings tables
select room_type from lt;

#Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from lt
where neighbourhood_group in ('brooklyn','manhattan');

#Write a query to show maximum price from booking_details table
select max(price) from bd;

#Write a query to show minimum price fron booking_details table
select min(price) from bd;

#Write a query to show average price from booking_details table
select avg(price) from bd;

#Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from bd;

#Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from bd;

#Write a query to show average availability_365
select avg(availability_365) from bd;

#Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from bd
where availability_365 < 300;

#Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from bd
where price between 300 and 400;

#Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from bd
where minimum_nights > 5;

#Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from bd
where minimum_nights < 100;

#Write a query to show all data of listings & booking_details
select * from lt inner join bd
on lt.id=bd.listing_id;

#Write a query to show host name and price
select lt.host_name,bd.price from lt 
inner join bd on 
lt.id=bd.listing_id;

#Write a query to show room_type and price
select lt.room_type,bd.price from lt 
inner join bd on 
lt.id=bd.listing_id;

#Write a query to show neighbourhood_group & minimum_nights spend
select lt.neighbourhood_group,bd.minimum_nights from lt 
inner join bd on
lt.id=bd.listing_id;

#Write a query to show neighbourhood & availability_365
select lt.neighbourhood,bd.availability_365 from lt 
inner join bd on
lt.id=bd.listing_id;

#Write a query to show total price by neighbourhood_group
select lt.neighbourhood_group,sum(bd.price) from bd 
inner join lt on
lt.id=bd.listing_id
group by lt.neighbourhood_group;

#Write a query to show maximum price by neighbourhood_group
select lt.neighbourhood_group,max(bd.price) from bd 
inner join lt on
lt.id=bd.listing_id
group by lt.neighbourhood_group;

#Write a query to show maximum night spend by neighbourhood_group
select max(bd.minimum_nights),lt.neighbourhood_group from lt
inner join bd on
lt.id=bd.listing_id
group by neighbourhood_group;
select * from bd;

#Write a query to show maximum reviews_per_month spend by neighbourhood
select max(bd.reviews_per_month),lt.neighbourhood from lt
inner join bd on
lt.id=bd.listing_id
group by neighbourhood
order by max(bd.reviews_per_month) desc;

#Write a query to show maximum price by room type
select lt.room_type,max(bd.price) from lt
inner join bd on
lt.id=bd.listing_id
group by room_type;

#Write a query to show average number_of_reviews by room_type
select lt.room_type,avg(bd.number_of_reviews) from lt
inner join bd on
lt.id=bd.listing_id
group by room_type;

#Write a query to show average price by room type
select lt.room_type,avg(bd.price) from lt
inner join bd on
lt.id=bd.listing_id
group by room_type;

#Write a query to show average night spend by room type
select lt.room_type,avg(bd.minimum_nights) from lt
inner join bd on
lt.id=bd.listing_id
group by room_type;

#Write a query to show average price by room type but average price is less than 100
select lt.room_type,avg(bd.price) from lt
inner join bd on
lt.id=bd.listing_id
group by room_type
having avg(bd.price) < 100;

#Write a query to show average night by neighbourhood and average_nights is greater than 5
select lt.neighbourhood,avg(bd.minimum_nights)  from lt
inner join bd on
lt.id=bd.listing_id
group by lt.neighbourhood
having avg(bd.minimum_nights) > 5 ;

#Write a query to show all data from listings where price is greater than 200 using sub-query.
select *from lt where id in (select listing_id from bd where price > 200);

#Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from bd where listing_id in (select listing_id from lt where host_id=314941);

#Find all pairs of id having the same host id, each pair coming once only.
select distinct l1.id , l1.host_id from lt l1, lt l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  order by host_id;

#Write an sql query to show fetch all records that have the term cozy in name
select * from lt where name like '%cozy%';

#Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select lt.host_id,lt.neighbourhood_group,bd.price from lt
inner join bd on 
lt.id=bd.listing_id
where neighbourhood_group = 'manhattan';

#Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select lt.id,lt.host_name,lt.neighbourhood,bd.price from lt
inner join bd on
lt.id=bd.listing_id
where lt.neighbourhood in ('upper west side','williamsburg')
having bd.price > 100;

#Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select lt.id,lt.host_name,lt.neighbourhood,bd.price from lt
inner join bd on
lt.id=bd.listing_id
where lt.host_name='elise' 
and lt.neighbourhood = 'bedford-stuyvesant';

#Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select lt.host_name,bd.availability_365,bd.minimum_nights from lt
inner join bd on
lt.id=bd.listing_id
where bd.availability_365 > 100 and bd.minimum_nights > 100;

#Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select lt.id,lt.host_name,bd.number_of_reviews,bd.reviews_per_month from lt
inner join bd on
lt.id=bd.listing_id
where bd.number_of_reviews > 500 and bd.reviews_per_month >5;

#Write a query to show neighbourhood_group which have most total number of review
select lt.neighbourhood_group,sum(bd.number_of_reviews) from lt
inner join bd on
lt.id=bd.listing_id
group by lt.neighbourhood_group
order by sum(bd.number_of_reviews)
limit 1;
 
#Write a query to show host name which have most cheaper total price
select lt.host_name,sum(bd.price) from lt
inner join bd on
lt.id=bd.listing_id
group by lt.host_name
order by sum(bd.price) asc 
limit 1;

#Write a query to show host name which have most costly total price
select lt.host_name,sum(bd.price) from lt
inner join bd on
lt.id=bd.listing_id
group by lt.host_name
order by sum(bd.price) desc 
limit 1;

#Write a query to show host name which have max price using sub-query
select lt.host_name,bd.price from lt
inner join bd on
lt.id=bd.listing_id
where bd.price = (select max(price) from bd);

#Write a query to show neighbourhood_group where price is less than 100
select lt.neighbourhood_group,bd.price from lt
inner join bd on
lt.id=bd.listing_id
where lt.id in (select listing_id from bd where price < 100);

#Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.
select lt.room_type,max(bd.price),avg(bd.availability_365) from lt
inner join bd on
lt.id=bd.listing_id
group by lt.room_type
order by max(bd.price) asc;

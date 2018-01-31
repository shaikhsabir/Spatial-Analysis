--list all the places and their types with location   
select * from pois_india limit 100;

-- list all the types of unique places and their count to identity which type of place is most
select count(fclass) as cnt,fclass from pois_india group by fclass order by cnt desc;

--list all the states in India with their location
select * from state_polygons_india limit 100;

--create a new table extracting places where only food hotel or related areas are selected
create table pois_india_hotels as
select * from pois_india where fclass in ('restaurant', 'hotel','cafe','fast_food','motel','food_court')

--list all the hotels and related places in India with their location
select count(*) from pois_india_hotels ;


create table pois_india_hotels_detail as select * from pois_india_hotels limit 5000

--add new column to indicate number of hotels in each state
alter table state_polygons_india add column no_of_hotels real

--populate the new column with no. of hotels
with tmp as (

select count(*) as no_of_hotels, state.name_1
from state_polygons_india as state, pois_india_hotels as hotels 
where ST_CONTAINS(state.geom, hotels.geom) group by state.name_1 

)

update state_polygons_india 
set no_of_hotels = tmp.no_of_hotels 
from tmp 
where state_polygons_india.name_1 = tmp.name_1

-- updating the null field with zero value
update state_polygons_india set no_of_hotels = 0 where no_of_hotels is null
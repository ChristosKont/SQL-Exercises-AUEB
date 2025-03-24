/*** QUERIES WITH OUTER JOINS (2) ***/

--Q1) SELECTS ALL NEIGHBOURHOODS THAT ARE NOT INCLUDED IN THE GEOLOCATION TABLE
------------------------------------------------------------------------------------------------------------

SELECT neighbourhood.neighbourhood
FROM neighbourhood
RIGHT JOIN geolocation ON geolocation.properties_neighbourhood = neighbourhood.neighbourhood
WHERE geolocation.properties_neighbourhood IS NULL;

--ROWS: 0
------------------------------------------------------------------------------------------------------------

--Q2) SELECTS ALL LISTING_IDS THAT HAVE AS AMENITIES EITHER 'Smart TV' OR 'Netflix'
------------------------------------------------------------------------------------------------------------

SELECT room_amenity.listing_id, amenity.amenity_id, amenity.amenity_name
FROM room_amenity
LEFT JOIN amenity ON room_amenity.amenity_id = amenity.amenity_id
WHERE amenity.amenity_name LIKE '%Smart TV%' OR amenity.amenity_name LIKE '%Netflix%';

--ROWS: 243
------------------------------------------------------------------------------------------------------------

/*** QUERIES WITH INNER JOINS (3) ***/

--Q3) SELECTS ALL NEIGHBOURHOODS WHICH ON AVG THE MONTHLY_PRICE IS OVER 65
------------------------------------------------------------------------------------------------------------

SELECT location.neighbourhood_cleansed, ROUND(AVG(price.monthly_price::money::numeric), 2)
FROM location 
JOIN price ON location.listing_id = price.listing_id
GROUP BY neighbourhood_cleansed
HAVING ROUND(AVG(price.monthly_price::money::numeric), 2) > 65;

--ROWS: 9
------------------------------------------------------------------------------------------------------------

--Q4) SELECTS ALL LISTINGS WHICH THEIR HOST HAS A PICTURE AVAILABLE
------------------------------------------------------------------------------------------------------------

SELECT listing.id, listing.name, host.id host_id, host.name, host.picture_url
FROM host
JOIN listing ON host.id = listing.host_id
WHERE host.has_profile_pic IS true;

--ROWS: 11514
------------------------------------------------------------------------------------------------------------

--Q5) SELECTS ALL LISTINGS WITH MORE THAN 70 ROOM_AMENITIES AVAILABLE ORDERED BY HIGHEST PRICE
------------------------------------------------------------------------------------------------------------

SELECT price.listing_id, ROUND(AVG(price::money::numeric), 2) AS money, COUNT(room_amenity.amenity_id)
FROM price
JOIN room_amenity ON price.listing_id = room_amenity.listing_id
GROUP BY price.listing_id
HAVING COUNT(room_amenity.amenity_id) > 70
ORDER BY money DESC;

--ROWS: 17
------------------------------------------------------------------------------------------------------------
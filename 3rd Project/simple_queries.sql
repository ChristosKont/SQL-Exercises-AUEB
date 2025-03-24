/*** QUERIES WITHOUT JOINS (2) ***/

--Q1) SELECTS TOP 10 EXPENSIVE APARTMENTS LOCATED IN 'ΑΚΡΟΠΟΛΗ'
------------------------------------------------------------------------------------------------------------

SELECT listings.id, listings.neighbourhood_cleansed, listings.name, listings.price
FROM listings
WHERE listings.neighbourhood_cleansed = 'ΑΚΡΟΠΟΛΗ'
ORDER BY price DESC
LIMIT 10;

--ROWS: 10
------------------------------------------------------------------------------------------------------------


--Q2) SELECTS ALL APARTMENTS SUITABLE FOR A 5-MEMBER FAMILY IN EACH NEIGHBOURHOOD, SORTED BY RATING IN REFERENCE WITH MIN-MAX PRICE
------------------------------------------------------------------------------------------------------------

SELECT listings.neighbourhood_cleansed, COUNT(listings.id), MIN(listings.price), MAX(listings.price), ROUND(AVG(listings.review_scores_rating::numeric), 2) AS rating
FROM listings
WHERE listings.beds = 5 AND listings.review_scores_rating IS NOT NULL
GROUP BY listings.neighbourhood_cleansed
ORDER BY rating DESC;

--ROWS: 33
------------------------------------------------------------------------------------------------------------


/*** QUERIES WITH OUTER JOINS (2) ***/

--Q3) SELECTS ALL NEIGHBOURHOODS THAT ARE NOT INCLUDED IN THE GEOLOCATION TABLE
------------------------------------------------------------------------------------------------------------

SELECT neighbourhoods.neighbourhood
FROM neighbourhoods
RIGHT JOIN geolocation ON geolocation.properties_neighbourhood = neighbourhoods.neighbourhood
WHERE geolocation.properties_neighbourhood IS NULL;

--ROWS: 0
------------------------------------------------------------------------------------------------------------


--Q4) SELECTS ALL THE NON-REVIEWED APARTMENTS IN EACH NEIGHBOURHOOD, IN REFERENCE WITH THE ESTIMATED YEAR THE HOSTS HAVE BEEN ACTIVE SINCE
------------------------------------------------------------------------------------------------------------

SELECT listings.neighbourhood_cleansed, COUNT(listings.id), ROUND(AVG(extract(year from listings.host_since))) AS since
FROM listings
LEFT JOIN reviews ON listings.id = reviews.listing_id
WHERE reviews.listing_id IS NULL
GROUP BY listings.neighbourhood_cleansed;

--ROWS: 44
------------------------------------------------------------------------------------------------------------


/*** QUERIES WITH INNER JOINS (8) ***/

--Q5) SELECTS ALL REVIEWS FOR EVERY BOOKING ON MARCH ACCOMPANIED WITH REVIEWER'S DETAILS
------------------------------------------------------------------------------------------------------------

SELECT calendar.listing_id, reviews.date, reviews.reviewer_id, reviews.reviewer_name, reviews.comments
FROM calendar
INNER JOIN reviews ON calendar.date = reviews.date
WHERE reviews.date BETWEEN '2020-03-01' AND '2020-03-31'
ORDER BY calendar.listing_id;

--ROWS: 291968
------------------------------------------------------------------------------------------------------------


--Q6) SELECTS ALL APARTMENTS ORDERED BY TOTAL REVIEWS, ACCOMPANIED WITH APARTMENT INFO
------------------------------------------------------------------------------------------------------------

SELECT listings.id, listings.name, COUNT(reviews.id) AS reviews, listings.host_name, listings.listing_url
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id 
GROUP BY listings.id
ORDER BY reviews DESC;

--ROWS: 8982
------------------------------------------------------------------------------------------------------------


--Q7) SELECTS ALL NEIGHBOURHOODS WITH APARTMENTS RANKED AS 'excelent' OR 'exceptional' ORDERED BY TOTAL REVIEWS
------------------------------------------------------------------------------------------------------------

SELECT listings.neighbourhood_cleansed, COUNT(reviews.comments) AS total
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id 
WHERE reviews.comments LIKE '%excelent%' OR reviews.comments LIKE '%exceptional%'
GROUP BY listings.neighbourhood_cleansed
ORDER BY total DESC;

--ROWS: 43
------------------------------------------------------------------------------------------------------------


--Q8) SELECTS TOP 25 MOST PROFITABLE ON AVERAGE APARTMENTS
------------------------------------------------------------------------------------------------------------

SELECT listings.name, ROUND(AVG(calendar.price::money::numeric), 2) as total_avg
FROM listings
INNER JOIN calendar ON listings.id = calendar.listing_id
GROUP BY listings.name
ORDER BY total_avg DESC
LIMIT 25;

--ROWS: 25
------------------------------------------------------------------------------------------------------------


--Q9) SELECTS THE NUMBER OF APARTMENTS WITH 'fast wifi' BASED ON REVIEWS IN EACH NEIGHBOURHOOD
------------------------------------------------------------------------------------------------------------

SELECT listings.neighbourhood_cleansed, COUNT(reviews.comments)
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id
WHERE reviews.comments LIKE '%fast wifi%'
GROUP BY listings.neighbourhood_cleansed
ORDER BY count DESC;

--ROWS: 30
------------------------------------------------------------------------------------------------------------


--Q10) SELECTS ALL AVAILABLE APARTMENTS DURING CHRISTMAS ACCOMPANIED WITH APARTMENT INFO
------------------------------------------------------------------------------------------------------------

SELECT DISTINCT listings.id, listings.name, listings.price, listings.square_feet, listings.host_name
FROM listings
INNER JOIN calendar ON listings.id = calendar.listing_id
WHERE listings.square_feet IS NOT NULL AND calendar.date BETWEEN '2020-12-25' AND '2020-12-31'; 

--ROWS: 97
------------------------------------------------------------------------------------------------------------


--Q11) SELECTS THE TOP 30 MOST ACTIVE REVIEWERES IN MAY OF 2019
------------------------------------------------------------------------------------------------------------

SELECT reviews.reviewer_name, COUNT(reviews.reviewer_id) AS total_reviews
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id
WHERE reviews.date BETWEEN '2019-05-01' AND '2019-05-31'
GROUP BY reviews.reviewer_name
ORDER BY total_reviews DESC
LIMIT 30; 

--ROWS: 30
------------------------------------------------------------------------------------------------------------


--Q12) SELECTS ALL APARTMENTS ACCORDING TO HOST RESPONSE TIME WITH 'friendly' HOSTS
------------------------------------------------------------------------------------------------------------

SELECT listings.id, listings.name, reviews.comments, listings.host_name, listings.host_url, listings.host_response_time
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id
WHERE reviews.comments LIKE '%friendly%host%'
ORDER BY host_response_time DESC;


--ROWS: 4932
------------------------------------------------------------------------------------------------------------
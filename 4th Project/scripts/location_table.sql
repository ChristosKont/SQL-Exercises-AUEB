CREATE TABLE Location AS (
	SELECT DISTINCT
	id as listing_id,
	street,
	neighbourhood,
	neighbourhood_cleansed,
	city,
	state,
	zipcode,
	market,
	smart_location,
	country_code,
	country,
	latitude,
	longitude,
	is_location_exact
	FROM Listings
);

ALTER TABLE Location
ADD FOREIGN KEY(listing_id) REFERENCES Listings(id),
ADD FOREIGN KEY(neighbourhood_cleansed) REFERENCES Neighbourhood(neighbourhood);

ALTER TABLE Listings
DROP CONSTRAINT listings_neighbourhood_cleansed_fkey;

ALTER TABLE Listings
DROP COLUMN	street,
DROP COLUMN	neighbourhood,
DROP COLUMN	neighbourhood_cleansed,
DROP COLUMN	city,
DROP COLUMN	state,
DROP COLUMN	zipcode,
DROP COLUMN	market,
DROP COLUMN	smart_location,
DROP COLUMN	country_code,
DROP COLUMN	country,
DROP COLUMN	latitude,
DROP COLUMN	longitude,
DROP COLUMN	is_location_exact;
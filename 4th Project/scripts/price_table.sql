CREATE TABLE Price AS (
	SELECT DISTINCT
	id as listing_id,
	price,
	weekly_price,
	monthly_price,
	security_deposit,
	cleaning_fee,
	guests_included,
	extra_people,
	minimum_nights,
	maximum_nights,
	minimum_minimum_nights,
	maximum_minimum_nights,
	minimum_maximum_nights,
	maximum_maximum_nights,
	minimum_nights_avg_ntm,
	maximum_nights_avg_ntm
	FROM Listings
);

ALTER TABLE Price
alter column price TYPE varchar,
alter column weekly_price TYPE varchar,
alter column monthly_price TYPE varchar,
alter column security_deposit TYPE varchar,
alter column cleaning_fee TYPE varchar,
alter column extra_people TYPE varchar;

UPDATE Price
SET
price = REPLACE(price, '$', ''),
weekly_price = REPLACE(weekly_price, '$', ''),
monthly_price = REPLACE(monthly_price, '$', ''),
security_deposit = REPLACE(security_deposit, '$', ''),
cleaning_fee = REPLACE(cleaning_fee, '$', ''),
extra_people = REPLACE(extra_people, '$', '');

ALTER TABLE Price
ADD FOREIGN KEY(listing_id) REFERENCES Listings(id);

ALTER TABLE Listings
DROP COLUMN	price,
DROP COLUMN	weekly_price,
DROP COLUMN	monthly_price,
DROP COLUMN	security_deposit,
DROP COLUMN	cleaning_fee,
DROP COLUMN	guests_included,
DROP COLUMN	extra_people,
DROP COLUMN	minimum_nights,
DROP COLUMN	maximum_nights,
DROP COLUMN	minimum_minimum_nights,
DROP COLUMN	maximum_minimum_nights,
DROP COLUMN	minimum_maximum_nights,
DROP COLUMN	maximum_maximum_nights,
DROP COLUMN	minimum_nights_avg_ntm,
DROP COLUMN	maximum_nights_avg_ntm;
ALTER TABLE Calendar
alter column price TYPE varchar,
alter column adjusted_price TYPE varchar,
alter column available TYPE boolean;

UPDATE Calendar
SET
price = REPLACE(price, '$', ''),
adjusted_price = REPLACE(adjusted_price, '$', '');
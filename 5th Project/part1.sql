--TABLE 'Amenity'
CREATE TABLE Amenity(
	amenity_id serial,
	amenity_name varchar(255),
	PRIMARY KEY(amenity_id)
);

INSERT INTO Amenity(amenity_name)
SELECT DISTINCT LTRIM(RTRIM(REGEXP_REPLACE(regexp_split_to_table(amenities, ','), '[^\w]+', ' ','g'), ' '), ' ') AS amenity_name FROM room;

--TABLE 'Room_Amenity'
CREATE TABLE Room_Amenity AS (
	SELECT temp.listing_id, amenity_id
	FROM amenity, (SELECT DISTINCT listing_id, LTRIM(RTRIM(REGEXP_REPLACE(regexp_split_to_table(amenities, ','), '[^\w]+', ' ','g'), ' '), ' ') AS amenity_name FROM room) as temp
	WHERE temp.amenity_name = amenity.amenity_name
);

ALTER TABLE Room_Amenity
ADD PRIMARY KEY(listing_id, amenity_id);

ALTER TABLE Room_Amenity
ADD FOREIGN KEY(listing_id) REFERENCES Listing(id),
ADD FOREIGN KEY(amenity_id) REFERENCES Amenity(amenity_id);

ALTER TABLE Room
DROP COLUMN amenities;
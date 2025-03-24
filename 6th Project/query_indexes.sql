--QUERY 1
CREATE INDEX listing_id_index_for_host ON Host(id);
DROP INDEX listing_id_index_for_host;
 
--QUERY 2
CREATE INDEX listing_id_index_for_price ON Price(listing_id);
DROP INDEX listing_id_index_for_price;
 
--QUERY 3
CREATE INDEX neighbourhood_index_for_geolocation ON Geolocation(properties_neighbourhood);
DROP INDEX neighbourhood_index_for_geolocation;
 
--QUERY 4
CREATE INDEX room_amenity_index_for_amenity ON Amenity(amenity_id);
DROP INDEX room_amenity_index_for_amenity;

--QUERY 5
CREATE INDEX location_index_for_price ON Price(listing_id);
DROP INDEX location_index_for_price;

--QUERY 6
CREATE INDEX host_index_for_listing ON Listing(host_id);
DROP INDEX host_index_for_listing;

--QUERY 7
CREATE INDEX price_index_for_room_amenity ON Room_Amenity(listing_id);
DROP INDEX price_index_for_room_amenity;
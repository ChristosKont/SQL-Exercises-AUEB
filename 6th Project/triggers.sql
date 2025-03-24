CREATE FUNCTION update_host_listings_count()
RETURNS TRIGGER AS $BODY$

BEGIN

	IF (TG_OP = 'INSERT') THEN
	
		UPDATE Host SET listings_count = listings_count + 1
		WHERE id = NEW.host_id;
		RETURN NEW;
		
	ELSIF (TG_OP = 'DELETE') THEN
	
		UPDATE Host SET listings_count = listings_count - 1
		WHERE id = OLD.host_id;
		RETURN OLD;
		
	END IF;
	
END; $BODY$

LANGUAGE plpgsql;
		
CREATE TRIGGER tr_update_host_listings_count
AFTER INSERT OR DELETE ON listing
FOR EACH ROW
EXECUTE PROCEDURE update_host_listings_count();

--A TRIGGER INCREMENTING TOTAL REVIEWS UPON A NEW REVIEW INSERTION OR DELETION
CREATE OR REPLACE FUNCTION update_number_of_reviews()
RETURNS TRIGGER AS $BODY$

BEGIN

	IF (TG_OP = 'INSERT') THEN
	
		UPDATE listing 
		
			SET number_of_reviews = number_of_reviews + 1
			WHERE id= NEW.listing_id;
			
		RETURN NEW;
		
	ELSIF (TG_OP = 'DELETE') THEN
	
		UPDATE listing 
		
			SET number_of_reviews = number_of_reviews - 1
			WHERE id = OLD.listing_id;
		
		RETURN OLD;
		
	END IF;
	
END; $BODY$

LANGUAGE plpgsql;
		
CREATE TRIGGER tr_update_number_of_reviews
AFTER INSERT OR DELETE ON review
FOR EACH ROW
EXECUTE PROCEDURE update_number_of_reviews();
SET client_encoding TO 'utf8';

\copy Calendar FROM 'C:\Users\localhost\Desktop\databases\calendar.csv' DELIMITER ',' CSV HEADER;

\copy Geolocation FROM 'C:\Users\localhost\Desktop\databases\geolocation.csv' DELIMITER ',' CSV HEADER;

\copy Listings FROM 'C:\Users\localhost\Desktop\databases\listings.csv' DELIMITER ',' CSV HEADER;

\copy Listings_Summary FROM 'C:\Users\localhost\Desktop\databases\listings-summary.csv' DELIMITER ',' CSV HEADER;

\copy Neighbourhoods FROM 'C:\Users\localhost\Desktop\databases\neighbourhoods.csv' DELIMITER ',' CSV HEADER;

\copy Reviews FROM 'C:\Users\localhost\Desktop\databases\reviews.csv' DELIMITER ',' CSV HEADER;

\copy Reviews_Summary FROM 'C:\Users\localhost\Desktop\databases\reviews-summary.csv' DELIMITER ',' CSV HEADER;



create table Listings(
   id int,
   listing_url varchar(40),
   scrape_id varchar(255),
   last_scraped date,
   name varchar(100),
   summary varchar(1000),
   space varchar(1000),
   description varchar(1000),
   experiences_offered varchar(10),
   neighborhood_overview varchar(1000),
   notes varchar(1000),
   transit varchar(1000),
   access varchar(1000),
   interaction varchar(1000),
   house_rules varchar(1000),
   thumbnail_url varchar(10),
   medium_url varchar(10),
   picture_url varchar(150),
   xl_picture_url varchar(10),
   host_id int,
   host_url varchar(50),
   host_name varchar(40),
   host_since date,
   host_location varchar(100),
   host_about text,
   host_response_time varchar(20),
   host_response_rate varchar(10),
   host_acceptance_rate varchar(10),
   host_is_superhost boolean,
   host_thumbnail_url varchar(110),
   host_picture_url varchar(110),
   host_neighbourhood varchar(30),
   host_listings_count int,
   host_total_listings_count int,
   host_verifications varchar(150),
   host_has_profile_pic boolean,
   host_identity_verified boolean,
   street varchar(70),
   neighbourhood varchar(20),
   neighbourhood_cleansed varchar(40),
   neighbourhood_group_cleansed varchar(10),
   city varchar(40),
   state varchar(40),
   zipcode varchar(20),
   market varchar(30),
   smart_location varchar(40),
   country_code varchar(10),
   country varchar(10),
   latitude varchar(10),
   longitude varchar(10),
   is_location_exact boolean,
   property_type varchar(30),
   room_type varchar(20),
   accommodates int,
   bathrooms varchar(10),
   bedrooms int,
   beds int,
   bed_type varchar(20),
   amenities varchar(1660),
   square_feet varchar(10),
   price varchar(10),
   weekly_price varchar(10),
   monthly_price varchar(10),
   security_deposit varchar(10),
   cleaning_fee varchar(10),
   guests_included int,
   extra_people varchar(10),
   minimum_nights int,
   maximum_nights int,
   minimum_minimum_nights int,
   maximum_minimum_nights int,
   minimum_maximum_nights int,
   maximum_maximum_nights int,
   minimum_nights_avg_ntm varchar(10),
   maximum_nights_avg_ntm varchar(10),
   calendar_updated varchar(20),
   has_availability boolean,
   availability_30 int,
   availability_60 int,
   availability_90 int,
   availability_365 int,
   calendar_last_scraped date,
   number_of_reviews int,
   number_of_reviews_ltm int,
   first_review varchar(10),
   last_review varchar(10),
   review_scores_rating varchar(10),
   review_scores_accuracy varchar(10),
   review_scores_cleanliness varchar(10),
   review_scores_checkin varchar(10),
   review_scores_communication varchar(10),
   review_scores_location varchar(10),
   review_scores_value varchar(10),
   requires_license boolean,
   license varchar(255),
   jurisdiction_names varchar(10),
   instant_bookable boolean,
   is_business_travel_ready boolean,
   cancellation_policy varchar(30),
   require_guest_profile_picture boolean,
   require_guest_phone_verification boolean,
   calculated_host_listings_count int,
   calculated_host_listings_count_entire_homes int,
   calculated_host_listings_count_private_rooms int,
   calculated_host_listings_count_shared_rooms int,
   reviews_per_month varchar(10),
   PRIMARY KEY(id)
);
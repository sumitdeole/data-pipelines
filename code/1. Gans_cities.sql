DROP DATABASE IF EXISTS gans_cities;

-- Create the database
CREATE DATABASE gans_cities;

-- Use the database
USE gans_cities;

-- Create the 'cities' table
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    Elevation INT,
    City VARCHAR(255) NOT NULL, -- Name of the city
    PRIMARY KEY (city_id) -- Primary key to uniquely identify each city
);

SELECT * FROM cities;


-- Create the 'countries' table
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT, -- Automatically generated ID for each country
    Country VARCHAR(255) NOT NULL, -- Name of the country
    country_2c VARCHAR(5),   -- 2 alphanumeric country code
    city_id INT, 
    PRIMARY KEY (country_id), -- Primary key to uniquely identify each country
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to uniquely identify each city
);

SELECT * FROM countries;


-- Create the 'populations' table
CREATE TABLE populations (
    pop_id INT AUTO_INCREMENT, -- Automatically generated ID for each row
    Population INT NOT NULL, -- Population of the country
	Year_retrieved INT, -- Year of data retrieval
    city_id INT,
    PRIMARY KEY (pop_id), -- Primary key to uniquely identify each row
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to uniquely identify each city
);

SELECT * FROM populations;


-- Create the 'coordinates' table
CREATE TABLE coordinates (
    coord_id INT AUTO_INCREMENT, -- Automatically generated ID for each row
    latitude FLOAT NOT NULL, -- Latitude of the city
	longitude FLOAT, -- Longitude of the city
    city_id INT,
    PRIMARY KEY (coord_id), -- Primary key to uniquely identify each row
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to uniquely identify each city
);

SELECT * FROM coordinates;


-- Create the 'weather' table
CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT, -- Automatically generated ID for each row
    `Datetime` DATETIME NOT NULL, -- Date/time of the of weather observation
	Temp FLOAT, -- Avg. temperature
    Feels_like FLOAT, -- Avg. temperature felt
    Rain FLOAT, -- Avg. rain
    Wind FLOAT, -- Avg. wind speed
    Snow FLOAT, -- Avg. snow
    city_id INT,
    Sunrise DATETIME, -- Sunrise time
    Sunset DATETIME, -- Sunset time
    Weather VARCHAR(50), -- weather description
    PRIMARY KEY (weather_id), -- Primary key to uniquely identify each row
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to uniquely identify each city
);

SELECT * FROM weather;


-- Create the 'airports' table
CREATE TABLE airports (
    airport_id INT AUTO_INCREMENT, -- Automatically generated ID for each airport
	city_id INT,
    icao VARCHAR(50), -- ICAO code for each airport
    PRIMARY KEY (airport_id), -- Primary key to uniquely identify each airport
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to uniquely identify each city
);

SELECT * FROM airports;


-- Create the 'flights' table
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT, -- Automatically generated ID for each flight
    arrival_airport_icao VARCHAR(50), -- ICAO code for arrival airport
    departure_airport_icao VARCHAR(50), -- ICAO code for departure airport
    departure_airport_name VARCHAR(50),	 -- Departure airport name
    flight_number VARCHAR(50),  -- Flight number
    scheduled_arrival_time DATETIME, -- Scheduled arrival time
    data_retrieved_at DATETIME, -- Date data retrieved
    airport_id INT,
    PRIMARY KEY (flight_id), -- Primary key to uniquely identify each flight
    FOREIGN KEY (airport_id) REFERENCES airports(airport_id) -- Foreign key to uniquely identify each airport
);

SELECT * FROM flights;
CREATE SCHEMA accidents;

USE accidents;

/* -------------------------------- */
/* Create Tables */
CREATE TABLE accident(
	accident_index VARCHAR(13),
    accident_severity INT
);

CREATE TABLE vehicles(
	accident_index VARCHAR(13),
    vehicle_type VARCHAR(50)
);

/* First: for vehicle types, create new csv by extracting data from Vehicle Type sheet from Road-Accident-Safety-Data-Guide.xls */
CREATE TABLE vehicle_types(
	vehicle_code INT,
    vehicle_type VARCHAR(10)
);
SET GLOBAL local_infile=1;
/* -------------------------------- */
/* Load Data */
LOAD DATA LOCAL INFILE "D:\\iNEURON\\Database Clinics - MySQL\\02.UK Road Safty Accidents 2015\\datasets\\Accidents_2015.csv"
INTO TABLE accident
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, @dummy, @dummy, @dummy, @dummy, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy)
SET accident_index=@col1, accident_severity=@col2;

select *  from accident;

LOAD DATA LOCAL INFILE "D:\\iNEURON\\Database Clinics - MySQL\\02.UK Road Safty Accidents 2015\\datasets\\Vehicles_2015.csv"
INTO TABLE vehicles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, @dummy, @col2, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy, @dummy)
SET accident_index=@col1, vehicle_type=@col2;

select *  from vehicles;

LOAD DATA LOCAL INFILE "D:\\iNEURON\\Database Clinics - MySQL\\02.UK Road Safty Accidents 2015\\datasets\\vehicle_types.csv"
INTO TABLE vehicle_types
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Select * from vehicle_types;
/* -------------------------------- */

--create a table with primary keys
ALTER TABLE vehicle DROP CONSTRAINT fk_vehicles_customer_id
DROP TABLE IF EXISTS CUSTOMERS
CREATE TABLE customers (
	id int IDENTITY not null,
	email varchar(100) not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	constraint pk_customers_id primary key(ID)
)
--add data to customers table
INSERT INTO customers
	(email, first_name, last_name) VALUES 
	('macar@dayrep.com', 'Mac', 'Arrone'),
	('wshore@armyspy.com', 'Windy', 'Shores'),
	('ctyze@teleworm.us', 'Chaz', 'Tyze'),
	('ceue@gustr.com', 'Carri', 'Eue') 

SELECT *
FROM customers

DROP TABLE IF EXISTS vehicle
CREATE TABLE vehicle (
    id int IDENTITY not null, 
    vin varchar(20) not null,
    make varchar(20) not null,
    model varchar(20) not null,
    mileage int not null,
    last_visit date not NULL,
    customer_id int null,
	constraint pk_vehicle_id primary key (ID)
)
insert into vehicle 
	(vin, make, model, mileage, last_visit) VALUES
	('12346','Subaru', 'Outback',123060,'2021-01-27'),
	('12345','Chevy','Traverse',20992,'1/28/2021'),
	('12348','Chevy','Tahoe',35045,'1/30/2021')
SELECT *
FROM vehicle
--using the alter function and constraints
ALTER TABLE vehicle 
	DROP COLUMN customer_id
ALTER TABLE vehicle 
	ADD customer_id int null 
ALTER TABLE vehicle
	ADD CONSTRAINT u_vehicle_vin UNIQUE (vin)
ALTER TABLE vehicle
	ADD CONSTRAINT ck_vehicle_mileage_gt_or_eq_0 CHECK (mileage >= 0)
ALTER TABLE customers
	ADD CONSTRAINT u_customers_email UNIQUE (email)
--foreign key constraint
ALTER TABLE vehicle
	ADD CONSTRAINT fk_vehicles_customer_id FOREIGN KEY (customer_id) REFERENCES customers (id)

--using INSERT, UPDATE, SELECT AND UPDATE
UPDATE vehicle SET customer_id = 1 WHERE vin = '12346'
UPDATE vehicle SET customer_id = 2 WHERE make ='Chevy'
UPDATE vehicle SET customer_id = 3,  mileage = 88956 WHERE vin = '12347'
SELECT *
FROM vehicle

--delete from vehicles where vin = '12345'

--information schema
SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE table_name = 'customers'
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_name = 'vehicle']
SELECT * FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	


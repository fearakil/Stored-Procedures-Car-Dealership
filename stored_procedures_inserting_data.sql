--CREATING PROCEDURE FOR CUSTOMER TABLE
CREATE OR REPLACE PROCEDURE myProcedure(
	customer_id INTEGER,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15),
	email VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer
	VALUES(customer_id,first_name,last_name, phone_number,email);
	COMMIT;
END;
$$

CALL myProcedure(1,'Angelica','Gomez','837-132-4123','homie@gmail.com');
CALL myProcedure(2,'Josh','Miller','837-132-4623','homie2@gmail.com');
CALL myProcedure(3,'Terrell','McKinney','837-132-4823','homie3@gmail.com')

select * 
from customer
--^^end of customer table^^
--CREATING PROCEDURE FOR SALESPERSON TABLE
CREATE OR REPLACE PROCEDURE updateSalesperson(
	sales_person_id INTEGER,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesperson
	VALUES(sales_person_id,first_name,last_name, phone_number);
	COMMIT;
END;
$$

CALL updateSalesperson(1,'Jerry','Freedman','232-232-2132')
CALL updateSalesperson(2,'George','Tolman','233-233-2133')

SELECT *
FROM salesperson
--^^end of salesperson table^^
--CREATING PROCEDURE FOR CAR TABLE
CREATE OR REPLACE PROCEDURE updateCar(
	car_id INTEGER,
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(8,2)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car
	VALUES(car_id,car_color,car_make,car_model,car_year,car_price);
	COMMIT;
END;
$$

CALL updateCar(1,'Blue','Honda','CRV','1993',7900.00);
CALL updateCar(2,'Black','Tesla','X Type','2019',100000.00);

SELECT *
FROM car;
--^^end of car table^^
--CREATING PROCEDURE FOR PARTS TABLE
CREATE OR REPLACE PROCEDURE infoForParts(
	part_id INTEGER,
	part_name VARCHAR(100),
	part_cost NUMERIC(5,2)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO parts
	VALUES(part_id, part_name,part_cost);
	COMMIT;
END;
$$

CALL infoForParts(1,'Exhaust',500.95);
CALL infoForParts(2,'Radiator',350.97);

SELECT * 
FROM parts
--^^end of parts table^^
--CREATING PROCEDURE FOR PARTS_USED TABLE
CREATE OR REPLACE PROCEDURE infoForParts_used(
	parts_used_id INTEGER,
	part_id VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO parts_used
	VALUES(parts_used_id, part_id);
	COMMIT;
END;
$$

CALL infoForParts_used(1,'423');
CALL infoForParts_used(2,'212');

SELECT *
FROM parts_used
--^^end of parts table^^
--CREATING PROCEDURE FOR SERVICES TABLE
CREATE OR REPLACE PROCEDURE updateServices(
	service_id INTEGER,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO services
	VALUES(service_id,service_name,hourly_rate);
	COMMIT;
END;
$$

CALL updateServices(1,'Replace Brakes','$19/hr');
CALL updateServices(2,'Replace Oil','$20/hr');

SELECT * 
FROM services
--^^end of service table^^
--CREATING PROCEDURE FOR MECHANIC TABLE
CREATE OR REPLACE PROCEDURE updateMechanic(
	mechanic_id INTEGER,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic
	VALUES(mechanic_id,first_name,last_name,phone_number);
	COMMIT;
END;
$$

CALL updateMechanic(1,'Jose','Ramirez','312-212-2456');
CALL updateMechanic(2,'Luis','Saurez','312-213-2236');

SELECT *
FROM mechanic
--^^end of mechanic table^^
--CREATING PROCEDURE FOR SERVICE_TO_MECHANIC TABLE
CREATE OR REPLACE PROCEDURE insertService_to_Mechanic(
	service_to_mechanic_id INTEGER,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100),
	service_id INTEGER,
	mechanic_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_to_mechanic
	VALUES(service_to_mechanic_id,service_name,hourly_rate,service_id,mechanic_id);
	COMMIT;
END;
$$

CALL insertService_to_Mechanic(1,'Replace Brakes','$19',1,1)
CALL insertService_to_Mechanic(2,'Replace Oil','$20',2,2)

select *
from service_to_mechanic
--^^end of service to mechanic table^^
--CREATING PROCEDURE FOR SERVICE TICKET TABLE
CREATE OR REPLACE PROCEDURE insertService_Ticket(
	ticket_id INTEGER,
	expected_return_date DATE,
	issue_with_car VARCHAR(150),
	customer_id INTEGER,
	car_id INTEGER,
	service_to_mechanic_id INTEGER,
	parts_used_to INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_ticket
	VALUES(ticket_id,expected_return_date,issue_with_car,customer_id,car_id,service_to_mechanic_id,parts_used_to);
	COMMIT;
END;
$$

CALL insertService_Ticket(1,'2020-03-12','Needs brakes replaced',1,1,1,1)
CALL insertService_Ticket(2,'2020-03-19','Needs oil replaced',2,2,2,2)

SELECT * 
FROM service_ticket
--^^end of service to mechanic table^^
--CREATING DATA FOR INVOICE TABLE
INSERT INTO invoice(
	invoice_id,
	salesperson_id,
	car_id,
	customer_id
)
VALUES(
	1,
	1,
	1,
	1
);

INSERT INTO invoice(
	invoice_id,
	salesperson_id,
	car_id,
	customer_id
)
VALUES(
	2,
	2,
	2,
	2
);
--^^end of invoice table^^
--CREATING PROCEDURE FOR SERVICE_HISTORY TABLE
CREATE OR REPLACE PROCEDURE insertService_history(
	service_history_id INTEGER,
	date_fixed VARCHAR(10),
	car_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_history
	VALUES(service_history_id,date_fixed,car_id);
	COMMIT;
END;
$$

CALL insertService_history(1,'10/22/2020',1)
CALL insertService_history(2,'10/25/2020',2)

SELECT * 
FROM service_history
--FIN
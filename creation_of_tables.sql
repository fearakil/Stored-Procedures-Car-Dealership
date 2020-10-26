CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15),
	email VARCHAR(50)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	car_color VARCHAR(50),
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_price NUMERIC(8,2)
);

CREATE TABLE parts_used(
	parts_used_id SERIAL PRIMARY KEY,
	part_id VARCHAR(100)
);

CREATE TABLE parts(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_cost NUMERIC(5,2)
);

CREATE TABLE services(
	service_id SERIAL PRIMARY KEY,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15)
);



CREATE TABLE service_to_mechanic(
	service_to_mechanic_id SERIAL PRIMARY KEY,
	service_name VARCHAR(100),
	hourly_rate VARCHAR(100),
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(service_id) REFERENCES services(service_id)
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	expected_return_date DATE,
	issue_with_car VARCHAR(150),
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	service_to_mechanic_id INTEGER NOT NULL,
	parts_used_id INTEGER NOT NULL,
	FOREIGN KEY(parts_used_id) REFERENCES parts_used(parts_used_id),
	FOREIGN KEY(service_to_mechanic_id) REFERENCES service_to_mechanic(service_to_mechanic_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service_history(
	service_history SERIAL PRIMARY KEY,
	date_fixed INTEGER,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)	
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	salesperson_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)	
);
	
	





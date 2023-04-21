USE ManagingProperties;

CREATE TABLE IF NOT EXISTS agents(
  agent_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  surname varchar(20) NOT NULL,
  email varchar(60) UNIQUE NOT NULL,
  phone_number char(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS bookings(
  booking_id int NOT NULL AUTO_INCREMENT,
  fk_customer_id int NOT NULL,
  fk_property_id int NOT NULL,
  fk_agent_id int NOT NULL,
  datetime_placed DATETIME CHECK(TIME(datetime_placed) BETWEEN '08:00:00' AND '17:00:00'),
  PRIMARY KEY (booking_id),
  FOREIGN KEY (fk_customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (fk_property_id) REFERENCES properties(property_id),
  FOREIGN KEY (fk_agent_id) REFERENCES agents(agent_id)
);





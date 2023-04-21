USE ManagingProperties;

CREATE TABLE IF NOT EXISTS sellers(
  seller_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  surname varchar(20) NOT NULL,
  email varchar(60) UNIQUE NOT NULL,
  address varchar(30) NOT NULL,
  postcode varchar(8) NOT NULL,
  phone_number char(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS properties(
  property_id int NOT NULL AUTO_INCREMENT,
  fk_seller_id int NOT NULL,
  address varchar(30) UNIQUE NOT NULL,
  postcode varchar(10) NOT NULL,
  type varchar(20) NOT NULL,
  price decimal(10,2) NOT NULL,
  bedroom INT NOT NULL,
  bathroom INT NOT NULL,
  garden INT,
  status enum('FOR SALE','WITHDRAWN','SOLD') NOT NULL,
  PRIMARY KEY (property_id),
  FOREIGN KEY (fk_seller_id) REFERENCES sellers(seller_id)
);

CREATE TABLE IF NOT EXISTS customers(
  customer_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name varchar(20) NOT NULL,
  surname varchar(20) NOT NULL,
  email varchar(60) UNIQUE NOT NULL,
  address varchar(30) NOT NULL,
  postcode varchar(8) NOT NULL,
  phone_number int UNIQUE NOT NULL
);
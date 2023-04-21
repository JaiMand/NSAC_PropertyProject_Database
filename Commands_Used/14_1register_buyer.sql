USE ManagingProperties;

INSERT INTO customers (first_name, surname, email, address, postcode, phone_number)
SELECT 'John', 'Doe', 'johndoe@example.com', '456 Main St', '8fh 8hi', 07895551234
WHERE NOT EXISTS (
  SELECT *
  FROM customers
  WHERE first_name = 'John' AND surname = 'Doe'
);

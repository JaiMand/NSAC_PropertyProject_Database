USE ManagingProperties;

INSERT INTO sellers (first_name, surname, email, address, postcode, phone_number)
SELECT 'something', 'something', 'somethingsomething@example.com', '123 bla St', '76fh 4hi', 07938451234
WHERE NOT EXISTS (
  SELECT *
  FROM customers
  WHERE first_name = 'something' AND surname = 'something'
);
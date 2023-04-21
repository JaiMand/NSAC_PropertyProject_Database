USE ManagingProperties;

/* SELECT * FROM properties
WHERE price = 1000000;
 */
 
/* 
SELECT * FROM properties
WHERE address = '123 Main St'; */

SELECT * FROM properties
WHERE price BETWEEN '10000' AND '600000'
  AND status = 'FOR SALE';

/* SELECT * FROM properties
WHERE price BETWEEN '10000' AND '600000'
  OR status = 'FOR SALE'; */

DECLARE find_property AS NVARCHAR(MAX);
SET find_property = 'SELECT * FROM PROPERTY WHERE 1=1';

IF address IS NOT NULL
BEGIN
SET find_property = find_property + ' AND address LIKE ''%' + address + '%''';
END

IF type IS NOT NULL
BEGIN
SET find_property = find_property + ' AND price >= ' + type;
END

IF min_price IS NOT NULL
BEGIN
SET find_property = find_property + ' AND price >= ' + CAST(min_price AS NVARCHAR(20));
END

IF max_price IS NOT NULL
BEGIN
SET find_property = find_property + ' AND price <= ' + CAST(max_price AS NVARCHAR(20));
END

IF bedrooms IS NOT NULL
BEGIN
SET find_property = find_property + ' AND bedrooms = ' + CAST(bedrooms AS NVARCHAR(20));
END

IF bathrooms IS NOT NULL
BEGIN
SET find_property = find_property + ' AND bathrooms = ' + CAST(bathrooms AS NVARCHAR(20));
END
EXEC sp_executesql find_property;

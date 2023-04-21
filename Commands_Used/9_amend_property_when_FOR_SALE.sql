USE ManagingProperties;

UPDATE properties 
SET address = '456 Oakle St',
    postcode = 'M6H 2K2' 
WHERE address = '456 Elm St' AND status = 'FOR SALE';

SELECT*FROM properties WHERE status = 'FOR SALE';
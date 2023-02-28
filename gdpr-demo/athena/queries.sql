select count(*),customerid from icebergdemodb.customer group by customerid order by 1 limit 10;

SELECT count(*)
FROM icebergdemodb.customer
WHERE customerid = '59289';

MERGE INTO icebergdemodb.customer trg
USING (SELECT customerid
FROM icebergdemodb.customer
WHERE customerid = '59289') src
ON (trg.customerid = src.customerid)
WHEN MATCHED
THEN DELETE;

SELECT count(*)
FROM icebergdemodb.customer
WHERE customerid = '59289';

select count(*),customerid from icebergdemodb.customer group by customerid order by 1 limit 10;

SELECT customerid, phonenumber
FROM icebergdemodb.customer
WHERE customerid = '22696';

MERGE INTO icebergdemodb.customer trg
USING (SELECT customerid
FROM icebergdemodb.customer
WHERE customerid = '22696') src
ON (trg.customerid = src.customerid)
WHEN MATCHED
THEN UPDATE SET phonenumber = '000';


SELECT customerid, phonenumber
FROM icebergdemodb.customer
WHERE customerid = '22696';


VACUUM icebergdemodb.customer;

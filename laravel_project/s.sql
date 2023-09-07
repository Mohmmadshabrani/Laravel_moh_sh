SELECT
  S.id AS ID,
  CONCAT(TS.height, '/', Ts.width, '/', TS.rim) AS Size,
  T.brand as Brand,
  CONCAT(C.firstName, ' ', C.lastName) AS Customer,
  P.qunatity AS Quantity,
  (
    SELECT
      unit_price * qunatity
    FROM
      salesProduct
    WHERE
      TireID = T.id
      AND S.id = salesProduct.SaleId
  ) AS Price,
  FORMAT(S.date, 'yy/MM/dd') AS Date
from
  Sales S
  join salesProduct P on S.id = P.SaleId
  join NTireTable T on P.TireID = T.id
  join NTireSizeTable TS on TS.id = T.size_id
  join Customer C on S.Customer_ID = C.id
where
  Ts.width is not null
  AND T.stock > 0
  AND (
    T.brand LIKE '%' + @text + '%'
    OR T.COM LIKE '%' + @text + '%'
    OR C.firstName LIKE '%' + @text + '%'
    OR C.lastName LIKE '%' + @text + '%'
    OR C.phoneNumber LIKE '%' + @text + '%'
  )
union
select
  S.id AS ID,
  CONCAT(TS.height, '/', TS.rim) AS Size,
  T.brand as Brand,
  CONCAT(C.firstName, ' ', C.lastName) AS Customer,
  P.qunatity AS Quantity,
  (
    SELECT
      unit_price * qunatity
    FROM
      salesProduct
    WHERE
      TireID = T.id
      AND S.id = salesProduct.SaleId
  ) AS Price,
  FORMAT(S.date, 'yy/MM/dd') AS Date
from
  Sales S
  join salesProduct P on S.id = P.SaleId
  join NTireTable T on P.TireID = T.id
  join NTireSizeTable TS on TS.id = T.size_id
  join Customer C on S.Customer_ID = C.id
where
  Ts.width is null
  AND T.stock > 0
  AND (
    T.brand LIKE '%' + @text + '%'
    OR T.COM LIKE '%' + @text + '%'
    OR C.firstName LIKE '%' + @text + '%'
    OR C.lastName LIKE '%' + @text + '%'
    OR C.phoneNumber LIKE '%' + @text + '%'
  )
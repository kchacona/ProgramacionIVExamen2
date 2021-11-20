DROP TABLE IF EXISTS #ProductTemp

SELECT 
IdProducto,NombreProducto,PrecioProducto INTO #ProductTemp
FROM (
VALUES
(1,"COCA COLA 3LTS DESECHABLE",1850.00),
(2,"COCA COLA LATA 354 ML",450.00),
(3,"COCA COLA 2.5L RETORNABLE",1000.00),
(4,"COCA-COLA DESECHABLE 600 ML",850.00),
(5,"COCA COLA 1.5",1250.00),
(6,"COCA COLA 2.5L DESECHABE",1500.00)
)AS TEMP (IdProducto,NombreProducto,PrecioProducto)


----ACTUALIZAR DATOS---
UPDATE T SET
  T.NombreProducto = TM.NombreProducto,
  T.PrecioProducto = TM.PrecioProducto
FROM exp.Producto T
INNER JOIN #ProductTemp TM
    ON T.IdProducto= TM.IdProducto


----INSERTAR DATOS---

SET IDENTITY_INSERT exp.Producto ON

INSERT INTO exp.Producto(
IdProducto,NombreProducto,PrecioProducto )
SELECT
IdProducto,NombreProducto,PrecioProducto
FROM #ProductTemp 


EXCEPT
SELECT
IdProducto,NombreProducto,PrecioProducto
FROM exp.Producto


SET IDENTITY_INSERT exp.Producto OFF

GO
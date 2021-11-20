DROP TABLE IF EXISTS #OrdenTemp

SELECT 
IdOrden,IdProducto,CantidadProducto,Estado INTO #OrdenTemp
FROM (
VALUES
(1,1,3,1),
(2,1,2,1),
(3,2,5,1),
(4,2,7,1),
(5,6,1,1),
(6,4,12,0)
)AS TEMP (IdOrden,IdProducto,CantidadProducto,Estado)


----ACTUALIZAR DATOS---
UPDATE T SET
  T.IdProducto = TM.IdProducto,
  T.CantidadProducto = TM.CantidadProducto,
  T.Estado = TM.Estado
FROM exp.Orden T
INNER JOIN #OrdenTemp TM
    ON T.IdOrden= TM.IdOrden


----INSERTAR DATOS---

SET IDENTITY_INSERT exp.Orden ON

INSERT INTO exp.Orden(
IdOrden,IdProducto,CantidadProducto,Estado )
SELECT
IdOrden,IdProducto,CantidadProducto,Estado
FROM #OrdenTemp


EXCEPT
SELECT
IdOrden,IdProducto,CantidadProducto,Estado
FROM exp.Orden


SET IDENTITY_INSERT exp.Orden OFF

GO
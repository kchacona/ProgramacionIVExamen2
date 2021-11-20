DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT 
Id_TipoInquilino,Descripcion,Estado INTO #TipoInquilinoTemp
FROM (
VALUES
(1, 'FÍSICO',1),
(2, 'JURÍDICO',1)
)AS TEMP (Id_TipoInquilino,Descripcion,Estado)


----ACTUALIZAR DATOS---
UPDATE T SET
  T.Descripcion = TM.Descripcion,
  T.Estado = TM.Estado
FROM exp.TipoInquilino T
INNER JOIN #TipoInquilinoTemp TM
    ON T.Id_TipoInquilino= TM.Id_TipoInquilino


----INSERTAR DATOS---

SET IDENTITY_INSERT exp.TipoInquilino ON

INSERT INTO exp.TipoInquilino(
Id_TipoInquilino, Descripcion , Estado )
SELECT
Id_TipoInquilino, Descripcion , Estado
FROM #TipoInquilinoTemp


EXCEPT
SELECT
Id_TipoInquilino, Descripcion , Estado
FROM exp.TipoInquilino


SET IDENTITY_INSERT exp.TipoInquilino OFF

GO
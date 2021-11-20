CREATE PROCEDURE [dbo].[OrdenObtener]
      @IdOrden  int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
     T.IdProducto,
     T.CantidadProducto ,
     T.Estado
     
    FROM dbo.Orden T
    WHERE
    (@IdOrden  IS NULL OR IdOrden =@IdOrden )

END
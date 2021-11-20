CREATE PROCEDURE [dbo].[ProductoObtener]
      @IdProducto int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
     T.IdProducto,
     T.NombreProducto,
     T.PrecioProducto
     
    FROM dbo.Producto T
    WHERE
    (@IdProducto IS NULL OR IdProducto=@IdProducto)

END
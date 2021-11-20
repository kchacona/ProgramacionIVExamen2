CREATE PROCEDURE [dbo].[ProductoActualizar]
    @IdProducto int,
	@NombreProducto varchar(250),
	@PrecioProducto Float


AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

    BEGIN TRY
	
	UPDATE dbo.Producto SET
	 NombreProducto = @NombreProducto
	,PrecioProducto = @PrecioProducto
	WHERE 
	       IdProducto=@IdProducto
	
	  COMMIT TRANSACTION TRASA
	  SELECT 0 AS CodeError, '' AS MsgError

  END TRY

  BEGIN CATCH

	   SELECT 
			 ERROR_NUMBER() AS CodeError,
			 ERROR_MESSAGE() AS MsgError
   
	   ROLLBACK TRANSACTION TRASA

   END CATCH

 END
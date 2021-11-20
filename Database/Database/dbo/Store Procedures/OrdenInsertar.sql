CREATE PROCEDURE [dbo].[OrdenInsertar]
	@IdProducto Int,
	@CantidadProducto INT,
	@Estado bit

AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

    BEGIN TRY
	
	INSERT INTO dbo.Orden
	(IdProducto,
	 CantidadProducto,
	 Estado
	)
	VALUES
	(
	@IdProducto,
	@CantidadProducto,
	@Estado
	)

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




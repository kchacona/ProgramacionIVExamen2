CREATE PROCEDURE [dbo].[InquilinoObtener]
      @Id_TipoInquilino int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
     T.Id_TipoInquilino,
     T.Descripcion,
     T.Estado
     
    FROM dbo.TipoInquilino T
    WHERE
    (@Id_TipoInquilino IS NULL OR Id_TipoInquilino=@Id_TipoInquilino)

END
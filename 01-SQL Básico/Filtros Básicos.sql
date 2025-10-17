-- *** FUNCIONES WHERE *** --



-- Consultar todos los registros y todos los campos dónde haya más de 200.000 votos:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE Votos > 200000
;

-- Consultar todos los registros y todos los campos dónde haya menos de 200.000 votos:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE Votos < 200000
;

-- Consultar todos los registros y todos los campos dónde la entidad sea CHIHUAHU:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD = 'CHIHUAHUA'
;

-- Consultar todos los registros y todos los campos cuya fecha de publicación sea anterior o igual al 04 de junio de 2024:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE Fecha_Publicación <= '2024-06-04'
;

-- Consultar todos los campos y ver los registros de la entidad MORELOS y cuya fecha de publicación sea posterior al 05 de junio de 2024:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE Fecha_Publicación > '2024-06-05'
    AND ENTIDAD = 'MORELOS'
;

-- Consultar todos los campos y ver los registros de la entidad MORELOS 0 cuya fecha de publicación sea posterior al 05 de junio de 2024:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE Fecha_Publicación > '2024-06-05'
    OR ENTIDAD = 'MORELOS'
;

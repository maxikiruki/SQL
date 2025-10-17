-- *** OPERADORES Y NULOS *** --



-- Consultar todos los registros y todos los campos de las entidades HIDALGO, MORELOS y PUEBLA:
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD in ('HIDALGO', 'MORELOS', 'PUEBLA')
;

-- Consultar todos los campos y los registros filtrados por las entidades NUEVO LEÓN, OAXACA y VERACRUZ ,y cuya fecha de publicación sea 05 de junio de 2024 o 06 de junio de 2024 :
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD in ('NUEVO LEÓN', 'OAXACA', 'VERACRUZ')
  AND Fecha_Publicación >= '2024-06-05'
  AND Fecha_Publicación <= '2024-06-06'
;

-- Consultar todos los campos y los registros filtrados por las entidades NUEVO LEÓN, OAXACA y VERACRUZ ,y cuya fecha de publicación sea 05 de junio de 2024 o 06 de junio de 2024 :
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD in ('NUEVO LEÓN', 'OAXACA', 'VERACRUZ')
  AND Fecha_Publicación BETWEEN '2024-06-05' AND '2024-06-06'
;

-- Consultar todos los campos y los registros filtrados por las entidades NUEVO LEÓN, OAXACA y VERACRUZ ,y que los votos sean igual o esten entre 180.000 y 200.000 :
SELECT [ID_ENTIDAD]
      ,[ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
      ,[Fecha_Publicación] 
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD in ('NUEVO LEÓN', 'OAXACA', 'VERACRUZ')
  AND Votos BETWEEN 180000 AND 200000
;

-- Consultar todos los campos y los registros filtrados cuando la entidad se encuentre entre CHIHUAHUA e HIDALGO :
SELECT *
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD BETWEEN 'CHIHUAHUA' AND 'HIDALGO'
;

-- Consultar todos los campos y los registros cuyo distrito federal empiece por SAN :
SELECT *
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL LIKE 'SAN%'
;

-- Consultar todos los campos y los registros cuyo distrito federal contenga SANTIAGO :
SELECT *
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL LIKE '%SANTIAGO%'
;

-- Consultar todos los campos y los registros cuyo distrito federal finalice por PAZ:
SELECT *
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL LIKE '%PAZ'
;

-- Consultar los campos entidad, distrito y votos, cuyos registros tengan el distrito con el valor NULL y la entidades sea AGUASCALIENTES, CAMPECHE, DURANGO, GUANAJUATO O MICHOACÁN :
SELECT [ENTIDAD]
      ,[DISTRITO_FEDERAL] 
      ,[Votos]
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD IN ('AGUASCALIENTES', 'CAMPECHE', 'DURANGO', 'GUANAJUATO', 'MICHOACÁN')
  AND DISTRITO_FEDERAL IS NULL
;

-- Consultar los campos entidad, distrito y votos, cuyos registros no tengan el distrito con el valor NULL y la entidades sea AGUASCALIENTES, CAMPECHE, DURANGO, GUANAJUATO O MICHOACÁN :
SELECT [ENTIDAD]
      ,[DISTRITO_FEDERAL]
      ,[Votos]
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD IN ('AGUASCALIENTES', 'CAMPECHE', 'DURANGO', 'GUANAJUATO', 'MICHOACÁN')
  AND DISTRITO_FEDERAL IS NOTNULL
;

-- Consultar los campos entidad, distrito y votos, y asignar un valor a cuyos registros tengan el distrito con el valor NULL y la entidades sea AGUASCALIENTES, CAMPECHE, DURANGO, GUANAJUATO O MICHOACÁN :
SELECT [ENTIDAD]
      ,COALESCE([DISTRITO_FEDERAL], 'DISTRITO SIN NOMBRE')
      ,[Votos]
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD IN ('AGUASCALIENTES', 'CAMPECHE', 'DURANGO', 'GUANAJUATO', 'MICHOACÁN')
  AND DISTRITO_FEDERAL IS NULL
;

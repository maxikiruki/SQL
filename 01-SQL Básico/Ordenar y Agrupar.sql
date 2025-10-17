-- *** ORDENACIONES Y AGRUPACIONES *** --



-- Consultar todos los registros y todos los campos y mostrarlo ordenado alfabeticamente por la columna Entidad:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY ENTIDAD
;

-- Consultar todos los registros y todos los campos y mostrarlo ordenado alfabeticamente por la columna Entidad de forma ascendente:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY ENTIDAD ASC
;

-- Consultar todos los registros y todos los campos y mostrarlo ordenado alfabeticamente por la columna Entidad de forma descendente:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY ENTIDAD DESC
;

-- Consultar todos los registros y todos los campos y mostrarlo ordenado por la consulta distrito viendo los nulos los últimos:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY DISTRITO_FEDERAL DESC
;


-- Consultar todos los registros y todos los campos y mostrarlo ordenado por fecha y entidad:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY Fecha_Publicación, ENTIDAD
;

-- Consultar todos los campos ordenando por entidad y distrito y mostrar los 10 primeros registros:
SELECT * 
  FROM [SQLBasico].[dbo].[Votos]
  ORDER BY ENTIDAD, DISTRITO_FEDERAL
  OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
;
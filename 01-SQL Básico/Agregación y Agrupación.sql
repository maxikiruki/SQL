-- *** AGREGACIONES Y AGRUPACIONES *** --



-- Contar la cantidad de registros que hay:
SELECT COUNT(*) 
  FROM [SQLBasico].[dbo].[Votos]
;

-- Contar la cantidad de registros que hay en la columna distrito si ncontabilizar los nulos:
SELECT COUNT(DISTRITO_FEDERAL) 
  FROM [SQLBasico].[dbo].[Votos]
;

-- Contar la cantidad de registros que hay y llamarlo papeletas:
SELECT COUNT(*) as Papeletas
  FROM [SQLBasico].[dbo].[Votos]
;

-- Contar la cantidad de registros de votos que hay para la entidad AGUASCALIENTES y llamarlo papeletas:
SELECT COUNT(Votos) as Papeletas
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD = 'AGUASCALIENTES'
;

-- Contar la cantidad de registros de votos que hay cuando el distrito es nulo y llamarlo papeletas:
SELECT COUNT(Votos) as Papeletas
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
;

-- Contar la cantidad de registros de votos que hay cuando el distrito es nulo y la entidad es AGUASCALIENTES, BAJA CALIFORNIA o CAMPECHE y llamarlo papeletas:
SELECT COUNT(Votos) as Papeletas
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
  AND ENTIDAD IN ('AGUASCALIENTES', 'BAJA CALIFORNIA', 'CAMPECHE')
;

-- Sumar el valor de los votos :
SELECT SUM(Votos)
  FROM [SQLBasico].[dbo].[Votos]
;

-- Sumar el valor de los votos y llamarlo Total_Votos :
SELECT SUM(Votos) as Total_Votos
  FROM [SQLBasico].[dbo].[Votos]
;

-- Sumar el valor de los votos de la entidad AGUASCALIENTES y llamarlo Total_Votos :
SELECT SUM(Votos) as Total_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE ENTIDAD = 'AGUASCALIENTES'
;

-- Sumar el valor de los votos de los distritos sin nombre y llamarlo Total_Votos :
SELECT SUM(Votos) as Total_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
;

-- Sumar el valor de los votos de los distritos sin nombre de las entidades AGUASCALIENTES, BAJA CALIFORNIA y CAMPECHE,y llamarlo Total_Votos :
SELECT SUM(Votos) as Total_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
  AND ENTIDAD IN ('AGUASCALIENTES', 'BAJA CALIFORNIA', 'CAMPECHE')
;

-- Calcular el valor promedio del total de los votos y llamarlo Promedio_Votos :
SELECT AVG(Votos) as Promedio_Votos
  FROM [SQLBasico].[dbo].[Votos]
;

-- Calcular el valor promedio de los votos de los distritos sin nombre y llamarlo Promedio_Votos :
SELECT AVG(Votos) as Promedio_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
;

-- Calcular el valor promedio de los votos de los distritos que contengan PAZ en su nombre, y llamarlo Promedio_Votos :
SELECT AVG(Votos) as Promedio_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL LIKE '%PAZ%'
;

-- Calcular el valor promedio de los votos de los distritos sin nombre de las entidades AGUASCALIENTES, BAJA CALIFORNIA y CAMPECHE,y llamarlo Promedio_Votos :
SELECT AVG(Votos) as Promedio_Votos
  FROM [SQLBasico].[dbo].[Votos]
  WHERE DISTRITO_FEDERAL IS NULL
  AND ENTIDAD IN ('AGUASCALIENTES', 'BAJA CALIFORNIA', 'CAMPECHE')
;

-- Calcular el valor mínimo y máximo en cadena de texto:
SELECT MIN(DISTRITO_FEDERAL) as Primer_Distrito,
  MAX(DISTRITO_FEDERAL) as UltimoDistrito
	FROM votos;

-- Calcular el valor mínimo y máximo de los votos:
SELECT MIN(Votos) as Min_Votos, 
  MAX(Votos) as Max_Votos
  FROM votos;

-- Calcular el valor mínimo y máximo de los votos después del 5 de junio:
SELECT MIN(Votos) as Min_Votos, 
  MAX(Votos) as Max_Votos
  FROM votos
  WHERE Fecha_Publicación > '2024-06-05';

-- Calcular e l mínimo de votos y el promedio de varias entidades:
SELECT MIN(Votos) as Min_Votos, 
  AVG(Votos) as Promedio_Votos
  FROM votos
  WHERE ENTIDAD IN ('AGUASCALIENTES', 'BAJA CALIFORNIA', 'CAMPECHE');

-- Calcular el mínimo, máximo y el promedio de votos agrupado por Entidad:
SELECT MIN(Votos) as Min_Votos,
  MAX(Votos) as Max_Votos,
  AVG(Votos) as Promedio_Votos,
  ENTIDAD
  FROM votos
  GROUP BY ENTIDAD;

-- Calcular el mínimo, máximo y el promedio de votos agrupado por Entidad y Fecha:
SELECT MIN(Votos) as Min_Votos,
  MAX(Votos) as Max_Votos,
  AVG(Votos) as Promedio_Votos,
  ENTIDAD,
  Fecha_Publicación
  FROM votos
  GROUP BY Fecha_Publicación, ENTIDAD;

-- Calcular el total, mínimo, máximo y el promedio de votos agrupado por Entidad filtrando por cantidad de votos:
SELECT SUM(Votos) as Total_Votos,
  MIN(Votos) as Min_Votos,
  MAX(Votos) as Max_Votos,
  AVG(Votos) as Promedio_Votos,
  ENTIDAD
  FROM votos
  GROUP BY ENTIDAD
  HAVING SUM(Votos) > 1500000;

-- Calcular el total, mínimo, máximo y el promedio de votos agrupado por Entidad y Distrito filtrando por cantidad de votos:
SELECT SUM(Votos) as Total_Votos,
  MIN(Votos) as Min_Votos,
  MAX(Votos) as Max_Votos,
  AVG(Votos) as Promedio_Votos,
  DISTRITO_FEDERAL,
  ENTIDAD
  FROM votos
  GROUP BY ENTIDAD, DISTRITO_FEDERAL
  HAVING SUM(Votos) > 500000
  ORDER BY ENTIDAD;

-- Calcular el total, mínimo, máximo y el promedio de votos agrupado por Entidad y Fecha filtrando por cantidad de votos:
SELECT SUM(Votos) as Total_Votos,
  MIN(Votos) as Min_Votos,
  MAX(Votos) as Max_Votos,
  AVG(Votos) as Promedio_Votos,
  Fecha_Publicación,
  ENTIDAD
  FROM votos
  GROUP BY ENTIDAD, Fecha_Publicación
  HAVING SUM(Votos) > 10000 AND MIN(Votos) = MAX(Votos)
  ORDER BY ENTIDAD;
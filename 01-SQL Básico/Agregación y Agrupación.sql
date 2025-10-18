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
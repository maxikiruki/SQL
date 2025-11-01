-- *** RELACIONES ENTRE TABLAS *** --



-- Consultar la población de cada entidad, distrito y su cantidad de votos:
SELECT 
    Entidad AS Estado
    ,Votos.DISTRITO_FEDERAL AS Distrito
    ,Votos AS Votos
    ,población AS Población
    FROM Votos INNER JOIN Poblacion 
    ON Votos.DISTRITO_FEDERAL = Poblacion.DISTRITO_FEDERAL ;

-- Consultar la población de cada entidad, distrito y su cantidad de votos filtrando por población:
SELECT 
    Entidad AS Estado
    ,v.DISTRITO_FEDERAL AS Distrito
    ,Votos AS Votos
    ,población AS Población
    FROM Votos AS v INNER JOIN Poblacion AS p
    ON v.DISTRITO_FEDERAL = p.DISTRITO_FEDERAL 
    WHERE p.Población > 1000000;

-- Suma de población para algunas entidades:
SELECT 
    Entidad AS Estado
    ,SUM(población) AS Población_Estatal
    FROM Votos AS v INNER JOIN Poblacion AS p
    ON v.DISTRITO_FEDERAL = p.DISTRITO_FEDERAL 
    WHERE Entidad in ('NAYARIT', 'HIDALGO', 'MORELOS')
    GROUP BY Entidad;
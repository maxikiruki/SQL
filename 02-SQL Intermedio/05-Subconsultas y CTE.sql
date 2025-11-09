-- *** SUBCONSULTAS y CTEs *** --



-- Mostrar la popularidad de cada canción comparada con la máxima:
SELECT
    titulo
    ,popularidad
    ,(SELECT
        MAX(popularidad)
        FROM Canciones
    ) AS Máxima_Popularidad
    FROM Canciones
    ORDER BY popularidad DESC
;

-- Mostrar cada canción y su duración y compararla con la duración promedio de todas las canciones:
SELECT
    titulo
    ,duracion
    ,(SELECT
        AVG(duracion)
        FROM Canciones
    ) AS Duración_Promedio
    FROM Canciones
    ORDER BY duracion DESC
;

-- Consultar las canciones que duran más que el promedio:
SELECT
    titulo
    ,duracion
    FROM Canciones
    WHERE duracion > 
    (SELECT
        AVG(duracion)
        FROM Canciones
    ) 
    ORDER BY duracion DESC
;

-- Consultar el top 3 artistas con mas canciones:
SELECT
    Artista
    ,Total_Canciones
    FROM ( 
        -- Contar las canciones por artista 
        SELECT
            A.nombre AS Artista
            ,COUNT(*) AS Total_Canciones
            FROM Artistas A
            INNER JOIN Canciones C ON A.artista_id = C.artista_id
            GROUP BY A.nombre
    ) AS Conteo 
    -- -----------------
    ORDER BY Total_Canciones DESC
    LIMIT 3
;

-- Encontrar el usuario más antiguo de Colombia que escucha canciones populares:

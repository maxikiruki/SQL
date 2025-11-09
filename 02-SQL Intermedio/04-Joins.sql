-- *** JOINS AVANZADOS *** --



-- Consultar las canciones que tienen artista, y existe el artista en la tabla artista:
SELECT *
    FROM Canciones c
    INNER JOIN Artistas a ON c.artista_id = a.artista_id
;

-- Consultar todas las canciones con o sin artista:
SELECT 
    c.titulo
    ,a.nombre
    FROM Canciones c
    LEFT JOIN Artistas a ON c.artista_id = a.artista_id
;

-- Consultar todos los artistas con o sin canción:
SELECT 
    c.titulo
    ,a.nombre
    FROM Canciones c
    RIGHT JOIN Artistas a ON c.artista_id = a.artista_id
;

-- Consultar todos los registros de ambas tablas:
SELECT 
    c.titulo AS 'Cancion'
    ,a.nombre AS 'Artista'
    FROM Canciones c
    LEFT JOIN Artistas a ON c.artista_id = a.artista_id
    UNION
    SELECT
    c.titulo
    ,a.nombre
    FROM Canciones c
    RIGHT JOIN Artistas a ON c.artista_id = a.artista_id
    WHERE c.artista_id IS NULL
;

-- (PRODUCTO CARTESIANO) (TODOS CONTRA TODOS) Muestra todas las canciones con cada uno de los artistas:
SELECT 
    c.titulo
    ,a.nombre
    FROM Canciones c
    CROSS JOIN Artistas a 
;

-- (AUTO REFERENCIA) (JERARQUÍA) Seleccionar y crear jerarquí con CASE:
SELECT 
   CASE
       WHEN g1.nivel = 1 THEN CONCAT('📁 ', g1.nombre) -- Nivel 1: Género raíz (Música), se muestra con un emoji de carpeta
       WHEN g1.nivel = 2 THEN CONCAT('    ├── 📂 ', g1.nombre) -- Nivel 2: Géneros principales, se muestran con indentación y emoji de carpeta
       ELSE CONCAT('            ├── 🎵 ', g1.nombre)         -- Nivel 3: Subgéneros, se muestran con mayor indentación y emoji de nota musical
   END AS 'Jerarquía de Género',
   g1.nivel as 'Nivel'    -- Muestra el nivel numérico de cada género
-- Tabla principal de géneros
    FROM Generos g1 -- Join con la misma tabla para establecer relaciones padre-hijo
    LEFT JOIN Generos g2 ON g1.genero_padre_id = g2.genero_id -- Filtros para mostrar solo:
    WHERE g1.nombre = 'Electrónica Latina'   -- El género específico que queremos ver
    OR g1.genero_padre_id IN (SELECT genero_id FROM Generos WHERE nombre = 'Electrónica Latina')  -- Sus subgéneros
    OR g1.nombre = 'Música'     -- El género raíz
    ORDER BY g1.nivel, g1.nombre; -- Ordenamiento por nivel y nombre para mantener la jerarquía
;

-- NATURAL JOIN, Hacer JOIN con el mismo nombre de atributo en otra tabla:
SELECT 
    *
    FROM Canciones c
    NATURAL JOIN Artistas a
;

-- NATURAL JOIN, pero especificando la columna en común:
SELECT 
    c.titulo
    ,a.nombre
    FROM Canciones c
    JOIN Artistas a USING (artista_id)
;

-- Consultar canciones con popularidad mayor a 93 y ver el artista y el género (no aparecen canciones sin artista ni género):
SELECT 
    C.titulo AS Cancion
    ,A.nombre AS Artista
    ,G.nombre AS Género
    ,C.popularidad AS Popularidad 
    FROM Canciones C 
    INNER JOIN Artistas A ON C.artista_id = A.artista_id
    INNER JOIN Generos G ON G.genero_id = A.genero_id
    WHERE C.popularidad > 93
    ORDER BY C.popularidad DESC
;

-- Consultar todos los usuarios que hayan o no haya escuchado música, y las canciones con o sin artista y su género esté o no relleno:
SELECT 
    U.nombre AS Usuario
    ,U.pais AS País
    ,C.titulo AS Canción
    ,A.nombre AS Artista
    ,G.nombre AS Género
    FROM Usuarios U 
    LEFT JOIN Reproducciones R ON U.usuario_id = R.usuario_id
    LEFT JOIN Canciones C ON C.cancion_id = R.cancion_id
    LEFT JOIN Artistas A ON C.artista_id = A.artista_id
    LEFT JOIN Generos G ON G.genero_id = A.genero_id
    ORDER BY U.nombre
;

-- Consultar todos los géneros y artistas, y las cacniones con oyentes únicos por canción:
SELECT 
    C.titulo AS Canción
    ,A.nombre AS Artista
    ,A.pais AS País_Artista
    ,G.nombre AS Género
    ,COUNT(DISTINCT U.usuario_id) AS Total_Oyentes
    FROM Usuarios U 
    RIGHT JOIN Reproducciones R ON U.usuario_id = R.usuario_id
    RIGHT JOIN Canciones C ON C.cancion_id = R.cancion_id
    RIGHT JOIN Artistas A ON C.artista_id = A.artista_id
    RIGHT JOIN Generos G ON G.genero_id = A.genero_id
    GROUP BY G.nombre, A.nombre, A.pais, C.titulo
    ORDER BY Total_Oyentes DESC
;
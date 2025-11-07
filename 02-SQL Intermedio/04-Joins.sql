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

--  NATURAL JOIN, pero especificando la columna en común:
SELECT 
    c.titulo
    ,a.nombre
    FROM Canciones c
    JOIN Artistas a USING (artista_id)
;
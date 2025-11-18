-- *** FUNCIONES AVANZADAS *** --



-- Clasificar las canciones en base a su calificación y añadirle estrellas:
SELECT
    c.titulo
    ,CASE r.calificacion
        WHEN 5 THEN '*****'
        WHEN 4 THEN '****'
        WHEN 3 THEN '***'
        WHEN 2 THEN '**'
        WHEN 1 THEN '*'
        ELSE 'Sin clasificación'
    END AS Estrellas
    FROM Canciones c
    LEFT JOIN Reproducciones r ON r.cancion_id = c.cancion_id
;

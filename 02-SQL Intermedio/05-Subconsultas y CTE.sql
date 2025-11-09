-- *** SUBCONSULTAS y CTEs (Common Table Expressions) *** --



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
-- PASOS DE DENTRO A FUERA:
-- PRIMERO: Calcular cuanto se ha reproducido cada canción
-- SEGUNDO: Calcular las canciones que se han esuchado más que el promedio
-- TERCERO: Calcular los usuarios que escuchan las canciones más reproducidas
-- CUARTO: Filtrar por usuario de Colombia
SELECT
    U.nombre AS Usuario
    ,U.fecha_registro AS Miembro_Desde
    FROM Usuarios U
    WHERE U.pais = "Colombia"
    AND U.nombre IN (
        SELECT
        U2.nombre
        FROM Usuarios U2
        JOIN Reproducciones R ON R.usuario_id = U2.usuario_id
        JOIN Canciones C ON R.cancion_id = C.cancion_id
        WHERE c.titulo IN (
            SELECT
            C2.titulo
            FROM Canciones C2
            JOIN Reproducciones R2 ON c2.cancion_id = R2.cancion_id
            GROUP BY C2.titulo
            HAVING COUNT(R2.reproduccion_id) > (
                SELECT AVG(Veces_Reproducida)
                FROM (
                    SELECT COUNT(reproduccion_id) AS Veces_Reproducida
                    FROM Reproducciones
                    GROUP BY cancion_id
                ) AS Estadisticas_Reproduccion
            )
        )
    )
    ORDER BY Miembro_Desde ASC
    LIMIT 1
;

-- USO DE CTEs
-- Ver cuántos usuarios escuchan canciones populares:
-- Ver cuántas reproducciones tienen las canciones populares:
WITH canciones_populares AS (
    SELECT 
    cancion_id
    ,titulo
    FROM Canciones
    WHERE popularidad > 80
)

SELECT
    COUNT(DISTINCT U.usuario_id) AS Total_Usuarios
    FROM canciones_populares CP
    JOIN Reproducciones R ON R.cancion_id = CP.cancion_id
    JOIN Usuarios U ON R.usuario_id = U.usuario_id
;

SELECT
    COUNT(*) AS Total_Reproducciones
    FROM canciones_populares CP
    JOIN Reproducciones R ON R.cancion_id = CP.cancion_id
;

-- Consultar las reproducciones de canciones populares por usuarios activos en el último año:
WITH 
canciones_populares AS (
    SELECT 
        cancion_id
        ,titulo
        FROM Canciones
        WHERE popularidad > 80
),
usuarios_activos AS (
    SELECT
        usuario_id
        ,nombre
        FROM Usuarios
        WHERE ultima_conexion >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
)

SELECT 
    CP.titulo
    ,COUNT(*) AS Reproducciones
    FROM canciones_populares AS CP
    JOIN Reproducciones R ON R.cancion_id = CP.cancion_id
    JOIN usuarios_activos UA ON R.usuario_id = UA.usuario_id
    GROUP BY CP.titulo
;


-- USO DE CTEs Recursivos


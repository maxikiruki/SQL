-- *** FUNCIONES DE TEXTO *** --



-- Concatenar el estado y el distriro:
SELECT CONCAT(Entidad, ' - ', Distrito_Federal) AS Estado_Distrito
    FROM Votos;

-- Obtener caractares de la longitud que seleccionemos:
SELECT SUBSTRING(ENTIDAD,6,10) AS PALABRA
    FROM Votos
    WHERE ENTIDAD = "BAJA CALIFORNIA";

-- Calcular número de caracteres de un campo:
SELECT ENTIDAD
    ,LEN(ENTIDAD) AS LONGITUD
    FROM Votos;
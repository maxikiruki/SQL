-- *** FUNCIONES MATEMÁTICAS *** --



-- Obtener fecha y hora actual:
SELECT GETDATE();

-- Agrupar ventas por mes y además redondear.
SELECT 
    FORMAT(Fecha_Venta, 'yyyy-MM-01') AS MES,
    AVG(Ventas) AS PROM_VENTAS,
    ROUND(AVG(Ventas), 2) AS PROM_VENTAS_ROUND,
    FLOOR(AVG(Ventas)) AS PROM_VENTAS_FLOOR,
    CEILING(AVG(Ventas)) AS PROM_VENTAS_CEILING
FROM ventas
GROUP BY FORMAT(Fecha_Venta, 'yyyy-MM-01')
ORDER BY MES;

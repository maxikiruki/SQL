-- *** FUNCIONES DE FECHAS *** --



-- Obtener fecha y hora actual:
SELECT GETDATE();

-- Obtener la fecha unicamente:
SELECT CAST(GETDATE() AS DATE);

-- Obtener la hora unicamente:
SELECT CAST(GETDATE() AS TIME);

-- Obtener las ventas de hoy:
SELECT SUM(Ventas) AS Venta_Total_Hoy
    FROM Ventas
    WHERE Fecha_Venta = CAST(GETDATE() AS DATE);

-- Consultar las ventas agrupado por fecha versión 2022:
SELECT DATETRUNC(MONTH, Fecha_Venta) AS MES
    ,SUM(Ventas) AS Suma_Ventas
    ,AVG(Ventas) AS Promedio_Venta
    FROM Ventas
    GROUP BY DATETRUNC(MONTH, Fecha_Venta)
    ORDER BY MES;

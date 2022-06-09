use fauna2;

SELECT SP, SUM(ABUND_ABS) AS TOTAL FROM muestreo 
GROUP BY SP 
ORDER BY TOTAL DESC;


SELECT p.N_COBERT, m.SP, SUM(ABUND_ABS) 
FROM muestreo m 
INNER JOIN punto p on PUNTO_MUEST = ID_MUES_PT
GROUP BY m.SP
-- HAVING N_COBERT LIKE '%Estanques%' 
-- complementa group con la condición de 
-- aquellos que tengan (having) la palabra Estanques
ORDER BY p.N_COBERT, m.SP;

-- COUNT:  usada en este ejemplo, para contar el número de especies 
--  por cada cobertura vegetael usando el join de la tabla anterior:
SELECT p.N_COBERT, COUNT(DISTINCT(m.SP)) 
FROM muestreo m 
INNER JOIN punto p on PUNTO_MUEST = ID_MUES_PT
GROUP BY p.N_COBERT
ORDER BY p.N_COBERT;

--  Max o Min Usada para conocer el número máximo de individuos de cada especie por cobertura
-- OJO---- REVISAR--- NO DA LOS MÁXIMOS DE SCARTHYLA VIGILANS OJO ----
SELECT p.N_COBERT, MAX(ABUND_ABS) AS MAX_ABUND
FROM muestreo m 
INNER JOIN punto p on PUNTO_MUEST = ID_MUES_PT
GROUP BY p.N_COBERT;

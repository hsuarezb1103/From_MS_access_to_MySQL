select i.SCIENTIFIC_NAME, i.CATEG_CIT, i.MIGRACION, i.DISTR_ALT, t.ORDEN, t.FAMILIA from infoespecies i left join taxonomia t on t.ESPECIE = i.SCIENTIFIC_NAME;
select i.SCIENTIFIC_NAME, i.CATEG_CIT, i.MIGRACION, i.DISTR_ALT, t.CLASE, t.ORDEN, t.FAMILIA, t.GENERO from infoespecies i inner join taxonomia t on t.ESPECIE = i.SCIENTIFIC_NAME;
select t.CLASE, t.ORDEN, t.FAMILIA, t.GENERO, t.ESPECIE, i.CATEG_CIT, i.CATEG_UICN, i.CATE_MINIS from taxonomia t right join infoespecies i on i.SCIENTIFIC_NAME = t.ESPECIE;

SELECT * FROM taxonomia;

SELECT * FROM infoespecies;

select * from taxonomia where N_COMUN = 'Mono aullador';

select * from infoespecies where CATEG_CIT = 'Apéndice II' AND CATEG_UICN = 'Peligro Crítico (CR)';

select * from infoespecies where CATEG_UICN = 'Vulnerable (VU)' Or CATE_MINIS = 'Vulnerable (VU)';

select * from infoespecies where CATEG_UICN = 'Vulnerable (VU)' and CATE_MINIS = 'Vulnerable (VU)';

select * from infoespecies where CATEG_UICN = 'Peligro Crítico (CR)' and CATE_MINIS = 'Peligro Crítico (CR)';

select * from infoespecies where CATEG_UICN != 'Preocupación Menor (LC)' and CATE_MINIS != 'Preocupación Menor (LC)' and CATEG_CIT != 'No aplica';

select * from infoespecies where CATEG_UICN != 'Preocupación Menor (LC)' or CATE_MINIS != 'Preocupación Menor (LC)' or CATEG_CIT != 'No aplica';

select * from infoespecies where CATEG_CIT != 'No aplica';

select * from infoespecies where 
CATEG_UICN != 'Preocupación Menor (LC)' 
and CATEG_UICN != 'No Aplica' 
and CATEG_UICN != 'No Evaluado (NE)' 
AND CATEG_UICN IS NOT NULL 
and CATE_MINIS != 'No aplica'
AND CATE_MINIS IS NOT NULL;

SELECT * FROM infoespecies where
MIGRACION = 'Sí' OR MIGRACION = 'Si' or MIGRACION = 'si';

SELECT COUNT(ESPECIE), FAMILIA FROM taxonomia group by FAMILIA;

SELECT CLASE, COUNT(DISTINCT(FAMILIA)) FAMILIAS FROM taxonomia group by CLASE;

SELECT FAMILIA, COUNT(DISTINCT(ESPECIE)) ESPECIES FROM taxonomia WHERE CLASE = 'AVES' group by FAMILIA ORDER BY ESPECIES DESC;

SELECT FAMILIA, COUNT(DISTINCT(ESPECIE)) ESPECIES FROM taxonomia WHERE CLASE = 'AMPHIBIA' GROUP BY FAMILIA ORDER BY ESPECIES DESC;

SELECT CLASE, COUNT(DISTINCT(FAMILIA)) FAMILIAS FROM taxonomia GROUP BY CLASE ORDER BY FAMILIAS DESC;

SELECT T_DISTRIB, COUNT(T_DISTRIB) CANTIDAD FROM infoespecies WHERE T_DISTRIB != 'Cosmopolita' group by T_DISTRIB;

SELECT T_DISTRIB, COUNT(T_DISTRIB) CANTIDAD FROM infoespecies WHERE T_DISTRIB != 'Restringida' group by T_DISTRIB;

SELECT N_COMUN, COUNT(N_COMUN) CANTIDAD FROM taxonomia WHERE N_COMUN IS NOT NULL GROUP BY N_COMUN ORDER BY CANTIDAD DESC;

select * from taxonomia;


-- ----------- TAREAS PARA PARCTICAR-------------

-- 1.  Provide a query showing species (just their scientific name, Local name, absolute abundance and IANR) who are not In GCT.
select t.ESPECIE, t.N_COMUN, m.ABUND_ABS, p.NOMBRE from taxonomia t 
inner join muestreo m on t.ESPECIE = m.SP 
inner join punto p on p.ID_MUES_PT = m.PUNTO_MUEST WHERE p.GGERENCIA != 'GCT';

-- 2.  Provide a query only showing species from GCT (taxonomic classification and Gerencia).
select t.CLASE, t.ORDEN, t.FAMILIA, t.GENERO, m.SP, p.GGERENCIA from taxonomia t 
inner join muestreo m on t.ESPECIE = m.SP 
inner join punto p on ID_MUES_PT = m.PUNTO_MUEST where p.GGERENCIA = 'GCT';

-- 3.  Provide a query showing species into threatened lists (just Scientific name, local name, Absolute abundance, IUCN status, 
-- CITES satatus, Res 1912 status, Uses and Gerencia from GMA).
SELECT  m.SP Especie, t.N_COMUN Nombre_local, sum(ABUND_ABS) Abundancia_Absoluta, i.CATEG_UICN Status_UICN, i.CATEG_CIT Apéndice_CITES, i.CATE_MINIS Res_1912, i.USO, p.GGERENCIA Gerencia
from infoespecies i 
inner join muestreo m on i.SCIENTIFIC_NAME = m.SP
inner join punto p on p.ID_MUES_PT = m.PUNTO_MUEST  
inner join taxonomia t on t.ESPECIE = m.SP where p.GGERENCIA = 'GMA'
group by Especie order by Abundancia_Absoluta DESC;

-- 4.  Provide a query showing only species, Absolute abundance, into amphibia and reptilia class from GMA.
select t.CLASE, m.SP Especie, sum(m.ABUND_ABS) Abundancia_Absoluta, p.GGERENCIA from punto p 
inner join muestreo m on p.ID_MUES_PT = m.PUNTO_MUEST 
inner join taxonomia t on ESPECIE = m.SP
WHERE t.CLASE = 'AMPHIBIA' and p.GGERENCIA = 'GMA' OR t.CLASE = 'REPTILIA' AND p.GGERENCIA = 'GMA'
GROUP BY m.SP order by t.CLASE asc, Abundancia_Absoluta DESC;

-- 5.  Provide a query showing only species, Absolute abundance, into amphibia and reptilia class from GCT.
select t.CLASE, m.SP, SUM(m.ABUND_ABS) ABUNDANCIA, p.GGERENCIA FROM punto p 
inner join muestreo m on p.ID_MUES_PT = m.PUNTO_MUEST
inner join taxonomia t on t.ESPECIE = m.SP
where t.CLASE = 'AMPHIBIA' and p.GGERENCIA = 'GCT' OR t.CLASE = 'REPTILIA' AND p.GGERENCIA = 'GCT'
GROUP BY m.SP
ORDER BY t.CLASE ASC, ABUNDANCIA DESC;

-- 6.  Provide a query showing a unique list of families and genuses from aves class registered at GMA and GCT.
select t.FAMILIA, t.GENERO, p.GGERENCIA FROM taxonomia t
inner join muestreo m on t.ESPECIE = m.SP
inner join punto p on PUNTO_MUEST = ID_MUES_PT
where p.GGERENCIA = 'GCT' or p.GGERENCIA = 'GMA' AND t.CLASE = 'AVES'
GROUP BY t.GENERO
ORDER BY p.GGERENCIA ASC, t.FAMILIA ASC;   

-- 7.  Provide a query showing species (just SP, PUNTO_MUEST, ABUND_ABS, DETERM, COTA, X_COORD, Y_COORD and GERENCIA).  
SELECT 
	m.SP, m.PUNTO_MUEST, m.ABUND_ABS, m.DETERM, p.COTA, p.ESTE, p.NORTE, p.GGERENCIA
FROM 
	muestreo m
INNER JOIN 
	punto p
ON
	PUNTO_MUEST = ID_MUES_PT
ORDER BY
	p.GGERENCIA DESC;


-- Provide a query showing (Class, Order, Family, Genus, Specie and all columns of table infoespecies)

SELECT 
	t.CLASE, t.ORDEN, t.FAMILIA, t.GENERO, i.SCIENTIFIC_NAME, t.N_COMUN, 
    i.T_DISTRIB, i.VEDA, i.RESOLUCION, i.ENTID_VEDA, i.CATEG_CIT, i.CATEG_UICN, 
    i.CATE_MINIS, i.MIGRACION, i.TIPO_MIGR, i.VIGEN_VEDA, i.USO, i.DIETA, i.DISTR_ALT
FROM 
	taxonomia t
INNER JOIN
	infoespecies i
ON t.ESPECIE = i.SCIENTIFIC_NAME
ORDER BY t.ESPECIE;
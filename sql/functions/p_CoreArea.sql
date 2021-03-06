/*
Core Area - devuelve el área interior del polígono que está más allá de la profundidad especificada del borde del perímetro del polígono, dividido por 10.000 (unidades: Hectáreas).
*/

-- SAMPLE USAGE:
/*
SELECT (p_corearea(geom, 50)).value FROM sample_patches_25830;
SELECT (p_corearea(geom, 50)).value FROM sample_patches_4326;
*/


CREATE OR REPLACE FUNCTION p_corearea(geom geometry, buffer numeric)
RETURNS metric AS 
$$

SELECT (5, St_Area(St_Buffer(geom, -$2))/10000)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_corearea(geom geometry, buffer numeric) IS 'Calcula el área interior del polígono dividido por 10.000 para devolver un valor en Hectáreas.';




CREATE OR REPLACE FUNCTION p_corearea(geom geography, buffer numeric)
RETURNS metric AS 
$$

SELECT (5, St_Area(St_Buffer(geom, -$2))/10000)::metric;

$$
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

COMMENT ON FUNCTION p_corearea(geom geography, buffer numeric) IS 'Calcula el área interior del polígono dividido por 10.000 para devolver un valor en Hectáreas.';

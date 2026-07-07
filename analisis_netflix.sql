-- ====================================================================
-- PROYECTO: ANÁLISIS DE DATOS DEL CATÁLOGO DE NETFLIX
-- QUX - Intensivo Data + IA
-- ====================================================================

-- 1. [Constraints, Filtering & Sorting]
-- PREGUNTA: ¿Cuáles son las 10 películas más recientes de Estados Unidos (US) clasificadas para público familiar ('PG')?
SELECT title, release_year, rating, country
FROM netflix_titles
WHERE type = 'Movie' 
  AND country = 'United States' 
  AND rating = 'PG'
ORDER BY release_year DESC
LIMIT 10;


-- 2. [Handling NULLs + Constraints & Filtering]
-- PREGUNTA: Identificar películas recientes (post-2018) que no tienen un país asignado (Campos NULL) para auditoría de catálogo.
SELECT show_id, title, release_year, rating
FROM netflix_titles
WHERE type = 'Movie'
  AND country IS NULL
  AND release_year > 2018
ORDER BY release_year DESC
LIMIT 10;

-- 3. [Lección 9: Queries with Expressions]
-- PREGUNTA: Queremos categorizar el contenido según su antigüedad. Clasificar los títulos en "Clásicos" (antes de 2000), "Modernos" (2000-2015) y "Nuevos" (Posteriores a 2015) y ver cuántos hay de cada uno.
SELECT 
    CASE 
        WHEN release_year < 2000 THEN 'Clásico (Antes de 2000)'
        WHEN release_year BETWEEN 2000 AND 2015 THEN 'Moderno (2000-2015)'
        ELSE 'Nuevo (Post-2015)'
    END as categoria_antiguedad,
    COUNT(*) as total_titulos
FROM netflix_titles
GROUP BY categoria_antiguedad
ORDER BY total_titulos DESC;


-- 4. [Aggregates, Group By & Order of Execution]
-- PREGUNTA: ¿Cuáles son los 5 países que han producido más Series de TV ('TV Show') en la plataforma, ignorando los registros sin país y mostrando solo aquellos que tengan más de 20 series?
SELECT country, COUNT(*) as total_series
FROM netflix_titles
WHERE type = 'TV Show' AND country IS NOT NULL
GROUP BY country
HAVING COUNT(*) > 20
ORDER BY total_series DESC
LIMIT 5;


-- 5. [Text Filtering & Aggregates]
-- PREGUNTA: ¿Cuántas películas o series de la plataforma pertenecen estrictamente al género de Terror/Horror ('Horror Movies' o 'TV Horror')?
SELECT type, COUNT(*) as total_horror
FROM netflix_titles
WHERE listed_in LIKE '%Horror%'
GROUP BY type;
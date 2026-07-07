# intensivo-qux
Primera unidad del programa de formación "QUX - Intensivo Data + IA", en donde el objetivo es " pasar de no saber qué es una base de datos a poder leer, escribir y validar consultas SQL con ayuda de la IA. Entender de dónde vienen los datos que usamos todos los días."

-- ====================================================================
-- PROYECTO: ANÁLISIS DE DATOS DEL CATÁLOGO DE NETFLIX
-- QUX - Intensivo Data + IA
-- ====================================================================

# 🎬 Netflix Data Analysis using SQL

## 📌 Objetivo del Proyecto
Este proyecto constituye la evidencia práctica del bloque de **Introducción a SQL** para el **Intensivo Data + IA de QUX**. Utilizando el catálogo de Netflix importado en una base de datos local en PostgreSQL, se diseñaron y resolvieron 5 preguntas de negocio clave. El propósito es demostrar el dominio técnico en filtrado de datos, gestión de valores nulos (`NULLs`), segmentación por expresiones lógicas y agregaciones avanzadas.


```markdown
# 🎬 Netflix Catalog Data Analysis (SQL)

Este repositorio contiene un conjunto de consultas SQL diseñadas para analizar, auditar y categorizar el catálogo de títulos de Netflix. El proyecto forma parte del **Intensivo Data + IA de QUX**, enfocado en aplicar buenas prácticas de filtrado, agregación, manejo de valores nulos y lógica condicional.

---

## 📋 Descripción del Proyecto
El objetivo principal es responder a preguntas de negocio clave y realizar tareas de auditoría de datos sobre una tabla llamada `netflix_titles`. A través de este script, se resuelven problemas que van desde la clasificación de contenido por antigüedad hasta la identificación de registros incompletos para la limpieza de datos.

---

## 🛠️ Tecnologías Utilizadas
* **Lenguaje:** SQL (ANSI SQL estándar)
* **Conceptos clave aplicados:**
  * Filtrado y ordenamiento de datos (`WHERE`, `ORDER BY`, `LIMIT`).
  * Manejo de valores ausentes (`IS NULL`, `IS NOT NULL`).
  * Expresiones condicionales (`CASE WHEN`).
  * Agregaciones y agrupamientos con filtros avanzados (`GROUP BY`, `HAVING`).
  * Filtrado de texto mediante patrones (`LIKE`).

---

## 🔍 Consultas Implementadas y Lógica SQL

A continuación se detallan los casos de uso resueltos junto con el código SQL correspondiente:

### 1. Top 10 Películas Recientes para Adultos (US)
* **Objetivo:** Identificar las 10 películas más recientes producidas en Estados Unidos con clasificación **'R'** (público adulto).
* **Técnicas:** `Constraints, Filtering & Sorting`.

```sql
SELECT title, release_year, rating, country
FROM netflix_titles
WHERE type = 'Movie' 
  AND country = 'United States' 
  AND rating = 'R'
ORDER BY release_year DESC
LIMIT 10;

```

---

### 2. Auditoría de Catálogo: Películas sin País Asignado

* **Objetivo:** Detectar películas estrenadas después de 2018 que no tienen asignado un país de origen (valores `NULL`), permitiendo al equipo de datos priorizar su corrección.
* **Técnicas:** `Handling NULLs + Constraints & Filtering`.

```sql
SELECT show_id, title, release_year, rating
FROM netflix_titles
WHERE type = 'Movie'
  AND country IS NULL
  AND release_year > 2018
ORDER BY release_year DESC
LIMIT 10;

```

---

### 3. Categorización por Antigüedad del Contenido

* **Objetivo:** Clasificar y contar cuántos títulos entran en las categorías de *"Clásicos"* (antes de 2000), *"Modernos"* (2000-2015) y *"Nuevos"* (post-2015).
* **Técnicas:** `Queries with Expressions (CASE WHEN)` y `GROUP BY`.

```sql
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

```

---

### 4. Top 5 Países Productores de Series de TV

* **Objetivo:** Encontrar los 5 países con mayor producción de `TV Shows`, excluyendo registros sin país y filtrando solo aquellos con un volumen superior a 20 series.
* **Técnicas:** `Aggregates, Group By & Order of Execution (HAVING)`.

```sql
SELECT country, COUNT(*) as total_series
FROM netflix_titles
WHERE type = 'TV Show' AND country IS NOT NULL
GROUP BY country
HAVING COUNT(*) > 20
ORDER BY total_series DESC
LIMIT 5;

```

---

### 5. Análisis de Contenido de Terror (Horror)

* **Objetivo:** Contabilizar cuántas películas y series pertenecen estrictamente al género de Terror/Horror a través de las etiquetas del catálogo.
* **Técnicas:** `Text Filtering (LIKE)` y `Aggregates`.

```sql
SELECT type, COUNT(*) as total_horror
FROM netflix_titles
WHERE listed_in LIKE '%Horror%'
GROUP BY type;

```

---

## 🚀 Cómo Utilizar este Script

1. **Clona el repositorio:**
```bash
git clone [https://github.com/TU_USUARIO/TU_REPOSITORIO.git](https://github.com/TU_USUARIO/TU_REPOSITORIO.git)


# intensivo-qux
Primera unidad del programa de formación "QUX - Intensivo Data + IA", en donde el objetivo es " pasar de no saber qué es una base de datos a poder leer, escribir y validar consultas SQL con ayuda de la IA. Entender de dónde vienen los datos que usamos todos los días."

# 🎬 Netflix Data Analysis using SQL

## 📌 Objetivo del Proyecto
Este proyecto constituye la evidencia práctica de la unidad de **Introducción a SQL**. Utilizando un dataset del catálogo de Netflix importado en una base de datos local de PostgreSQL, se formularon y resolvieron preguntas de negocio clave. El objetivo es demostrar el dominio en filtrado de datos, manejo de valores nulos, agrupaciones analíticas y expresiones condicionales basados en el contenido real de la plataforma.

## 🛠️ Tecnologías y Conceptos Aplicados
* **Motor de Base de Datos:** PostgreSQL
* **Cliente Visual:** DBeaver
* **Estructuras SQL Utilizadas:** `SELECT`, `WHERE` (múltiples restricciones), `ORDER BY`, `GROUP BY`, `HAVING`, funciones de agregación (`COUNT`), evaluación de campos `NULL` (`IS NULL`) y estructuras condicionales `CASE WHEN`.

---

## 📊 Preguntas de Negocio y Queries de Resolución

### 1. Filtros y Ordenamiento: Contenido Adulto en EE.UU.
* **Pregunta:** ¿Cuáles son las 10 películas más recientes de Estados Unidos clasificadas para público adulto ('R')?
* **Query:**
```sql
SELECT title, release_year, rating, country
FROM netflix_titles
WHERE type = 'Movie' 
  AND country = 'United States' 
  AND rating = 'R'
ORDER BY release_year DESC
LIMIT 10;

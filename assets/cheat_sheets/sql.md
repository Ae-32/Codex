---
language: sql
topics:
  - id: queries
    title: Basic & Advanced SELECT Queries
    difficulty: Beginner
  - id: joins
    title: Table Joins (INNER, LEFT, RIGHT, FULL)
    difficulty: Intermediate
  - id: aggregations
    title: Aggregations & GROUP BY
    difficulty: Intermediate
  - id: window_functions
    title: Window Functions (ROW_NUMBER, RANK)
    difficulty: Advanced
---

# SQL Cheat Sheet

## 1. Basic & Advanced SELECT Queries
Querying data with filtering, sorting, and pagination.

```sql
-- SELECT with WHERE and LIKE
SELECT id, name, category, created_at
FROM languages
WHERE category LIKE '%Scripting%'
  AND is_active = TRUE
ORDER BY created_at DESC
LIMIT 10 OFFSET 0;
```

---

## 2. Table Joins
Combining data from multiple tables.

```sql
-- INNER JOIN vs LEFT JOIN
SELECT 
    l.name AS language_name,
    t.title AS topic_title,
    t.difficulty
FROM languages l
INNER JOIN topics t ON l.id = t.language_id
LEFT JOIN cheat_sheets c ON t.id = c.topic_id
WHERE l.name = 'Python';
```

---

## 3. Aggregations & GROUP BY
Grouping records and performing aggregate math.

```sql
SELECT 
    category,
    COUNT(*) AS total_languages,
    AVG(sheet_count) AS avg_sheets
FROM languages
GROUP BY category
HAVING COUNT(*) > 1;
```

---

## 4. Window Functions
Advanced analytical ranking over partition windows.

```sql
SELECT 
    name,
    category,
    sheet_count,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY sheet_count DESC) AS rank_in_category
FROM languages;
```

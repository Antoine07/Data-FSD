# Agregate - MYSQL

## Fonctions de groupe

Elles s'utilisent dans la clause SELECT sur une/des colonnes, elles permettent de regrouper des données. Si vous utilisez les fonctions de groupement avec une requête ne contenant pas de clause GROUP BY, cela revient à grouper toutes les lignes.

```sql
AVG([DISTINCT] exp)       -- moyenne
COUNT({*| DISTINCT] exp}) -- nombre de lignes
MAX([DISTINCT] exp)       -- max
MIN([DISTINCT] exp)       -- min
SUM([DISTINCT] exp)       -- somme
GROUP_CONCAT(exp)         -- composition d'un nombre de valeurs, concaténation de valeurs de champ a, b, c, d
VARIANCE(exp)             -- variance
STDDEV(exp)               -- écart type (standard deviation)
```
## Groupement de lignes

```sql
SELECT col1 [,col2, ...], fonction_groupe
FROM table
WHERE (conditions)
**GROUP BY clo1 [, col2, ...]**
HAVING condition_02
ORDER BY col1 [ASC | DESC] [, col2 ...]
LIMIT
```

- La clause `WHERE` exclut des lignes pour chaque groupement ou permet de rejeter des groupements entiers. Elle s'applique à la totalité de la table.

- La clause `GROUP BY` liste des colonnes de groupement.

- La clause `HAVING` permet de poser des conditions sur chaque groupement.

Attention, les colonnes présentes dans le `SELECT` doivent apparaître dans le `GROUP BY`. Seules des fonctions ou expressions peuvent exister en plus dans le `SELECT`.

Les fonctions d'agrégation sont utilisées pour effectuer des calculs sur un ensemble de valeurs et retourner une valeur unique.

**Exemple :**

```sql
SELECT COUNT(*) FROM pilots WHERE plane = 'A320';
```

Cela retourne le nombre de pilotes qui pilotent un Airbus A320.

## 11. Groupement avec `GROUP BY`

`GROUP BY` est utilisé avec les fonctions d'agrégation pour grouper les résultats par une ou plusieurs colonnes.

**Exemple :**

```sql
SELECT company, COUNT(*) AS num_pilots FROM pilots GROUP BY company;
```

Cela compte le nombre de pilotes par compagnie.

## 12. Filtrage de Groupes avec `HAVING`

`HAVING` est utilisé pour filtrer les résultats **après un regroupement.**

**Exemple :**

```sql
SELECT company, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company
HAVING num_pilots > 1;
```

Cela récupère les compagnies avec plus d'un pilote.
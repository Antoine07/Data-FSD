# Requêtes imbriquées

## Sous-requêtes (Subqueries)

Les sous-requêtes sont des requêtes imbriquées dans une autre requête.

**Exemple :**

```sql
SELECT name, last_name FROM pilots
WHERE company IN (SELECT comp FROM companies WHERE city = 'San Francisco');

/*
SELECT name, last_name FROM pilots
WHERE company 
IN ('USA1', 'USA2' )  -- résultat de la sous-requête
*/

SELECT name, last_name FROM pilots
WHERE company NOT IN (SELECT comp FROM companies WHERE city = 'San Francisco');

SELECT name, last_name FROM pilots
WHERE company 
NOT IN ('USA1', 'USA2' )
```

Cela récupère les noms et prénoms des pilotes qui travaillent pour des compagnies situées à San Francisco.

Les opérateurs d'ensemble suivants marchent également : `IN, NOT IN, ALL et ANY`, nous verrons plus tard ALL et ANY.

## Syntaxe avec un opérateur d'égalité

```sql
SELECT *
FROM `table`
WHERE `nom_colonne` = (
    SELECT `valeur`
    FROM `table2`
    LIMIT 1
  )
  ```

Les opérateurs de comparaison suivants marchent également : `=, >, <, >=, <= ou <>`

- Exemple dans la même table

```sql
SELECT num, title
FROM tarifs
WHERE price = (
    SELECT MIN(price)
    FROM tarifs
);

-- Le nom de la personne qui a eu la meilleur note, la table students possède un champ note et name 
SELECT `name`
FROM `students`
WHERE `note`= (SELECT MAX(`note`) FROM `students` );
```

## Utilisation de `LIKE` pour les Recherches de Modèle

L'opérateur `LIKE` est utilisé pour rechercher un modèle spécifique dans une colonne.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE last_name LIKE 'Th%';
```

Cela récupère les pilotes dont le nom de famille commence par 'Th'.

##  Utilisation de `IN` pour Correspondre à une Liste de Valeurs

`IN` est utilisé pour spécifier plusieurs valeurs dans une clause `WHERE`.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE company IN ('DAIR', 'EAIR');
```

Cela récupère les pilotes travaillant pour les compagnies 'DAIR' ou 'EAIR'.

### `ALL` et `ANY` dans les Sous-requêtes

Dans SQL, les opérateurs `ALL` et `ANY` sont utilisés dans les conditions de comparaison pour filtrer les résultats en fonction des valeurs retournées par une sous-requête. Ces opérateurs sont particulièrement utiles lorsque vous souhaitez comparer une valeur avec un ensemble de résultats retournés par une sous-requête.

####  L'Opérateur `ALL`

L'opérateur `ALL` permet de comparer une valeur avec tous les résultats d'une sous-requête. La condition est vraie si la valeur satisfait la condition de comparaison avec chaque résultat retourné par la sous-requête.

**Syntaxe** :

```sql
SELECT column1, column2
FROM table_name
WHERE column1 operator ALL (SELECT column1 FROM table_name WHERE condition);
```

**Exemple** :

Supposons que vous souhaitiez trouver les pilotes dont le bonus est supérieur à tous les bonus des pilotes travaillant pour une compagnie spécifique.

```sql
SELECT name, bonus
FROM pilots
WHERE bonus > ALL (SELECT bonus FROM pilots WHERE company = 'A123');
```

Dans cet exemple, la requête renvoie les pilotes dont le bonus est supérieur à tous les bonus des pilotes travaillant pour la compagnie 'A123'.

####  L'Opérateur `ANY`

L'opérateur `ANY` permet de comparer une valeur avec au moins un des résultats retournés par une sous-requête. La condition est vraie si la valeur satisfait la condition de comparaison avec au moins un des résultats.

**Syntaxe** :

```sql
SELECT column1, column2
FROM table_name
WHERE column1 operator ANY (SELECT column1 FROM table_name WHERE condition);
```

**Exemple** :

Supposons que vous souhaitiez trouver les pilotes dont le bonus est supérieur à au moins un des bonus des pilotes travaillant pour une compagnie spécifique.

```sql
SELECT name, bonus
FROM pilots
WHERE bonus > ANY (SELECT bonus FROM pilots WHERE company = 'A123');
```

Dans cet exemple, la requête renvoie les pilotes dont le bonus est supérieur à au moins un des bonus des pilotes travaillant pour la compagnie 'A123'.

### Résumé

Les opérateurs `ALL` et `ANY` permettent de comparer une valeur à un ensemble de résultats retournés par une sous-requête. `ALL` exige que la condition soit vraie pour tous les résultats, tandis que `ANY` exige que la condition soit vraie pour au moins un des résultats. Ces opérateurs sont utiles pour réaliser des comparaisons complexes basées sur des ensembles de données dynamiques. Pratiquez ces concepts pour maîtriser les requêtes conditionnelles avancées en SQL.
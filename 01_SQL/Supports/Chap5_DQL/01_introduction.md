## Cours sur le Data Query Language (DQL) en MySQL

## Installation 

Récupérez le fichier install.sql et exécutez-le (Dossier Docker).

## Introduction au DQL

Le **Data Query Language (DQL)** est une sous-catégorie du SQL (Structured Query Language) utilisée pour interroger et récupérer des données dans une base de données. En MySQL, le DQL se concentre principalement sur l'instruction `SELECT`, qui est utilisée pour récupérer des données à partir de tables.

## Structure de Base d'une Instruction `SELECT`

La syntaxe de base d'une instruction `SELECT` est la suivante :

```sql
SELECT colonne1, colonne2, ...
FROM table
WHERE conditions
ORDER BY colonne1 ASC|DESC
LIMIT nombre;
```

- **SELECT** : Spécifie les colonnes à récupérer.
- **FROM** : Indique la table à partir de laquelle les données sont récupérées.
- **WHERE** : Filtre les enregistrements selon des conditions spécifiques.
- **ORDER BY** : Trie les résultats selon une ou plusieurs colonnes.
- **LIMIT** : Limite le nombre de résultats retournés.

## 1. Sélection Simple

Pour récupérer des données spécifiques des tables, vous pouvez utiliser une sélection simple.

**Exemple :**

```sql
SELECT name, last_name FROM pilots;
```

Cela récupère les colonnes `name` et `last_name` de la table `pilots`, affichant ainsi le prénom et le nom des pilotes.

## 2. Sélection de Toutes les Colonnes

Pour sélectionner toutes les colonnes d'une table, utilisez l'astérisque `*`.

**Exemple :**

```sql
SELECT * FROM companies;
```

Cela récupère toutes les colonnes de la table `companies`, affichant toutes les informations pour chaque compagnie.

## 3. Utilisation de l'Alias

Les alias permettent de renommer temporairement les colonnes ou les tables pour rendre les résultats plus lisibles.

**Exemple :**

```sql
SELECT name AS pilot_name, last_name FROM pilots AS p;
```

- **AS pilot_name** renomme la colonne `name` en `pilot_name` dans le résultat.
- **AS p** renomme la table `pilots` en `p` pour simplifier la référence.

## 4. Filtrage avec `WHERE`

L'instruction `WHERE` est utilisée pour filtrer les résultats selon certaines conditions.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE plane = 'A320';
```

Cela récupère les noms et prénoms des pilotes qui pilotent un Airbus A320.

## 5. Opérateurs de Comparaison

Les opérateurs de comparaison sont utilisés dans la clause `WHERE` pour filtrer les résultats.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE bonus > 2000;
```

Cela récupère les noms et prénoms des pilotes dont le bonus est supérieur à 2000.

## 6. Utilisation des Opérateurs Logiques

Les opérateurs logiques permettent de combiner plusieurs conditions dans une clause `WHERE`.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE plane = 'A320' AND bonus > 2000;
```

Cela récupère les pilotes qui pilotent un Airbus A320 et qui ont un bonus supérieur à 2000.

## 7. Requêtes avec `ORDER BY`

L'instruction `ORDER BY` trie les résultats en fonction d'une ou plusieurs colonnes.

**Exemple :**

```sql
SELECT name, last_name FROM pilots ORDER BY bonus DESC;
```

Cela trie les résultats par bonus en ordre décroissant, affichant les pilotes avec le plus grand bonus en premier.

## 8. Limitation des Résultats avec `LIMIT`

`LIMIT` est utilisé pour restreindre le nombre de lignes retournées par une requête.

**Exemple :**

```sql
SELECT name, last_name FROM pilots LIMIT 5;
```

Cela récupère les 5 premiers pilotes de la table `pilots`.

## 9. Sélection Distincte avec `DISTINCT`

`DISTINCT` est utilisé pour retourner des valeurs uniques d'une colonne.

**Exemple :**

```sql
SELECT DISTINCT company FROM pilots;
```

Cela récupère toutes les compagnies uniques pour lesquelles les pilotes travaillent.

## 10. Fonctions d'Agrégation

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

`HAVING` est utilisé pour filtrer les résultats après un regroupement.

**Exemple :**

```sql
SELECT company, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company
HAVING num_pilots > 1;
```

Cela récupère les compagnies avec plus d'un pilote.

## 13. Utilisation des Jointures (`JOIN`)

Les jointures sont utilisées pour combiner des lignes de deux ou plusieurs tables en fonction d'une condition commune.

**Exemple :**

```sql
SELECT p.name, p.last_name, c.name AS company_name
FROM pilots p
INNER JOIN companies c ON p.company = c.comp;
```

Cela récupère les noms des pilotes et le nom de leur compagnie respective.

## 14. Sous-requêtes (Subqueries)

Les sous-requêtes sont des requêtes imbriquées dans une autre requête.

**Exemple :**

```sql
SELECT name, last_name FROM pilots
WHERE company IN (SELECT comp FROM companies WHERE city = 'San Francisco');
```

Cela récupère les noms et prénoms des pilotes qui travaillent pour des compagnies situées à San Francisco.

## 15. Utilisation de `LIKE` pour les Recherches de Modèle

L'opérateur `LIKE` est utilisé pour rechercher un modèle spécifique dans une colonne.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE last_name LIKE 'Th%';
```

Cela récupère les pilotes dont le nom de famille commence par 'Th'.

## 16. Utilisation de `IN` pour Correspondre à une Liste de Valeurs

`IN` est utilisé pour spécifier plusieurs valeurs dans une clause `WHERE`.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE company IN ('DAIR', 'EAIR');
```

Cela récupère les pilotes travaillant pour les compagnies 'DAIR' ou 'EAIR'.

## 17. Fonctions de Date et Heure

MySQL offre plusieurs fonctions pour manipuler les dates et les heures.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE next_flight > NOW();
```

Cela récupère les pilotes dont le prochain vol est programmé après l'heure actuelle.

## Conclusion

En utilisant ces exemples avec les tables `pilots`, `companies`, et `sales`, vous pouvez voir comment chaque concept du DQL s'applique dans des scénarios réels de base de données. Ces commandes sont essentielles pour interagir efficacement avec les données, les filtrer, les trier, et les analyser selon les besoins.
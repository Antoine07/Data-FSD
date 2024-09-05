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


## Remarques sur le group by 

### Exemple avec une table `pilots` et `companies`

Imaginons que nous avons une table `pilots` qui contient les informations suivantes : le nom du pilote, sa compagnie, et l'avion qu'il pilote. Nous voulons savoir combien de pilotes travaillent pour chaque compagnie **et** quel type d'avion ils pilotent.

Voici les données exemple dans la table `pilots` :

```
| certificate | name   | company | plane |
|-------------|--------|---------|-------|
| P00005      | Alice  | AAIR    | A320  |
| P00006      | Bob    | BAIR    | A380  |
| P00007      | Charlie| AAIR    | A340  |
| P00008      | Diana  | BAIR    | A320  |
| P00009      | Eve    | AAIR    | A320  |
| P00010      | Frank  | BAIR    | A380  |
```

### 1. **GROUP BY avec un seul champ (`company`)**
Si vous regroupez uniquement par `company`, vous obtenez un résultat qui montre combien de pilotes travaillent pour chaque compagnie, sans distinction du type d'avion.

```sql
SELECT company, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company;
```

**Résultat :**

```
| company | num_pilots |
|---------|------------|
| AAIR    | 3          |
| BAIR    | 3          |
```

Ici, vous voyez le nombre total de pilotes par compagnie, mais sans distinction du type d'avion.

### 2. **GROUP BY avec deux champs (`company`, `plane`)**
Si vous ajoutez un deuxième champ dans le `GROUP BY`, comme `plane`, vous regrouperez les résultats non seulement par compagnie mais aussi par le type d'avion qu'ils pilotent.

```sql
SELECT company, plane, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company, plane;
```

**Résultat :**

```
| company | plane | num_pilots |
|---------|-------|------------|
| AAIR    | A320  | 2          |
| AAIR    | A340  | 1          |
| BAIR    | A320  | 1          |
| BAIR    | A380  | 2          |
```

### Différence entre les deux approches

- **`GROUP BY company` (un seul champ)** : Vous obtenez un résultat qui regroupe tous les pilotes par compagnie, sans se soucier du type d'avion qu'ils pilotent. Cela donne une vue globale du nombre de pilotes par compagnie.
  
- **`GROUP BY company, plane` (deux champs)** : Le regroupement se fait par compagnie **et** par type d'avion. Vous voyez combien de pilotes pilotent chaque type d'avion pour chaque compagnie. Cela donne une vue plus détaillée.

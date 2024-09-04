# Cours Complémentaire sur les Jointures Avancées avec Exemples Concrets

Nous allons approfondir l'utilisation des jointures avancées en utilisant les tables `companies`, `pilots`, et `sales` de la base de données `db_aviation`. Les exemples suivants montrent comment extraire et analyser des informations en utilisant différentes jointures SQL.

## 1. Jointures Multiples (`Multi-table Joins`)

Les jointures multiples permettent de combiner des données provenant de plusieurs tables en une seule requête. C'est particulièrement utile lorsque les informations nécessaires sont réparties sur plusieurs tables.

### 1.1. Exemple avec `companies`, `pilots`, et `sales`

Supposons que nous souhaitions obtenir une liste de pilotes, le nom de la compagnie pour laquelle ils travaillent, et le total des profits réalisés par cette compagnie. 

Voici comment utiliser une jointure multiple pour obtenir ces informations :

```sql
SELECT 
    p.name AS pilot_name,
    p.last_name AS pilot_last_name,
    c.name AS company_name,
    SUM(s.profit) AS total_profit
FROM pilots p
INNER JOIN companies c ON p.company = c.comp
INNER JOIN sales s ON c.comp = s.company
GROUP BY p.name, p.last_name, c.name;
```

### Explication :

1. **`INNER JOIN` entre `pilots` et `companies`** : Nous joignons la table `pilots` à la table `companies` en utilisant `company` dans `pilots` et `comp` dans `companies`.
2. **`INNER JOIN` entre `companies` et `sales`** : Nous joignons ensuite la table `companies` à la table `sales` sur `comp` et `company`, respectivement.
3. **`GROUP BY`** : Nous regroupons les résultats par le nom et le prénom du pilote, ainsi que par le nom de la compagnie pour obtenir le total des profits par pilote et par compagnie.

## 2. Auto-jointures (`Self Joins`)

Les auto-jointures sont utilisées pour joindre une table avec elle-même, ce qui est utile pour des analyses comparatives au sein de la même table.

### 2.1. Exemple avec la Table `pilots`

Imaginons que nous souhaitons lister tous les pilotes et leur manager si le manager est également un pilote enregistré dans la table `pilots`. Supposons que chaque pilote peut avoir un `manager` qui correspond à l'`id` d'un autre pilote dans la même table.

```sql

-- mise à jour des données

ALTER TABLE pilots
ADD COLUMN manager VARCHAR(6);

UPDATE pilots SET manager = 'P001' WHERE certificate IN ('P002', 'P003');
UPDATE pilots SET manager = 'P004' WHERE certificate = 'P005';

SELECT 
    p1.name AS pilot_name,
    p1.last_name AS pilot_last_name
FROM pilots p1
LEFT JOIN pilots p2 ON p1.manager = p2.certificate;
```

### Explication :

1. **Auto-jointure de `pilots`** : Nous joignons la table `pilots` avec elle-même pour associer chaque pilote à son manager basé sur `manager`.
2. **`LEFT JOIN`** : Utilisé pour inclure tous les pilotes, même ceux qui n'ont pas de manager référencé dans la table.

## 3. Jointures Croisées (`CROSS JOIN`)

Les jointures croisées ou produits cartésiens retournent toutes les combinaisons possibles de lignes entre deux tables.

### 3.1. Exemple avec `pilots` et `companies`

Si nous souhaitons générer toutes les combinaisons possibles de pilotes et de compagnies, indépendamment de toute relation existante, nous pouvons utiliser un `CROSS JOIN`.

```sql
SELECT 
    p.name AS pilot_name,
    p.last_name AS pilot_last_name,
    c.name AS company_name
FROM pilots p
CROSS JOIN companies c;
```

### Explication :

1. **Produit Cartésien** : Retourne toutes les combinaisons possibles entre les lignes de la table `pilots` et `companies`.


## 4. Optimisation des Jointures

L'optimisation des jointures est cruciale pour améliorer la performance des requêtes, surtout lorsque vous travaillez avec de grandes bases de données.

### 4.1. Utilisation des Index

Pour optimiser les jointures, assurez-vous que les colonnes utilisées dans les conditions de jointure sont indexées.

**Exemple :**

Pour optimiser la jointure entre `pilots` et `companies`, nous devons créer des index sur les colonnes `company` dans `pilots` et `comp` dans `companies`.

### 4.2. Filtrage avec `WHERE`

Appliquer des filtres avec `WHERE` peut réduire le nombre de lignes jointes, augmentant ainsi l'efficacité de la requête.

**Exemple :**

Pour trouver les pilotes actifs dans des compagnies situées à "San Francisco", nous pouvons appliquer un filtre avant de joindre les tables.

```sql
SELECT 
    p.name AS pilot_name,
    p.last_name AS pilot_last_name,
    c.name AS company_name
FROM pilots p
INNER JOIN companies c ON p.company = c.comp
WHERE c.city = 'San Francisco';
```

## 5. Jointures avec Conditions Complexes

Les jointures peuvent être basées sur des conditions plus complexes, telles que des inégalités ou plusieurs colonnes.

### 5.1. Exemple avec `sales` et `companies`

Imaginons que nous souhaitons joindre les ventes avec les compagnies en fonction d'une plage de profits.

```sql
SELECT 
    s.id AS sale_id,
    c.name AS company_name,
    s.profit
FROM sales s
INNER JOIN companies c ON s.company = c.comp
WHERE s.profit BETWEEN 1000 AND 200000;
```

### Explication :

1. **`INNER JOIN` entre `sales` et `companies`** : Basé sur la clé `company` dans `sales` et `comp` dans `companies`.
2. **Filtrage des profits** : Nous utilisons `WHERE` pour limiter les résultats aux ventes ayant des profits entre 1000 et 200000.

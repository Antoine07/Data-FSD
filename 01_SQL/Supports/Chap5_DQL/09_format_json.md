# Cours sur le JSON en MySQL

## Introduction au JSON en MySQL

Le **JSON** (JavaScript Object Notation) est un format de données léger et facile à lire et à écrire pour les humains, ainsi qu'à analyser et générer pour les machines. MySQL, à partir de la version 5.7, supporte nativement le type de données JSON, permettant de stocker, manipuler et interroger des données JSON dans vos tables SQL.

Utiliser JSON dans MySQL est particulièrement utile pour les applications qui nécessitent une flexibilité de données ou des structures de données semi-structurées, tout en utilisant la robustesse et la fiabilité d'une base de données relationnelle.

## Création d'une colonne JSON

Pour stocker des données JSON dans une table, il suffit de créer une colonne avec le type `JSON`. Par exemple, dans la table `pilots`, nous avons déjà ajouté une colonne `extra_info` pour stocker des informations supplémentaires sur les pilotes.

```sql
ALTER TABLE pilots
ADD COLUMN extra_info JSON DEFAULT NULL;
```

## Insertion de données JSON

Pour insérer des données JSON dans une table, nous utilisons des objets JSON valides. Voici comment insérer des données dans la colonne `extra_info` de la table `pilots` :

```sql
INSERT INTO pilots (certificate, name, last_name, company, extra_info) 
VALUES ('P00016', 'Anna', 'Smith', 'DAIR', '{"skills": ["takeoff", "landing"], "languages": ["English", "French"]}');
```

## Fonctions JSON en MySQL

MySQL offre une variété de fonctions pour travailler avec des données JSON, ce qui permet d'insérer, de modifier et de récupérer des données JSON stockées dans des colonnes de type JSON. Voici quelques-unes des fonctions les plus couramment utilisées.

### 1. `JSON_OBJECT`

La fonction `JSON_OBJECT` crée un objet JSON à partir d'une liste de paires clé-valeur. Par exemple, pour insérer une valeur JSON dans la table `pilots` :

```sql
UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('navigation', 'communication'), 'languages', JSON_ARRAY('English', 'Spanish'))
WHERE certificate = 'P00006';
```

### 2. `JSON_ARRAY`

La fonction `JSON_ARRAY` crée un tableau JSON à partir d'une liste d'expressions. Par exemple :

```sql
SELECT JSON_ARRAY('pilote', 'avion', 123) AS my_array;
```

### 3. `JSON_EXTRACT`

`JSON_EXTRACT` extrait des valeurs à partir d'un document JSON en utilisant une syntaxe de chemin. Par exemple, pour obtenir les compétences d'un pilote dans la table `pilots` :

```sql
SELECT JSON_EXTRACT(extra_info, '$.skills') AS skills FROM pilots WHERE certificate = 'P00006';
```

Le signe `$` représente le document JSON racine, et `$.skills` fait référence à la clé `skills` dans le document JSON.

### 4. `JSON_UNQUOTE`

`JSON_UNQUOTE` supprime les guillemets entourant une chaîne JSON. Par exemple, si nous voulons extraire une valeur sans guillemets :

```sql
SELECT JSON_UNQUOTE(JSON_EXTRACT(extra_info, '$.languages[0]')) AS first_language FROM pilots WHERE certificate = 'P00006';
```

### 5. `JSON_SET`

`JSON_SET` met à jour ou insère des valeurs dans un document JSON. Par exemple, pour ajouter une nouvelle compétence :

```sql
UPDATE pilots
SET extra_info = JSON_SET(extra_info, '$.skills[2]', 'emergency procedures')
WHERE certificate = 'P00006';
```

### 6. `JSON_INSERT`

`JSON_INSERT` insère une ou plusieurs valeurs dans un document JSON. Si la clé existe déjà, la valeur ne sera pas remplacée.

```sql
UPDATE pilots
SET extra_info = JSON_INSERT(extra_info, '$.experience', 'advanced')
WHERE certificate = 'P00006';
```

### 7. `JSON_REPLACE`

`JSON_REPLACE` remplace les valeurs existantes dans un document JSON. Si la clé n'existe pas, aucune modification n'est apportée.

```sql
UPDATE pilots
SET extra_info = JSON_REPLACE(extra_info, '$.languages[1]', 'German')
WHERE certificate = 'P00006';
```

### 8. `JSON_REMOVE`

`JSON_REMOVE` supprime des valeurs d'un document JSON. Par exemple, pour supprimer la clé `experience` :

```sql
UPDATE pilots
SET extra_info = JSON_REMOVE(extra_info, '$.experience')
WHERE certificate = 'P00006';
```

### 9. `JSON_CONTAINS`

`JSON_CONTAINS` vérifie si un document JSON contient une valeur ou un chemin spécifique.

```sql
SELECT name FROM pilots WHERE JSON_CONTAINS(extra_info, '"takeoff"', '$.skills');
```

### 10. `JSON_LENGTH`

`JSON_LENGTH` retourne le nombre d'éléments dans un tableau JSON ou le nombre de membres dans un objet JSON.

```sql
SELECT JSON_LENGTH(extra_info, '$.skills') AS num_skills FROM pilots WHERE certificate = 'P00006';
```

## Avantages de l'utilisation du JSON en MySQL

1. **Flexibilité** : JSON permet de stocker des données semi-structurées qui peuvent varier d'un enregistrement à l'autre.
2. **Compatibilité** : Idéal pour des applications nécessitant l'échange de données avec des API RESTful ou des services utilisant JSON.
3. **Facilité de manipulation** : Les fonctions JSON de MySQL simplifient l'insertion, la mise à jour et la requête des données JSON.

## Bonnes pratiques

- **Utilisation Raisonnée** : Utilisez JSON pour stocker des données qui varient souvent en structure ou pour lesquelles la structure exacte est inconnue au moment de la conception.
- **Indexation** : Les colonnes JSON ne peuvent pas être directement indexées, mais MySQL 8.0 introduit les index JSON fonctionnels pour améliorer les performances.
- **Intégrité des Données** : JSON ne garantit pas le respect des contraintes de schéma comme les colonnes traditionnelles ; utilisez-le judicieusement.

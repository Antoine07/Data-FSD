# Insertion des données

Nous allons aborder dans ce chapitre l'aspect LMD (langage de manipulation des données) de MySQL.

On a trois instructions :

- INSERT pour l'insertion d'enregistrement.

- UPDATE pour la modification de données.

- DELETE et TRUNCATE pour la suppression des données.

## INSERT syntaxe

La syntaxe suivante permet l'insertion de données. Son inconvénient est qu'il faut renseigner toutes les colonnes pour quelle s'exécute correctement dans MySQL

```sql

INSERT INTO table
VALUES ('valeur 1', 'valeur 2', ...);

```

Une autre syntaxe plus souple est la suivante, vous ne renseignez que les colonnes voulues. Attention cependant aux colonnes dont les valeurs sont obligatoires.

```sql
INSERT INTO table
(nom_colonne_1, nom_colonne_2)
 VALUES ('valeur 1', 'valeur 2')
```

Dans ce cas, seules les colonnes mentionnées seront enregistrées. Attention cependant aux colonnes dont les données sont obligatoires (NOT NULL).

Vous pouvez enregistrer plusieurs lignes à la fois :

```sql
INSERT INTO table (nom_colonne_1, nom_colonne_2, ...
 VALUES
 ('valeur 1', 'valeur 2', ...),
 ('valeur 11', 'valeur 22', ...),
 ('valeur 111', 'valeur 222', ...);
```



## Application insertion de données companies

Insérez les données suivantes dans la table companies :

```text
+------+-----------+-----------+--------------+------------+--------+
| comp | street    | city      | name         | num_street | status |
+------+-----------+-----------+--------------+------------+--------+
| AUS  | sydney    | Australie | AUSTRA Air   |         19 | draft  |
| CHI  | chi       | Chine     | CHINA Air    |       NULL | draft  |
| FRE1 | beaubourg | France    | Air France   |         17 | draft  |
| FRE2 | paris     | France    | Air Electric |         22 | draft  |
| SIN  | pasir     | Singapour | SIN A        |         15 | draft  |
+------+-----------+-----------+--------------+------------+--------+
```

Utilisez le code suivant, pensez à l'exécuter dans la console une fois connecté sur la bonne base de données. Vous pouvez vérifier que vous avez bien la table à l'aide de la commande suivante :

```bash
use db_aviation
show tables;
```

```sql
INSERT INTO `pilots`
(`certificate`,`num_flying`,`company` ,`name`)
VALUES
    ('ct-1', 90, 'AUS', 'Alan' ),
    ('ct-12', 190, 'AUS', 'Albert' ),
    ('ct-7', 80, 'CHI', 'Pierre' ),
    ('ct-11', 200, 'AUS', 'Sophie' ),
    ('ct-6', 20, 'FRE1', 'John' ),
    ('ct-10', 90, 'FRE1', 'Tom' ),
    ('ct-100', 200, 'SIN', 'Yi' ),
    ('ct-16', 190, 'SIN', 'Yan' ),
    ('ct-56', 300, 'AUS', 'Benoit' )
    ;

```

## 01 Exercice Ajouter une colonne created

Ajoutez la colonne created dans la table pilots. Ajoutez l'option suivante à cette colonne :

```sql
DEFAULT CURRENT_TIMESTAMP
```

## Exercice UPDATE

Dans la table sales il y a une augmentation de 10% des profits pour les compagnies AUS, calculez et modifiez ces valeurs dans la table.

## Commande de suppression DELETE ou TRUNCATE

Ces deux commandes suppriment les enregistrements d'une table.

La commande TRUNCATE supprime des enregistrements en libérant éventuellement l'espace de stockage utilisé par la table.

La commande DELETE syntaxe :

```sql
DELETE FROM pilots [WHERE (condition)];
```

### Différences entre DELETE et TRUNCATE

TRUNCATE est similaire à DELETE. La commande TRUNCATE pour sa part ré-initialisera les valeurs auto-incrémentées. De plus TRUNCATE est plus optimisée dans son exécution et ne comporte pas de clause WHERE. Elle s'utilise seule :

```sql
TRUNCATE TABLE pilots ;
```

## 03 Exercice sauvegarde et suppression (facultatif)

Créez la table new_pilots à l'aide de la commande suivante et supprimez toutes les lignes de la table pilots :

```sql
CREATE TABLE `new_pilots` (SELECT * FROM `pilots`);
```

Lorsque vous aurez supprimé les données de la table pilots récupérez les données de la table new_pilots pour les remettre dans la table pilots et supprimer la table new_pilots.

Utilisez la syntaxe suivante pour remettre les données dans la table pilots :


```sql
INSERT INTO
pilots (
    `certificate`,
    `num_flying`,
    `company`,
    `name`,
    `created`,
    `birth_date`,
    `next_flight`,
    `num_jobs`
) SELECT * FROM `new_pilots`;
```

Attention, les clés/index seront perdus au passage !
Il est possible de les conserver en duplicant la table grace au code suivant :

```sql
CREATE TABLE new_pilots LIKE pilots ; 
INSERT INTO new_pilots SELECT * FROM pilots ; -- marche avec ou sans le INTO
```
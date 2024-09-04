# Introduction aux fonctioins MySQL

## Fonctions de Date et Heure

MySQL offre plusieurs fonctions pour manipuler les dates et les heures.

**Exemple :**

```sql
SELECT name, last_name FROM pilots WHERE next_flight > NOW();
```

Cela récupère les pilotes dont le prochain vol est programmé après l'heure actuelle.

## Introduction ax fonctions en MySQL

- Les fonctions de chaînes 

```sql
SELECT 
    UPPER(name) as NameUpperPilot,
    LOWER(name) as NameLowerPilot,
    SUBSTRING(name, 1, 4) as NameSubPilot,
    LENGTH(name) as LnNamePilot,
    REPLACE(name, 'e', 'A') as ReplaceNamePilot
FROM pilots;
```

Pour la concaténation de chaîne vous pouvez utiliser le code suivant :

```sql
SELECT CONCAT('Hello', 'World');
-- avec séparateur
SELECT CONCAT_WS(', ', 'Hello', 'World');

-- convertis en date ou datetime
SELECT CONVERT (20130101, date);

SELECT CONVERT (CURRENT_TIMESTAMP, datetime);
```

- Les fonctions de nombres

FLOOR, CEILING, ROUND, *, + ... 

FLOOR : sol et CEILING plafond.

- Les fonctions de dates

Selon les SGDB les fonctions de date peuvent être plus ou moins fournies.

```sql
SELECT 
    birth_day,
    CURDATE(), -- date courante au format date
    year(birth_day) as year_pilot_bd,
    month(birth_day) as month_pilot_bd,
    EXTRACT( DAY FROM birth_day) as hour_pilot_bd,
    CURRENT_TIMESTAMP,
    DATE_ADD(birth_day, INTERVAL 1 MONTH) as date_bd,
    DATEDIFF(CURRENT_TIMESTAMP, birth_day) as datediff_db,
    TIMESTAMPDIFF(YEAR, birth_day, CURDATE()) < 30, -- equivalent à la requête précédente
    DATE_FORMAT(birth_day, '%W %M %Y') as bd_format -- formatage de date ISO diffère selon les SGBD
FROM pilots;
```

## Exercice date de l'an dernier

Donnez le nom du jour il y a un an exactement ?

## Exercice aléatoire

Créez des dates aléatoires de +/- 3jours, par rapport à la date de naissance la plus récente de la table pilots.

Remarque : le select suivant crée une date à + 1 jour par rapport à la date en premier paramètre.

```sql
SELECT DATE_ADD('2018-05-01', INTERVAL 1 DAY);
```
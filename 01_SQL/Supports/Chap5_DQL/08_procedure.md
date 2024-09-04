# Cours sur les Procédures Stockées en SQL

## Introduction

Les procédures stockées (ou "stored procedures") sont un ensemble de requêtes SQL qui sont compilées et stockées dans une base de données. Elles permettent d'automatiser des tâches complexes, de réutiliser du code, et d'améliorer les performances des applications qui interagissent avec la base de données. Une procédure stockée peut recevoir des paramètres d'entrée, exécuter des instructions SQL, et retourner des résultats ou des messages.

## Avantages des Procédures Stockées

1. **Réutilisabilité** : Le code SQL encapsulé dans une procédure stockée peut être réutilisé par plusieurs applications ou utilisateurs, ce qui réduit la duplication du code.
2. **Performance** : Les procédures stockées sont compilées lors de leur création, ce qui améliore les performances car le plan d'exécution est stocké et réutilisé.
3. **Sécurité** : Les procédures stockées permettent de contrôler l'accès aux données. Les utilisateurs peuvent exécuter des procédures stockées sans avoir besoin d'accès direct aux tables sous-jacentes.
4. **Maintenance** : Les changements de logique peuvent être faits au niveau de la procédure stockée sans nécessiter de modification du code des applications clientes.

## Création d'une Procédure Stockée

La syntaxe de base pour créer une procédure stockée varie légèrement selon les systèmes de gestion de bases de données (SGBD), mais voici un exemple général basé sur MySQL :

```sql
DELIMITER //

CREATE PROCEDURE nom_procedure (param1 TYPE, param2 TYPE, ...)
BEGIN
    -- Instructions SQL
    SELECT * FROM table WHERE colonne = param1;
    -- Autres instructions
END //

DELIMITER ;
```

- **`DELIMITER //`** : Change le délimiteur par défaut (`;`) pour permettre l'inclusion de multiples instructions SQL dans le corps de la procédure.
- **`CREATE PROCEDURE`** : Déclare le nom de la procédure et les paramètres qu'elle accepte.
- **`BEGIN ... END`** : Encapsule le bloc d'instructions SQL qui constitue le corps de la procédure.

## Exemple de Procédure Stockée

Imaginons que nous souhaitons créer une procédure stockée qui renvoie tous les pilotes d'une compagnie aérienne spécifique :

```sql
DELIMITER //

CREATE PROCEDURE GetPilotsByCompany(IN compCode CHAR(4))
BEGIN
    SELECT certificate, name, last_name, plane
    FROM pilots
    WHERE company = compCode;
END //

DELIMITER ;
```

- **`IN compCode CHAR(4)`** : Définit un paramètre d'entrée `compCode` de type `CHAR(4)`. Ce paramètre sera utilisé pour filtrer les pilotes par compagnie.

## Appeler une Procédure Stockée

Pour exécuter la procédure stockée, vous utilisez la commande `CALL` :

```sql
CALL GetPilotsByCompany('DAIR');
```

Cela exécutera la procédure `GetPilotsByCompany` et retournera tous les pilotes travaillant pour la compagnie `DAIR`.

## Paramètres dans les Procédures Stockées

Les procédures stockées peuvent accepter plusieurs types de paramètres :

- **IN** : Le paramètre est passé à la procédure et ne peut pas être modifié dans le corps de la procédure.
- **OUT** : Le paramètre est utilisé pour renvoyer une valeur à l'appelant après l'exécution de la procédure.
- **INOUT** : Le paramètre est passé à la procédure et peut être modifié dans la procédure pour retourner une valeur.

Exemple d'utilisation de paramètres `INOUT` :

```sql
DELIMITER //

CREATE PROCEDURE AdjustBonus(INOUT bonusAmount DECIMAL(10,2), IN companyCode CHAR(4))
BEGIN
    UPDATE pilots
    SET bonus = bonus + bonusAmount
    WHERE company = companyCode;
    
    SELECT SUM(bonus) INTO bonusAmount
    FROM pilots
    WHERE company = companyCode;
END //

DELIMITER ;
```

Dans cet exemple, le paramètre `bonusAmount` est modifié par la procédure pour contenir la somme totale des bonus après la mise à jour.

## Gestion des Erreurs

Les procédures stockées peuvent inclure des mécanismes pour gérer les erreurs. Par exemple, dans MySQL, vous pouvez utiliser des blocs `DECLARE ... HANDLER` pour capturer et gérer les exceptions.

Exemple :

```sql
DELIMITER //

CREATE PROCEDURE SafeUpdateBonus(IN companyCode CHAR(4), IN bonusIncrease DECIMAL(10,2))
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Gestion de l'erreur
        ROLLBACK;
        SELECT 'Erreur: la mise à jour a échoué.';
    END;
    
    START TRANSACTION;
    
    UPDATE pilots
    SET bonus = bonus + bonusIncrease
    WHERE company = companyCode;
    
    COMMIT;
END //

DELIMITER ;
```

Dans cet exemple, si une erreur se produit lors de la mise à jour, la transaction est annulée (ROLLBACK) et un message d'erreur est retourné.

## Modification et Suppression de Procédures Stockées

Pour modifier une procédure existante, vous devrez souvent la supprimer et la recréer car les commandes de modification directe ne sont pas toujours disponibles. Pour supprimer une procédure, utilisez la commande suivante :

```sql
DROP PROCEDURE IF EXISTS nom_procedure;
```

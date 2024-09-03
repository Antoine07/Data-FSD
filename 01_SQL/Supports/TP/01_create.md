# TP : Manipulation de la Table `sales`

1. **Création de la table initiale**  
   Utilisez la commande CREATE TABLE pour créer la table `sales` avec les colonnes initiales suivantes :

   - `id` bigint PK ( PRIMARY KEY)
   - `created_at` de type datetime
   - `company` cohérente par rapport à la colonne de même nom dans la table companies
   - `profit` 
 
```sql
CREATE TABLE `sales` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` DATE DEFAULT '1980-01-01',
  `company` CHAR(4) DEFAULT NULL,
  `profit` DECIMAL(15,2) DEFAULT NULL,
  CONSTRAINT `pk_id` PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `sales`
MODIFY `created_at` DATETIME DEFAULT '2024-01-01 00:00:00';
```

1. **Ajout une colonne oubliée**  
   Après avoir créé la table, ajoutez la colonne suivante 
   - `region` : la région où la vente a été effectuée (varchar(50)).

```sql
ALTER TABLE `sales`
ADD COLUMN `region` VARCHAR(50) ;
```

2. **Insertion de données dans la table `sales`**  
   Insérez des données d'exemple pour simuler des ventes. Utilisez les données suivantes :

```sql
INSERT INTO `sales` (`created_at`, `company`, `profit`, `region`) 
VALUES
     ( '2024-01-15 08:30:00', 'AUS', 12345.67, 'North America'),
     ( '2024-01-16 09:00:00', 'FRE1', 23456.78, 'Europe'),
     ( '2024-01-17 10:15:00', 'SIN', 34567.89, 'Asia'),
     ( '2024-01-18 11:00:00', 'CHI', 45678.90, 'South America'),
     ( '2024-01-19 12:45:00', 'AUS', 56789.01, 'North America'),
     ( '2024-01-20 13:30:00', 'FRE1', 67890.12, 'Europe'),
     ( '2024-01-21 14:20:00', 'SIN', 78901.23, 'Asia'),
     ( '2024-01-22 15:05:00', 'CHI', 89012.34, 'South America'),
     ( '2024-01-23 16:00:00', 'AUS', 90123.45, 'North America'),
     ( '2024-01-24 17:30:00', 'FRE1', 10123.56, 'Europe'),
     ( '2024-01-25 18:15:00', 'SIN', 11123.67, 'Asia'),
     ( '2024-01-26 19:00:00', 'CHI', 12123.78, 'South America'),
     ( '2024-01-27 20:45:00', 'AUS', 13123.89, 'North America'),
     ( '2024-01-28 21:30:00', 'FRE1', 14123.90, 'Europe'),
     ( '2024-01-29 22:00:00', 'SIN', 15123.01, 'Asia'),
     ( '2024-01-30 23:15:00', 'CHI', 16123.12, 'South America'),
     ( '2024-01-31 00:00:00', 'AUS', 17123.23, 'North America'),
     ( '2024-02-01 01:30:00', 'FRE1', 18123.34, 'Europe'),
     ( '2024-02-02 02:45:00', 'SIN', 19123.45, 'Asia'),
     ( '2024-02-03 03:30:00', 'CHI', 20123.56, 'South America');
```

1. **Affichage des données**  
   Utilisez une requête pour afficher toutes les données de la table `sales` et vérifier que les données ont été insérées correctement.

```sql
SELECT * FROM `sales` ;

-- pour connaitre la somme total et moyenne
SELECT SUM(profit) FROM `sales`;
SELECT AVG(profit) FROM `sales`;
```

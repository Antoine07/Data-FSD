# Exercices DQL Faciles

## Exercice 1 : Sélectionner tous les pilotes

**Question :** Écrivez une requête SQL pour sélectionner toutes les informations de la table `pilots`.

**Solution :**
```sql
SELECT * FROM pilots;
```

## Exercice 2 : Trouver tous les noms de compagnies

**Question :** Écrivez une requête SQL pour sélectionner uniquement les noms de toutes les compagnies dans la table `companies`.

**Solution :**
```sql
SELECT name FROM companies;
SELECT DISTINCT name FROM companies;
```

## Exercice 3 : Lister les profits de vente

**Question :** Écrivez une requête SQL pour sélectionner tous les profits de vente de la table `sales`.

**Solution :**
```sql
SELECT profit FROM sales;
```

## Exercice 4 : Trouver les pilotes volant des A380

**Question :** Écrivez une requête SQL pour trouver tous les pilotes qui volent avec un avion de type `A380`.

**Solution :**
```sql
SELECT * FROM pilots WHERE plane = 'A380';
```

## Exercice 5 : Sélectionner les pilotes nés après l'année 1980

**Question :** Écrivez une requête SQL pour sélectionner tous les pilotes nés après le 1er janvier 1980.

**Solution :**
```sql
SELECT * FROM pilots WHERE birth_day > '1980-12-31';
```

## Exercice 6 : Trier les compagnies par nom

**Question:** Écrivez une requête SQL pour sélectionner toutes les compagnies et les trier par nom dans l'ordre alphabétique.

**Solution :**
```sql
SELECT * FROM companies ORDER BY name;
SELECT * FROM companies ORDER BY name DESC;
```

## Exercice 7 : Lister les profits de vente de plus de 100000

**Question :** Écrivez une requête SQL pour lister les profits de vente qui sont supérieurs à 100000.

**Solution :**
```sql
SELECT * FROM sales WHERE profit > 100000;
```

## Exercice 8 : Sélectionner les noms et prénoms des pilotes

**Question :** Écrivez une requête SQL pour sélectionner les noms (`name`) et prénoms (`last_name`) des pilotes.

**Solution :**
```sql
SELECT name, last_name FROM pilots;
SELECT last_name, name FROM pilots;
```

## Exercice 9 : Trouver les ventes pour une compagnie spécifique

**Question :** Écrivez une requête SQL pour trouver toutes les ventes associées à la compagnie 'AAIR'.

**Solution :**
```sql
SELECT profit FROM sales WHERE company = 'AAIR';
SELECT SUM(profit) as total FROM sales WHERE company = 'AAIR';
```

## Exercice 10 : Afficher les pilotes avec un bonus supérieur à 2000

**Question :** Écrivez une requête SQL pour afficher tous les pilotes ayant un bonus supérieur à 2000.

**Solution :**
```sql
SELECT * FROM pilots WHERE bonus > 2000;
```

## Exercice 11 : Lister les compagnies dans une ville spécifique

**Question :** Écrivez une requête SQL pour lister toutes les compagnies situées à 'New York'.

**Solution :**
```sql
SELECT * FROM companies WHERE city = 'New York';
```

## Exercice 12 : Trier les profits de vente par ordre décroissant

**Question :** Écrivez une requête SQL pour sélectionner tous les profits de vente et les trier par ordre décroissant.

**Solution :**
```sql
SELECT * FROM sales ORDER BY profit DESC;
```

## Exercice 13 : Sélectionner les pilotes avec un nombre de vols supérieur à 200

**Question :** Écrivez une requête SQL pour trouver tous les pilotes ayant effectué plus de 200 vols (`num_jobs`).

**Solution :**
```sql
SELECT * FROM pilots WHERE num_jobs > 200;
```

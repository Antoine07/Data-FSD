# Exercices sur les Requêtes Imbriquées

**Exercice Sous-requête dans `SELECT`**  
   Récupérez les noms des pilotes et le total des profits générés par la compagnie pour laquelle chaque pilote travaille.

```sql

SELECT 
    p.name as name_pilot,
    -- DEBUT SOUS REQUÊTE CORRELEE pour chaque ligne de p.company 
    (SELECT SUM(s.profit) FROM sales as s WHERE s.company = p.company ) as total_profit
    -- FIN SOUS REQUÊTE CORRELEE
FROM pilots as p;

```

♥️ ** La sous-requête est corrélée** parce qu'elle se réfère à la table extérieure (pilots) via l'alias p.company. 
 
 Pour chaque ligne de pilots, elle exécute une somme des profits (SUM(s.profit)) de la table sales où la compagnie (s.company) correspond à la compagnie du pilote (p.company).

❤️ **La corrélation garantit** que les résultats sont filtrés et regroupés correctement par rapport aux lignes de la table extérieure (pilots).

1. Exercice Sous-requête

**Question**: Affichez le nom du pilote qui a le plus grand bonus.

**Correction**:
```sql
SELECT name, last_name
FROM pilots
WHERE bonus = (SELECT MAX(bonus) FROM pilots);
```
**Explication**: La sous-requête renvoie le maximum des bonus, puis la requête principale sélectionne le pilote avec ce bonus.

**Question**: Affichez le nom du pilote qui a le plus petit nombre d'heures de vol.

**Correction**:
```sql
SELECT name, last_name
FROM pilots
WHERE num_flying = (SELECT MIN(num_flying) FROM pilots);
```
**Explication**: Cette requête fonctionne de la même manière, mais elle sélectionne le pilote avec le minimum d'heures de vol.

**Question**: Listez les noms des pilotes qui travaillent pour une compagnie basée à "San Francisco".

**Correction**:
```sql
SELECT p.name, p.last_name
FROM pilots p
WHERE p.company IN (SELECT c.comp FROM companies c WHERE c.city = 'San Francisco');
```
**Explication**: La sous-requête sélectionne les codes des compagnies situées à San Francisco, et la requête principale filtre les pilotes travaillant pour ces compagnies.

**Question**: Affichez les noms des compagnies qui ont au moins un pilote pilotant un A320.

**Correction**:
```sql
SELECT DISTINCT c.name
FROM companies c
WHERE c.comp IN (SELECT p.company FROM pilots p WHERE p.plane = 'A320');
```
**Explication**: La sous-requête sélectionne les compagnies ayant au moins un pilote qualifié pour piloter un A320. La requête principale sélectionne les noms de ces compagnies.

**Question**: Affichez le nom des pilotes dont le nombre de jobs est supérieur à la moyenne des jobs de tous les pilotes.

**Correction**:
```sql
SELECT name, last_name
FROM pilots
WHERE num_jobs > (SELECT AVG(num_jobs) FROM pilots);
```
**Explication**: La sous-requête calcule la moyenne des jobs, et la requête principale filtre les pilotes ayant plus de jobs que cette moyenne.


2. Exercice Sous-requête pour Filtrage

**Question**: Listez les compagnies qui ont des ventes (présentes dans la table `sales`).

**Correction**:
```sql
SELECT DISTINCT c.name
FROM companies c
WHERE c.comp IN (SELECT s.company FROM sales s);
```
**Explication**: La sous-requête sélectionne les compagnies qui ont des enregistrements dans la table `sales`. La requête principale affiche les noms de ces compagnies.

3. Exercice Sous-requête dans le Sélecteur de Colonnes

**Question**: Affichez le nom et le bonus de chaque pilote, ainsi que le bonus moyen de tous les pilotes.

**Correction**:
```sql
SELECT 
    name,
    bonus,
    (SELECT AVG(bonus) FROM pilots) AS avg_bonus
FROM pilots;
```
**Explication**: La sous-requête calcule le bonus moyen de tous les pilotes et l'affiche pour chaque pilote dans le résultat.

4. Exercice Sous-requête avec `NOT IN`

**Question**: Affichez les noms des pilotes qui ne travaillent pas pour une compagnie ayant fait des ventes.

**Correction**:
```sql
SELECT name, last_name
FROM pilots
WHERE company NOT IN (SELECT company FROM sales);
```
**Explication**: La sous-requête sélectionne les compagnies présentes dans la table `sales`, et la requête principale filtre les pilotes travaillant pour des compagnies qui ne figurent pas dans cette liste.
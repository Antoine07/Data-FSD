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

5. Exercice Sous-requête Corrélée Simple

**Question**: Pour chaque pilote, affichez son nom et le nombre de pilotes travaillant dans la même compagnie.

**Correction**:
```sql
SELECT 
    p1.name, 
    p1.last_name, 
    (SELECT COUNT(*) FROM pilots p2 WHERE p2.company = p1.company) AS num_pilots_in_company
FROM pilots p1;
```
**Explication**: La sous-requête corrélée compte le nombre de pilotes travaillant dans la même compagnie que chaque pilote dans la requête principale.

---

6. Exercice Sous-requête dans `WHERE`

**Question**: Listez les pilotes qui travaillent pour une compagnie ayant généré plus de 100,000 en profits.

**Correction**:
```sql
SELECT name, last_name
FROM pilots
WHERE company IN (SELECT company FROM sales GROUP BY company HAVING SUM(profit) > 100000);
```
**Explication**: La sous-requête utilise `GROUP BY` et `HAVING` pour sélectionner les compagnies ayant des profits totaux supérieurs à 100,000, et la requête principale sélectionne les pilotes travaillant pour ces compagnies.

7. Exercice 

**Question**: Affichez le nombre de pilotes par compagnie, mais uniquement pour les compagnies ayant plus de deux pilotes.

**Correction**:
```sql
SELECT company, COUNT(*) AS num_pilots
FROM pilots
GROUP BY company
HAVING num_pilots > 2;
```
**Explication**: Cette requête n'utilise pas de sous-requête, car `HAVING` suffit pour filtrer les compagnies ayant plus de deux pilotes après le `GROUP BY`.

8. Exercice Sous-requête Corrélée dans `SELECT`

**Question**: Pour chaque pilote, affichez le nombre de pilotes travaillant pour la même compagnie.

**Correction**:
```sql
SELECT 
    p1.name, 
    p1.last_name, 
    (SELECT COUNT(*) FROM pilots p2 WHERE p2.company = p1.company) AS num_pilots_in_company
FROM pilots p1;
```

9. Exercice 

**Question**: Trouvez toutes les compagnies ayant un total de profits supérieur à 200,000.

**Correction**:
```sql
SELECT company, SUM(profit) AS total_profit
FROM sales
GROUP BY company
HAVING SUM(profit) > 200000;
```
**Explication**: `HAVING` est utilisé après `GROUP BY` pour filtrer les compagnies ayant des profits totaux supérieurs à 200,000.


10. (**)  : Sous-requête dans `UPDATE`
**Question**:  
Mettez à jour le bonus de tous les pilotes en augmentant de 500 pour ceux travaillant dans une compagnie ayant généré plus de 150,000 en profits.

**Correction**:
```sql
UPDATE pilots 
SET bonus = bonus + 500
WHERE company IN (
    SELECT company
    FROM sales
    GROUP BY company
    HAVING SUM(profit) > 150000
);
```
**Explication**: La sous-requête récupère les compagnies ayant généré plus de 150,000 en profits. Les pilotes appartenant à ces compagnies voient leur bonus augmenter de 500.


11. : Sous-requête avec `EXISTS`
**Question**:  
Affichez les compagnies pour lesquelles il existe au moins un pilote.

**Correction**:
```sql
SELECT *
FROM companies c
WHERE EXISTS (
    SELECT 1  -- On met 1 comme valeur par défaut , la requete doit retourner quelque chose et sinon rien EXISTS sera FALSE et la requête globale ne retourne rien
    FROM pilots p
    WHERE p.company = c.comp
);
```
**Explication**: La sous-requête vérifie l'existence d'au moins un pilote pour chaque compagnie. Si une compagnie a au moins un pilote, elle est incluse dans le résultat.

12. : Sous-requête Corrélée avec Agrégation
**Question**:  
Pour chaque pilote, affichez le nombre de ventes réalisées par leur compagnie après la date '2024-08-01'.

**Correction**:
```sql
SELECT 
    p.name,
    p.company,
    (SELECT COUNT(*) 
     FROM sales s 
     WHERE s.company = p.company AND s.created_at > '2024-08-01') AS sales_count
FROM 
    pilots p;
```
**Explication**: La sous-requête corrélée calcule le nombre de ventes réalisées par la compagnie du pilote après le 1er août 2024, pour chaque pilote.

13. : Sous-requête dans `DELETE`
**Question**:  
Supprimez les ventes réalisées par des compagnies qui n'ont pas de pilotes.

**Correction**:
```sql
DELETE FROM sales 
WHERE company NOT IN (
    SELECT DISTINCT company 
    FROM pilots
);
```
**Explication**: La sous-requête sélectionne toutes les compagnies ayant des pilotes. La requête principale supprime les ventes pour les compagnies ne figurant pas dans cette liste.


14.  : Sous-requête avec `IN`
**Question**:  
Listez les pilotes travaillant pour des compagnies dont le nom commence par 'A'.

**Correction**:
```sql
SELECT *
FROM pilots 
WHERE company IN (
    SELECT comp 
    FROM companies 
    WHERE name LIKE 'A%'  -- A% A suivi de n'importe quel(s) caractère(s)
);
```
**Explication**: La sous-requête récupère les codes des compagnies dont le nom commence par 'A'. La requête principale sélectionne les pilotes travaillant pour ces compagnies.
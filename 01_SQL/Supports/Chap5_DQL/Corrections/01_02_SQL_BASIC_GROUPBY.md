# Group By 

## Exercice 1 : Calculer le profit total pour chaque compagnie

**Question** : Quel est le profit total pour chaque compagnie enregistrée dans la table `sales` ?

```sql
SELECT company, SUM(profit) AS total_profit
FROM sales
GROUP BY company;

SELECT company, ROUND( SUM(profit), 1 )AS total_profit
FROM sales
GROUP BY company;
```

## Exercice 2 : Nombre total de pilotes par compagnie

**Question** : Combien de pilotes sont enregistrés pour chaque compagnie dans la table `pilots` ?

```sql
SELECT company, COUNT(*) AS total_pilots
FROM pilots
GROUP BY company;
```

## Exercice 3 : Moyenne des heures de vol par type d'avion

**Question** : Quelle est la moyenne des heures de vol pour chaque type d'avion dans la table `pilots` ?

```sql
SELECT plane, AVG(num_flying) AS average_flying_hours
FROM pilots
GROUP BY plane;
```

## Exercice 4 : Bonus moyen des pilotes par compagnie

**Question** : Quel est le bonus moyen des pilotes pour chaque compagnie ?

```sql
SELECT company, AVG(bonus) AS average_bonus
FROM pilots
GROUP BY company;
```

## Exercice 5 : Calculer le nombre total de jobs par compagnie

**Question** : Quel est le nombre total de jobs effectués par les pilotes de chaque compagnie ?

```sql
SELECT company, SUM(num_jobs) AS total_jobs
FROM pilots
GROUP BY company;
```

## Exercice 6 : Calculer le profit moyen par mois

**Question** : Quel est le profit moyen par mois pour toutes les ventes ?

```sql
SELECT MONTH(created_at) AS month, AVG(profit) AS average_monthly_profit
FROM sales
GROUP BY month;
```

## Exercice 7 : Calculer le profit maximum par compagnie

**Question** : Quel est le profit maximum enregistré pour chaque compagnie ?

```sql
SELECT company, MAX(profit) AS max_profit
FROM sales
GROUP BY company;
```

## Exercice 8 : Moyenne des heures de vol par pilote

**Question** : Quelle est la moyenne des heures de vol par pilote ?

```sql
SELECT name, last_name, AVG(num_flying) AS average_flying_hours
FROM pilots;
```

## Exercice 9 : Compter le nombre de ventes par compagnie

**Question** : Combien de ventes ont été effectuées par chaque compagnie ?

```sql
SELECT company, COUNT(*) AS total_sales
FROM sales
GROUP BY company;
```

## Exercice 10 ** : Trouver le nombre de pilotes par âge

**Question** : Quel est le nombre de pilotes par groupe d'âge (moins de 30 ans, 30-40 ans, 40-50 ans, plus de 50 ans) ?

```sql
SELECT 
CASE 
   WHEN TIMESTAMPDIFF(YEAR, birth_day, CURDATE()) < 30  THEN 'Moins de 30 ans' 
   WHEN TIMESTAMPDIFF(YEAR, birth_day, CURDATE()) BETWEEN 30 AND 40  THEN '30-40 ans' 
   WHEN TIMESTAMPDIFF(YEAR, birth_day, CURDATE()) BETWEEN 40 AND 50  THEN '40-50 ans' 
   ELSE 'Plus de 30 ans'
END AS age,
COUNT(*) as total_pilot
FROM pilots
GROUP BY age ;
```
# GROUP BY et HAVING

1. **Quel est le profit total généré par chaque compagnie en 2024 ?**
   ```sql
   SELECT company, SUM(profit) AS total_profit
   FROM sales
   WHERE YEAR(created_at) = 2024
   GROUP BY company;
   ```

2. **Combien de pilotes chaque compagnie a-t-elle, et combien ont plus de 200 heures de vol ?**
   ```sql
   SELECT company, COUNT(*) AS total_pilots, SUM(CASE WHEN num_flying > 200 THEN 1 ELSE 0 END) AS pilots_above_200_hours
   FROM pilots
   GROUP BY company;
   ```

3. **Quelle est la moyenne des bonus des pilotes pour chaque compagnie, mais uniquement pour les compagnies où la moyenne des bonus est supérieure à 2000 ?**
   ```sql
   SELECT company, AVG(bonus) AS average_bonus
   FROM pilots
   GROUP BY company
   HAVING average_bonus > 2000;
   ```

4. **Quel est le nombre total de ventes pour chaque compagnie en 2024, et seulement pour celles ayant au moins 4 ventes ?**
   ```sql
   SELECT company, COUNT(*) AS total_sales
   FROM sales
   WHERE YEAR(created_at) = 2024
   GROUP BY company
   HAVING COUNT(*) >= 4;
   ```

5. **Quels sont les nombres totaux de jobs pour les compagnies dont le nombre total de jobs des pilotes dépasse 150 ?**
   ```sql
   SELECT company, SUM(num_jobs) AS total_jobs
   FROM pilots
   GROUP BY company
   HAVING SUM(num_jobs) > 150;
   ```

6. **Quelle est la somme des profits pour chaque compagnie en 2024, mais seulement pour les compagnies où le profit total est supérieur à 100000 ?**
   ```sql
   SELECT company, SUM(profit) AS total_profit
   FROM sales
   WHERE YEAR(created_at) = 2024
   GROUP BY company
   HAVING SUM(profit) > 100000;
   ```

7. **Quel est le nombre moyen de vols par pilote pour chaque compagnie, mais uniquement pour les compagnies où la moyenne est supérieure à 400 heures de vol ?**
   ```sql
   SELECT company, AVG(num_flying) AS avg_flying_hours
   FROM pilots
   GROUP BY company
   HAVING AVG(num_flying) > 400;
   ```

8. **Combien de pilotes chaque compagnie a-t-elle avec un bonus supérieur à 2000, mais uniquement pour les compagnies avec plus de 2 pilotes ayant un bonus supérieur à 2000 ?**
   ```sql
   SELECT company, COUNT(*) AS pilots_with_bonus_above_2000
   FROM pilots
   WHERE bonus > 2000
   GROUP BY company
   HAVING COUNT(*) > 2;
   ```

9. ** NOTE AMBIGU Quelle est la somme des profits pour les compagnies qui ont enregistré des profits supérieurs à 120000 au moins trois fois en 2024 ?**
   ```sql
   SELECT company, SUM(profit) AS total_profit
   FROM sales
   WHERE YEAR(created_at) = 2024
   GROUP BY company
   HAVING COUNT(*) >= 3 AND SUM(profit) > 120000;
   ```

10. **Quelle est la somme des heures de vol pour chaque compagnie, mais uniquement pour celles dont la somme totale des heures de vol est supérieure à 1000 heures ?**
    ```sql
    SELECT company, SUM(num_flying) AS total_flying_hours
    FROM pilots
    GROUP BY company
    HAVING SUM(num_flying) > 1000;
    ```

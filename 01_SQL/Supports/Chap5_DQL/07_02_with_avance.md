# CTEs Récursives

Les CTEs peuvent également être récursives, c'est-à-dire qu'elles peuvent s'appeler elles-mêmes pour résoudre des problèmes comme les arbres hiérarchiques ou les graphes. La syntaxe de la CTE récursive est légèrement différente :

```sql
WITH RECURSIVE cte_name AS (
    -- Requête ancrée
    SELECT ...
    FROM ...
    WHERE ...

    UNION ALL

    -- Requête récursive
    SELECT ...
    FROM cte_name
    JOIN ...
    WHERE ...
)
SELECT ...
FROM cte_name;
```

- **Requête ancrée** : La partie de la CTE qui fournit les résultats initiaux.
- **Requête récursive** : Partie qui fait référence à la CTE elle-même pour générer les lignes suivantes.

## Exemple de CTE Récursive

Supposons que nous avons une table `employees` avec une structure hiérarchique des employés et des managers :

```sql
WITH RECURSIVE EmployeeHierarchy AS (
    -- Niveau 0 : Trouver le PDG
    SELECT employee_id, manager_id, name, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Niveau suivant : Trouver les subordonnés
    SELECT e.employee_id, e.manager_id, e.name, eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.employee_id
)
SELECT *
FROM EmployeeHierarchy;
```

- Ici, la CTE récursive construit une hiérarchie d'employés en partant du PDG (qui n'a pas de manager) et en traversant les subordonnés.

## Utilisation de CTE avec Plusieurs Requêtes

Vous pouvez définir plusieurs CTEs dans une seule requête en les séparant par des virgules :

```sql
WITH CTE1 AS (
    SELECT ...
),
CTE2 AS (
    SELECT ...
)
SELECT ...
FROM CTE1
JOIN CTE2 ON ...;
```

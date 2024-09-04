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

 La sous-requête est corrélée parce qu'elle se réfère à la table extérieure (pilots) via l'alias p.company. 
 
 Pour chaque ligne de pilots, elle exécute une somme des profits (SUM(s.profit)) de la table sales où la compagnie (s.company) correspond à la compagnie du pilote (p.company).

❤️ **La corrélation garantit** que les résultats sont filtrés et regroupés correctement par rapport aux lignes de la table extérieure (pilots).

1. **Exercice Sous-requête **
   - Affichez le nom du pilote qui a le plus grand bonus.
   - Affichez le nom du pilote qui a le plus petit nombre d'heures de vol.
   - Listez les noms des pilotes qui travaillent pour une compagnie basée à "San Francisco".
   - Affichez les noms des compagnies qui ont au moins un pilote pilotant un A320.
   - Affichez le nom des pilotes dont le nombre de jobs est supérieur à la moyenne des jobs de tous les pilotes.

2. **Exercice Sous-requête pour Filtrage**
   - Listez les compagnies qui ont des ventes (présentes dans la table `sales`).

3. **Exercice Sous-requête dans le Sélecteur de Colonnes**
   - Affichez le nom et le bonus de chaque pilote, ainsi que le bonus moyen de tous les pilotes.
4. **Exercice Sous-requête avec `NOT IN`**
   - Affichez les noms des pilotes qui ne travaillent pas pour une compagnie ayant fait des ventes.

5. **Exercice Sous-requête Corrélée Simple**
   - Pour chaque pilote, affichez son nom et le nombre de pilotes travaillant dans la même compagnie.

6. **Exercice Sous-requête dans `WHERE`**  
   Listez les pilotes qui travaillent pour une compagnie ayant généré plus de 100,000 en profits.
   
7. **Exercice Sous-requête dans `FROM`**  
   Affichez le nombre de pilotes par compagnie, mais uniquement pour les compagnies ayant plus de deux pilotes.

8. **Exercice Sous-requête Corrélée dans `SELECT`**  
   Pour chaque pilote, affichez le nombre de pilotes travaillant pour la même compagnie.

9.  **Exercice Sous-requête avec `HAVING`**  
   Trouvez toutes les compagnies ayant un total de profits supérieur à 200,000.

10. **Exercice Sous-requête dans `UPDATE`**  
   Mettez à jour le bonus de tous les pilotes en augmentant de 500 pour ceux travaillant dans une compagnie ayant généré plus de 150,000 en profits.
   
11. **Exercice Sous-requête avec `EXISTS`**  
   Affichez les compagnies pour lesquelles il existe au moins un pilote.

12. **Exercice Sous-requête Corrélée avec Agrégation**  
   Pour chaque pilote, affichez le nombre de ventes réalisées par leur compagnie après la date '2024-08-01'.

13. **Exercice Sous-requête dans `DELETE`**  
   Supprimez les ventes réalisées par des compagnies qui n'ont pas de pilotes.
  
14. **Exercice  Sous-requête avec `IN`**  
    Listez les pilotes travaillant pour des compagnies dont le nom commence par 'A'.

## ANY ALL

#### Exercice 1 : Pilotes avec Bonus Supérieur à Tous les Bonus d'une Compagnie

Trouvez les pilotes dont le bonus est supérieur à tous les bonus des pilotes travaillant pour la compagnie ayant le code 'DAIR'.

#### Exercice 2 : Pilotes avec Bonus Supérieur à au Moins un Bonus d'une Compagnie

Trouvez les pilotes dont le bonus est supérieur à au moins un des bonus des pilotes travaillant pour la compagnie ayant le code 'DAIR'.

#### Exercice 3 : Compagnies avec Profits Supérieurs à Tous les Profits d'une Compagnie

Trouvez les compagnies dont le profit total est supérieur à tous les profits réalisés par la compagnie 'DAIR'.

#### Exercice 4 : Compagnies avec Profits Supérieurs à au Moins un Profit d'une Compagnie

Trouvez les compagnies dont le profit total est supérieur à au moins un des profits réalisés par la compagnie 'DAIR'.

#### Exercice 5 : Pilotes avec Nombre d'Heures de Vol Supérieur à Tous les Heures de Vol d'une Compagnie

Trouvez les pilotes dont le nombre total d'heures de vol est supérieur à tous les heures de vol des pilotes travaillant pour la compagnie 'DAIR'.

#### Exercice 6 : Pilotes avec bonus

Trouvez les pilotes dont le bonus  est différent à tous les bonus des pilotes travaillant pour la compagnie 'DAIR'.
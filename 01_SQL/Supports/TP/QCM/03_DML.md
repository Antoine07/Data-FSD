# QCM sur `INSERT`, `UPDATE` et `DELETE`

1. **La commande suivante permet-elle d'insérer correctement une nouvelle ligne dans la table `users` ?**

   ```sql
   INSERT INTO users (id, name, email) 
   VALUES (1, 'Alice', 'alice@example.com');
   ```

   - [ ] Oui
   - [ ] Non

2. **La commande `UPDATE` ci-dessous met-elle correctement à jour l'email de l'utilisateur avec `id = 2` dans la table `users` ?**

   ```sql
   UPDATE users
   SET email = 'bob@example.com'
   WHERE id = 2;
   ```

   - [ ] Oui
   - [ ] Non

3. **Cette commande `INSERT` est-elle valide pour insérer une nouvelle ligne avec des valeurs par défaut pour certaines colonnes ?**

   ```sql
   INSERT INTO products (product_name, price)
   VALUES ('Laptop', DEFAULT);
   ```

   - [ ] Oui
   - [ ] Non

4. **La commande suivante permet-elle de supprimer correctement tous les utilisateurs dont le nom est 'Charlie' ?**

   ```sql
   DELETE FROM users
   WHERE name = 'Charlie';
   ```

   - [ ] Oui
   - [ ] Non

5. **Cette commande `UPDATE` est-elle correcte pour augmenter le prix de tous les produits de 10% dans la table `products` ?**

   ```sql
   UPDATE products
   SET price = price * 1.1;
   ```

   - [ ] Oui
   - [ ] Non
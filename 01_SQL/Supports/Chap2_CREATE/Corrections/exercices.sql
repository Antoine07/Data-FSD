-- ajout d'un champ dans une table qui existe

ALTER TABLE `companies`
ADD COLUMN `status` ENUM('published', 'unpublished', 'draft') 
DEFAULT 'draft' 
AFTER `comp` ;

-- ajout d'un champ
ALTER TABLE `companies`
ADD COLUMN `num_street` SMALLINT  
AFTER `city` ;

/*
Supprimez cette nouvelle colonne puis recréez la en la plaçant cette fois-ci après la colonne "name" de la table companies. Utilisez la commande suivante : AFTER dans la commande ALTER.
*/
ALTER TABLE `companies`
DROP COLUMN `num_street` ;

ALTER TABLE `companies`
ADD COLUMN `num_street` SMALLINT  
AFTER `name`;

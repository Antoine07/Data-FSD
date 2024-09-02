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


CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`)
) ENGINE=InnoDB ;

-- alter 
ALTER TABLE `pilots` ADD CONSTRAINT `un_name` UNIQUE (`name`);

-- directement dans à la création de la table

DROP TABLE IF EXISTS `pilots` ;
CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT un_name UNIQUE (`name`),
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`)
) ENGINE=InnoDB ;

INSERT INTO pilots SET `name`= 'Alan', certificate='cert-1' ;
-- ne marche pas car contrainte d'unicité sur la colonne name 
INSERT INTO pilots SET `name`= 'Alan', certificate='cert-2' ;

-- suppression de la contrainte UNIQUE sur la colonne name 

ALTER TABLE `pilots` DROP CONSTRAINT `un_name` ;
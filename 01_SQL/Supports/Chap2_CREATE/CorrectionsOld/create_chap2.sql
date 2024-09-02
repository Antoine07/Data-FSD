-- ### Exercice modifier
ALTER TABLE companies ADD COLUMN `status` ENUM ('published', 'unpublished', 'draft') DEFAULT 'draft';

-- Ajoutez également la colonne num_street
ALTER TABLE companies ADD COLUMN `num_street` INT;

-- Supprimez cette nouvelle colonne puis recréez la en la plaçant cette fois-ci après la colonne "name" de la table companies.
-- Utilisez la commande suivante : AFTER dans la commande ALTER.
ALTER TABLE companies DROP COLUMN `num_street`;
ALTER TABLE companies ADD COLUMN `num_street` INT AFTER `name`;

-- Autre possibilité : déplacer la colonne (si elle existe déjà avec des données), au lieu de la supprimer et de la recréer :
ALTER TABLE companies CHANGE COLUMN `num_street` `num_street` INT AFTER name;


-- ### Exercice créer la table pilots
CREATE TABLE `pilots` (
    `certificate` VARCHAR(6),
    `num_flying` DECIMAL(7,1),
    `company` CHAR(4),
    `name` VARCHAR(20) NOT NULL,
    CONSTRAINT pk_pilots PRIMARY KEY (`certificate`),
    CONSTRAINT uk_name UNIQUE (`name`)
) ENGINE=InnoDB ;

ALTER TABLE pilots ADD CONSTRAINT fk_pilots_company FOREIGN KEY (company) REFERENCES companies(`comp`);

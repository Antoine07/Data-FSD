INSERT INTO `pilots`
VALUES 
('AB123', '254.7', 'FRAC', 'Marie'),
('XZ789', '5021.3', 'BUSA', 'David'),
('GH456', '112.45', 'NETH', 'Sophie'),
('JK231', '6079.9', 'AIRC', 'Lucas'),
('LM983', '0.75', 'SPAI', 'Elena'),
('QW134', '45.67', 'RUAA', 'Victor'),
('ER459', '105.5', 'QATA', 'Sami'),
('CV871', '923.8', 'BRTI', 'Olivia'),
('YU540', '2023.14', 'AUZN', 'Liam'),
('PO231', '74.98', 'SUIR', 'Emma'),
('KI653', '4507.3', 'GERM', 'Noah'),
('WE842', '159.0', 'JAPA', 'Hana'),
('AS902', '8324.6', 'INDA', 'Rahul'),
('DF346', '2376.1', 'CHIA', 'Mei'),
('TG748', '69.5', 'SOUT', 'Jabu'),
('UX134', '123.7', 'CANR', 'Sophie'),
('QA659', '281.0', 'ITAA', 'Marco'),
('BN789', '530.9', 'BRZA', 'Lucas'),
('HY456', '4002.4', 'MEXI', 'Carlos'),
('OP123', '798.6', 'EGYP', 'Layla');


INSERT INTO `pilots`
(`certificate`, `name`)
VALUES 
('OP125', 'Sophie');

-- 

ALTER TABLE `pilots`
ADD COLUMN `created` DATETIME 
DEFAULT CURRENT_TIMESTAMP ; 

ALTER TABLE `pilots`
ADD `birth_day` DATETIME,
ADD `next_flight` DATETIME,
ADD `num_jobs` SMALLINT UNSIGNED DEFAULT 0 ;

-- suppression rapide de données

TRUNCATE `pilots` ;

-- demander la commande qui donne le create table de notre pilots altéré

SHOW CREATE TABLE `pilots`;

DROP TABLE IF EXISTS  `pilots` ;
CREATE TABLE `pilots` (
  `certificate` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_flying` decimal(7,1) DEFAULT NULL,
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `birth_day` datetime DEFAULT NULL,
  `next_flight` datetime DEFAULT NULL,
  `num_jobs` smallint unsigned DEFAULT '0',
  PRIMARY KEY (`certificate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- insertion de données

INSERT INTO `pilots` (`certificate`, `num_flying`, `company`, `name`, `created`, `birth_day`, `next_flight`, `num_jobs`) VALUES
('AB123', 254.7, 'FRAC', 'Marie', '2024-08-15 10:00:00', '1985-03-12 00:00:00', '2024-09-10 15:30:00', 12),
('XZ789', 5021.3, 'BUSA', 'David', '2024-06-22 14:30:00', '1978-11-23 00:00:00', '2024-09-18 11:00:00', 25),
('GH456', 112.45, 'NETH', 'Sophie', '2024-07-11 08:20:00', '1990-07-05 00:00:00', '2024-09-05 13:45:00', 7),
('JK231', 6079.9, 'AIRC', 'Lucas', '2024-05-30 12:45:00', '1983-04-17 00:00:00', '2024-09-20 09:00:00', 32),
('LM983', 0.75, 'SPAI', 'Elena', '2024-09-01 09:15:00', '1992-06-25 00:00:00', '2024-09-11 08:30:00', 1),
('QW134', 45.67, 'RUAA', 'Victor', '2024-08-28 16:00:00', '1988-01-08 00:00:00', '2024-09-12 14:15:00', 5),
('ER459', 105.5, 'QATA', 'Sami', '2024-07-19 11:25:00', '1980-12-02 00:00:00', '2024-09-22 17:00:00', 9),
('CV871', 923.8, 'BRTI', 'Olivia', '2024-04-21 07:45:00', '1995-09-19 00:00:00', '2024-09-13 10:30:00', 18),
('YU540', 2023.14, 'AUZN', 'Liam', '2024-03-14 15:55:00', '1984-05-03 00:00:00', '2024-09-25 12:00:00', 22),
('PO231', 74.98, 'SUIR', 'Emma', '2024-08-05 06:50:00', '1991-10-14 00:00:00', '2024-09-14 16:45:00', 4),
('KI653', 4507.3, 'GERM', 'Noah', '2024-02-18 10:30:00', '1982-03-21 00:00:00', '2024-09-21 19:30:00', 27),
('WE842', 159.0, 'JAPA', 'Hana', '2024-07-03 13:10:00', '1993-08-07 00:00:00', '2024-09-08 14:00:00', 8),
('AS902', 8324.6, 'INDA', 'Rahul', '2024-06-01 12:00:00', '1981-06-09 00:00:00', '2024-09-16 10:15:00', 35),
('DF346', 2376.1, 'CHIA', 'Mei', '2024-05-16 14:45:00', '1990-11-30 00:00:00', '2024-09-23 18:00:00', 14),
('TG748', 69.5, 'SOUT', 'Jabu', '2024-08-09 08:40:00', '1989-04-12 00:00:00', '2024-09-10 09:45:00', 6),
('UX134', 123.7, 'CANR', 'Sophie', '2024-09-03 11:35:00', '1994-02-26 00:00:00', '2024-09-11 11:30:00', 3),
('QA659', 281.0, 'ITAA', 'Marco', '2024-04-10 09:00:00', '1987-09-27 00:00:00', '2024-09-17 13:00:00', 10),
('BN789', 530.9, 'BRZA', 'Lucas', '2024-06-25 15:10:00', '1985-08-16 00:00:00', '2024-09-19 08:00:00', 15),
('HY456', 4002.4, 'MEXI', 'Carlos', '2024-02-08 16:50:00', '1983-07-11 00:00:00', '2024-09-24 20:30:00', 28),
('OP123', 798.6, 'EGYP', 'Layla', '2024-03-29 07:05:00', '1992-10-22 00:00:00', '2024-09-15 10:45:00', 11);

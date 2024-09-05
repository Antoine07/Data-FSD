CREATE DATABASE IF NOT EXISTS `db_aviation`
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_aviation;

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `comp` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_street` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pilots`;
CREATE TABLE `pilots` (
  `certificate` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bonus` smallint(5) unsigned DEFAULT NULL,
  `num_flying` decimal(7,1) DEFAULT NULL,
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plane` enum('A380','A320','A340') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `next_flight` datetime DEFAULT NULL,
  `num_jobs` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`certificate`),
  KEY `fk_pilots_company` (`company`),
  CONSTRAINT `fk_pilots_company` FOREIGN KEY (`company`) REFERENCES `companies` (`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT '1980-01-01',
  `company` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profit` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Ajouter les entrées manquantes dans `companies`
INSERT INTO `companies` (`comp`, `street`, `city`, `name`, `num_street`) VALUES
('DAIR', 'Sunset Blvd', 'San Francisco', 'Airline D', 321),
('EAIR', 'Broadway', 'New York', 'Airline E', 654),
('FAIR', 'Market St', 'San Francisco', 'Airline F', 987),
('AAIR', 'Ocean Ave', 'Los Angeles', 'Airline A', 123),
('BAIR', 'Elm St', 'Chicago', 'Airline B', 456),
('CAIR', 'Pine St', 'Houston', 'Airline C', 789);

INSERT INTO `pilots` (`certificate`, `bonus`, `num_flying`, `company`, `name`, `last_name`, `plane`, `birth_day`, `next_flight`, `num_jobs`) VALUES
('P00005', 2500, 410.0, 'DAIR', 'Charlie', 'Davis', 'A320', '1982-03-11 00:00:00', '2024-09-15 12:00:00', 165),
('P00006', 3000, 600.3, 'EAIR', 'Emily', 'Clark', 'A380', '1978-09-23 00:00:00', '2024-09-16 16:30:00', 200),
('P00007', 1600, 180.0, 'FAIR', 'Frank', 'Wilson', 'A340', '1990-12-05 00:00:00', '2024-09-17 13:00:00', 60),
('P00008', 2800, 540.8, 'AAIR', 'Grace', 'Lee', 'A320', '1987-06-17 00:00:00', '2024-09-18 08:45:00', 190),
('P00009', 1700, 220.5, 'BAIR', 'Hank', 'Miller', 'A380', '1983-08-30 00:00:00', '2024-09-19 14:15:00', 105),
('P00010', 2400, 330.7, 'CAIR', 'Ivy', 'Anderson', 'A340', '1992-04-22 00:00:00', '2024-09-20 10:00:00', 140),
('P00011', 2600, 470.4, 'DAIR', 'Jack', 'Thompson', 'A320', '1975-11-05 00:00:00', '2024-09-21 11:30:00', 185),
('P00012', 1900, 150.2, 'EAIR', 'Karen', 'Martinez', 'A340', '1991-02-14 00:00:00', '2023-09-22 15:00:00', 85);

INSERT INTO `sales` (`created_at`, `company`, `profit`) VALUES
('2024-07-01', 'DAIR', 130000.00),
('2024-08-15', 'EAIR', 115000.50),
('2024-09-05', 'FAIR', 98000.00),
('2024-10-10', 'AAIR', 140000.75),
('2024-11-25', 'BAIR', 97000.00),
('2024-12-15', 'CAIR', 125000.00),
('2024-01-20', 'DAIR', 123000.00),
('2024-02-25', 'EAIR', 134000.50),
('2024-03-10', 'FAIR', 102000.00),
('2024-04-18', 'AAIR', 160000.75),
('2024-05-29', 'BAIR', 108000.00),
('2024-06-20', 'CAIR', 120000.00),
('2024-07-12', 'DAIR', 127000.00),
('2024-08-22', 'EAIR', 119000.50),
('2024-09-18', 'FAIR', 103000.00),
('2024-10-25', 'AAIR', 135000.75),
('2024-11-30', 'BAIR', 95000.00),
('2024-12-25', 'CAIR', 121000.00);

-- Ajout de la colonne JSON `extra_info`
ALTER TABLE pilots
ADD COLUMN extra_info JSON DEFAULT NULL;

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('landing', 'takeoff'), 'languages', JSON_ARRAY('English', 'Spanish'))
WHERE certificate = 'P00005';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('navigation', 'communication'), 'languages', JSON_ARRAY('English', 'French'))
WHERE certificate = 'P00006';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('maintenance'), 'languages', JSON_ARRAY('English', 'German'))
WHERE certificate = 'P00007';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('takeoff', 'safety procedures'), 'languages', JSON_ARRAY('English', 'Italian'))
WHERE certificate = 'P00008';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('navigation', 'emergency landing'), 'languages', JSON_ARRAY('English', 'Portuguese'))
WHERE certificate = 'P00009';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('instrument landing system', 'weather navigation'), 'languages', JSON_ARRAY('English', 'Spanish'))
WHERE certificate = 'P00010';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('autopilot', 'engine management'), 'languages', JSON_ARRAY('English', 'French'))
WHERE certificate = 'P00011';

UPDATE pilots
SET extra_info = JSON_OBJECT('skills', JSON_ARRAY('manual navigation', 'fuel management'), 'languages', JSON_ARRAY('English', 'Italian'))
WHERE certificate = 'P00012';

INSERT INTO pilots (certificate, bonus, num_flying, company, name, last_name, plane, birth_day, next_flight, num_jobs, extra_info) VALUES
('P00013', 2500, 420.0, 'DAIR', 'Leo', 'Baker', 'A320', '1981-01-10 00:00:00', '2024-09-23 14:00:00', 170, '{"skills": ["takeoff", "landing"], "languages": ["English", "Spanish"]}'),
('P00014', 3100, 650.7, 'EAIR', 'Olivia', 'Garcia', 'A380', '1980-07-28 00:00:00', '2024-09-24 18:00:00', 205, '{"skills": ["navigation", "communication"], "languages": ["English", "French"]}'),
('P00015', 1800, 200.1, 'FAIR', 'Liam', 'Martinez', 'A340', '1985-11-30 00:00:00', '2024-09-25 08:00:00', 75, '{"skills": ["maintenance", "safety procedures"], "languages": ["English", "German"]}');


--- ajout de données 

INSERT INTO pilots (certificate, bonus, num_flying, company, name, last_name, plane, birth_day, next_flight, num_jobs, extra_info) VALUES
('P00016', 1500, 300.0, NULL, 'John', 'Doe', 'A320', '1983-05-21 00:00:00', '2024-09-27 12:00:00', 80, '{"skills": ["landing", "takeoff"], "languages": ["English"]}'),
('P00017', 1800, 250.4, NULL, 'Jane', 'Smith', 'A340', '1990-11-14 00:00:00', '2024-09-28 09:30:00', 95, '{"skills": ["navigation", "emergency procedures"], "languages": ["French", "English"]}');

INSERT INTO companies (comp, street, city, name, num_street) VALUES
('ZAIR', 'High St', 'Dallas', 'Airline Z', 222),
('YAIR', 'Main St', 'Miami', 'Airline Y', 333);
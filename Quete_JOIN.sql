CREATE DATABASE Relations_Humains_Martiens

USE Relations_Humains_Martiens;

CREATE TABLE base (
base_id INT PRIMARY KEY IDENTITY(1, 1),
nom VARCHAR(50) NOT NULL
);

CREATE TABLE continent (
continent_id INT PRIMARY KEY IDENTITY(1, 1),
nom VARCHAR(50) NOT NULL
);

CREATE TABLE terrien (
terrien_id INT PRIMARY KEY IDENTITY(1, 1),
nom VARCHAR(50) NOT NULL,
FK_continent_id INT NOT NULL,
FOREIGN KEY(FK_continent_id) REFERENCES continent(continent_id)
);

CREATE TABLE martien (
martien_id INT PRIMARY KEY IDENTITY(1, 1),
nom VARCHAR(50) NOT NULL,
FK_terrien_id INT NOT NULL,
FOREIGN KEY(FK_terrien_id) REFERENCES terrien(terrien_id),
FK_base_id INT NOT NULL,
FOREIGN KEY(FK_base_id) REFERENCES base(base_id),
FK_superior_id INT NOT NULL,
FOREIGN KEY(FK_superior_id) REFERENCES martien(martien_id)
);

INSERT INTO base(nom) VALUES
	('base 1'),
	('base 2');

SELECT * FROM base;

INSERT INTO continent(nom) VALUES
	('Afrique'),
	('Amérique'),
	('Europe');

SELECT * FROM continent;

INSERT INTO terrien(nom, FK_continent_id) VALUES
	('George', 1),
	('Michel', 2),
	('Toto', 2),
	('Sebou', 3),
	('Coco', 3);

SELECT * FROM terrien;

INSERT INTO martien(nom, FK_base_id, FK_superior_id, FK_terrien_id) VALUES
	('Empereur', 1, 1, 3),
	('Gloup', 1, 2, 2),
	('Glap', 2, 2, 4),
	('Glip', 2, 3, 5),
	('Glep', 2, 3, 1);

SELECT * FROM martien;

SELECT m.nom AS "nom du martien", t.nom AS "nom du référent terrien", c.nom AS "continent de référence du terrien", b.nom "base du martien"
FROM martien AS m
	INNER JOIN terrien AS t
	ON m.FK_terrien_id = t.terrien_id 
	INNER JOIN continent AS c
	ON t.FK_continent_id = c.continent_id
	INNER JOIN base AS b
	ON m.FK_base_id = b.base_id;
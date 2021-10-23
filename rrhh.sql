/* Ejercicio 1 */

CREATE DATABASE IF NOT EXISTS RecursosHumanos;

USE RecursosHumanos;

DROP TABLE IF EXISTS Realiza;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Curso;

CREATE TABLE Empleado (
  id		INT		NOT NULL	AUTO_INCREMENT,
  nombre	VARCHAR(20)	NOT NULL,
  apellido 	VARCHAR(30)	NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Curso (
  codigo	CHAR(7)		NOT NULL,
  nombre	VARCHAR(30)	NOT NULL,
  tipo 		VARCHAR(7)	NOT NULL	DEFAULT 'interno',
  PRIMARY KEY (codigo)
);

CREATE TABLE Realiza (
  id		INT		NOT NULL,
  codigo	CHAR(7)		NOT NULL,
  PRIMARY KEY (id, codigo),
  FOREIGN KEY (id) REFERENCES Empleado(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (codigo) REFERENCES Curso(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Ejercicio 2 */

ALTER TABLE Empleado
ADD ingreso DATE,
MODIFY nombre VARCHAR(30) NOT NULL;

/* Ejercicio 3 */

CREATE INDEX apellido_index on Empleado(apellido);

/* Ejercicio 4 */

INSERT INTO Empleado (nombre, apellido, id, ingreso) VALUES ('Clara', 'Toledo', DEFAULT, '1998-03-02');
INSERT INTO Empleado VALUES (DEFAULT, 'Roberto', 'Ocampo', '2002-10-07');
INSERT INTO Empleado (nombre, apellido, ingreso) VALUES ('Jose', 'Ruiz', '2007-08-06');
INSERT INTO Empleado (nombre, apellido, ingreso) VALUES ('Ana', 'Moreti', '2020-03-02');

INSERT INTO Curso VALUES ('S-123-1', 'Prevención COVID', DEFAULT);
INSERT INTO Curso (codigo, nombre) VALUES ('S-100-3', 'Primeros Auxilios');
INSERT INTO Curso VALUES ('S-150-2', 'Marketing Digital', 'externo');

INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Clara' AND apellido='Toledo'), 'S-123-1');
INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Clara' AND apellido='Toledo'), 'S-100-3');
INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Clara' AND apellido='Toledo'), 'S-150-2');

INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Roberto' AND apellido='Ocampo'), 'S-100-3');


INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Jose' AND apellido='Ruiz'), 'S-100-3');
INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Jose' AND apellido='Ruiz'), 'S-123-1');

INSERT INTO Realiza VALUES ((SELECT id FROM Empleado WHERE nombre='Ana' AND apellido='Moreti'), (SELECT codigo FROM Curso WHERE nombre='Prevención COVID'));




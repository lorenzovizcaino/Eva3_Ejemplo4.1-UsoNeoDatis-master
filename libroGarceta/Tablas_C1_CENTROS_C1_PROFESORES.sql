/* *****************************************************
// ****** C1_CENTROS, C1_PROFESORES, C1_ESPECIALIDAD, C1_ASIGNATURAS, C1_ASIGPROF
// *******************************************************
// MYSQL
*/

SET SESSION FOREIGN_KEY_CHECKS=0;

/* Create Tables */

CREATE TABLE C1_ASIGNATURAS
(
	COD_ASIG CHAR(6) NOT NULL,
	NOMBRE_ASI VARCHAR(30),
	PRIMARY KEY (COD_ASIG)
);


CREATE TABLE C1_ASIGPROF
(
	COD_ASIG CHAR(6) NOT NULL,
	COD_PROF NUMERIC(4) NOT NULL
);


CREATE TABLE C1_CENTROS
(
	COD_CENTRO NUMERIC(4) NOT NULL,
	NOM_CENTRO VARCHAR(20),
	DIRECTOR NUMERIC(4),
	DIRECCION VARCHAR(25),
	LOCALIDAD VARCHAR(20),
	PROVINCIA VARCHAR(20),
	PRIMARY KEY (COD_CENTRO)
);



CREATE TABLE C1_PROFESORES
(
	COD_PROF NUMERIC(4) NOT NULL,
	NOMBRE_APE VARCHAR(30),
	NOMBRE_ESPE VARCHAR(20),
	FECHA_NAC DATE,
	SEXO CHAR(1),
	COD_CENTRO NUMERIC(4) NOT NULL,
	PRIMARY KEY (COD_PROF)
);



/* Create Foreign Keys */

ALTER TABLE C1_ASIGPROF
	ADD FOREIGN KEY (COD_ASIG)
	REFERENCES C1_ASIGNATURAS (COD_ASIG)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;
ALTER TABLE C1_centros
	ADD FOREIGN KEY (DIRECTOR)
	REFERENCES C1_PROFESORES (COD_PROF)
	ON DELETE RESTRICT
	ON UPDATE RESTRICT
;


ALTER TABLE C1_PROFESORES
	ADD FOREIGN KEY (COD_CENTRO)
	REFERENCES C1_CENTROS (COD_CENTRO)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



ALTER TABLE C1_ASIGPROF
	ADD FOREIGN KEY (COD_PROF)
	REFERENCES C1_PROFESORES (COD_PROF)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


INSERT INTO C1_CENTROS VALUES (1000,'IES El Quijote', 1000,
'Avda. Los Molinos 25', 'GUADALAJARA', 'GUADALAJARA');

INSERT INTO C1_CENTROS VALUES (1015,'CP Los Danzantes', 1010,
'C/Las Musas s/n','PASTRANA', 'GUADALAJARA');

INSERT INTO C1_CENTROS VALUES (1022, 'IES Planeta Tierra',2000, 
 'C/Mina 45', 'AZUQUECA', 'GUADALAJARA');

INSERT INTO C1_CENTROS VALUES (1045, 'CP Manuel Hidalgo', NULL, 
  'C/Granada 5', 'GUADALAJARA', 'GUADALAJARA');

INSERT INTO C1_CENTROS VALUES (1050, 'IES Anto�ete', NULL,
  'C/Los Toreros 21', 'SIGUENZA', 'GUADALAJARA');


INSERT INTO C1_PROFESORES VALUES (1000, 
'Mart�nez Salas, Fernando', 'INFORM�TICA',  '1961-09-07', 'H', 1000);

INSERT INTO C1_PROFESORES VALUES (1001, 
'Bueno Zarco, Elisa', 'INFORM�TICA', '1960-02-17', 'M', 1000);

INSERT INTO C1_PROFESORES VALUES (2002, 
'Rivera Silvestre, Ana','DIBUJO', '1950-10-10', 'M',1000);

INSERT INTO C1_PROFESORES VALUES (3000,  
'De Lucas Fdez, M.Angel','DIBUJO', '1980-09-09','M',1000);


INSERT INTO C1_PROFESORES VALUES (1010, 
'Montes Garc�a, M.Pilar', 'MATEM�TICAS', '1970-10-10', 'M', 1015);

INSERT INTO C1_PROFESORES VALUES (1011, 
'Arroba Conde, Manuel', 'MATEM�TICAS', '1970-10-12', 'H', 1015);

INSERT INTO C1_PROFESORES VALUES (1022, 
'Ruiz Lafuente, Manuel','MATEM�TICAS', '1966-11-11', 'H',1015);


INSERT INTO C1_PROFESORES VALUES (2000, 
'Ramos Ruiz, Luis','LENGUA', '1963-08-08', 'H',1022 );

INSERT INTO C1_PROFESORES VALUES (2003, 
'Segura Molina, Irene','LENGUA', '1963-07-08', 'M',1022 );

INSERT INTO C1_PROFESORES VALUES (1045, 
'Serrano Lagu�a, Mar�a','INFORM�TICA','1976-01-02', 'M', 1022);



insert into C1_ASIGNATURAS VALUES ('IF0001','DAHC');
insert into C1_ASIGNATURAS VALUES ('IF0002','RAL');
insert into C1_ASIGNATURAS VALUES ('IF0003','IMSI');
insert into C1_ASIGNATURAS VALUES ('IF0004','DPEG');
insert into C1_ASIGNATURAS VALUES ('IF0006','PLE');
insert into C1_ASIGNATURAS VALUES ('IF0007','FPE');

insert into C1_ASIGNATURAS VALUES ('LG0001','Lengua 1 ESO');
insert into C1_ASIGNATURAS VALUES ('LG0002','Lengua 2 ESO');
insert into C1_ASIGNATURAS VALUES ('LG0003','Lengua 3 ESO');
insert into C1_ASIGNATURAS VALUES ('LG0004','Lengua 4 ESO');

insert into C1_ASIGNATURAS VALUES ('DB0001','Pl�stica');
insert into C1_ASIGNATURAS VALUES ('DB0002','Taller cer�mica');
insert into C1_ASIGNATURAS VALUES ('DB0003','Dibujo T�cnico');

insert into C1_ASIGNATURAS VALUES ('MT0001','Matem�ticas 1 BAC');
insert into C1_ASIGNATURAS VALUES ('MT0002','Matem�ticas 2 BAC');


insert into C1_ASIGPROF VALUES ('IF0002',1001);
insert into C1_ASIGPROF VALUES ('IF0003',1001);
insert into C1_ASIGPROF VALUES ('IF0001',1000);

insert into C1_ASIGPROF VALUES ('LG0001',2000);
insert into C1_ASIGPROF VALUES ('LG0002',2000);
insert into C1_ASIGPROF VALUES ('LG0003',2003);
insert into C1_ASIGPROF VALUES ('LG0004',2003);

insert into C1_ASIGPROF VALUES ('DB0001',2002);
insert into C1_ASIGPROF VALUES ('DB0002',2002);
insert into C1_ASIGPROF VALUES ('DB0003',3000);

insert into C1_ASIGPROF VALUES ('MT0001',1010);
insert into C1_ASIGPROF VALUES ('MT0001',1011);
insert into C1_ASIGPROF VALUES ('MT0001',1022);
insert into C1_ASIGPROF VALUES ('MT0002',1010);






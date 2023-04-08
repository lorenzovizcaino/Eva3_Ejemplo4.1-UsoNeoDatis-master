
---------------------------------------------------
drop type EMPLEADO_T;

CREATE TYPE EMPLEADO_T AS OBJECT (
  NOMBRE     VARCHAR2(30),
  JEFE       REF EMPLEADO_T
);
/
drop table EMPLEADO;
CREATE TABLE EMPLEADO OF EMPLEADO_T;

INSERT INTO EMPLEADO VALUES 
  (EMPLEADO_T ('GIL', NULL));

select * from EMPLEADO;
INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('ARROYO', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'GIL';

--no inserta nada, SANCHEZ NO EXISTE   
INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('PEREZ', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'SANCHEZ';

INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('PEREZ', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'GIL';
  
commit;
select * from EMPLEADO;
--
SELECT NOMBRE, DEREF(P.JEFE)FROM EMPLEADO P;
---
--INSERTAR OTRA FILA QUE EL JEFE APUNTE A PEREZ

INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('FERNANDEZ', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'PEREZ';
  --
INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('RAMOS', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'PEREZ';

COMMIT;

SELECT REF(P) FROM EMPLEADO P WHERE NOMBRE='GIL';


SELECT NOMBRE, DEREF(P.JEFE) FROM EMPLEADO P;
SELECT NOMBRE, DEREF(P.JEFE).nombre FROM EMPLEADO P;
SELECT NOMBRE, P.JEFE.nombre FROM EMPLEADO P;
SELECT REF(P) FROM EMPLEADO P WHERE NOMBRE='GIL';

 --
INSERT INTO EMPLEADO 
  SELECT EMPLEADO_T ('RAMOS', REF(E))
  FROM EMPLEADO E WHERE E.NOMBRE = 'PEREZ';


 --CAMBIAMOS EL JEFE DE RAMOS, LE ASIGNAMOS GIL
update empleado
  set jefe = ( select ref(e) from empleado e where nombre='GIL')
where nombre='RAMOS';

SELECT NOMBRE, P.JEFE.nombre FROM EMPLEADO P;

---ACTIVIDAD 8
---------------------FIN REFERENCISAS-
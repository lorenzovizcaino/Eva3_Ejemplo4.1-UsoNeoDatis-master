--Se define el tipo persona
--
CREATE OR REPLACE TYPE TIPO_PERSONA AS OBJECT(
  DNI VARCHAR2(10),
  NOMBRE VARCHAR2(25),
  FEC_NAC DATE,
  MEMBER FUNCTION EDAD RETURN NUMBER, 
  FINAL MEMBER FUNCTION GET_DNI 
                        RETURN VARCHAR2, -- No se puede redefinir
  MEMBER FUNCTION GET_NOMBRE RETURN VARCHAR2,
  MEMBER PROCEDURE VER_DATOS 
) NOT FINAL;  -- Se pueden derivar subtipos
/
--Cuerpo del tipo persona
--
CREATE OR REPLACE TYPE BODY TIPO_PERSONA AS
  MEMBER FUNCTION EDAD RETURN NUMBER IS
    ED NUMBER;
  BEGIN
    ED := TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(FEC_NAC, 'YYYY');
  RETURN ED;
  END;
  --
  FINAL MEMBER FUNCTION GET_DNI RETURN VARCHAR2 IS
  BEGIN
    RETURN DNI;
  END;
  --
  MEMBER FUNCTION GET_NOMBRE RETURN VARCHAR2 IS
  BEGIN
    RETURN NOMBRE;
  END;
  --
  MEMBER PROCEDURE VER_DATOS IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(DNI|| '*' || NOMBRE ||'*'||EDAD());
  END;
END;
/
--Se define el tipo alumno
--
CREATE OR REPLACE TYPE TIPO_ALUMNO UNDER TIPO_PERSONA(
                                         --se define un subtipo 
  CURSO VARCHAR2(10),
  NOTA_FINAL NUMBER,
  MEMBER FUNCTION NOTA RETURN NUMBER,
  OVERRIDING MEMBER PROCEDURE VER_DATOS  --se redefine ese m�todo
);
/
--Cuerpo del tipo alumno
--
CREATE OR REPLACE TYPE BODY  TIPO_ALUMNO AS
  MEMBER FUNCTION NOTA RETURN NUMBER IS
  BEGIN
    RETURN NOTA_FINAL;
  END;
  --
  OVERRIDING MEMBER PROCEDURE VER_DATOS IS  --se redefine ese m�todo
  BEGIN
    DBMS_OUTPUT.PUT_LINE(CURSO|| '*' ||NOTA_FINAL);
  END;
END;
/

------

DECLARE 
  --Al asignar datos al alumno escribimos
  --        DNI, NOMBRE, FECHA_NAC, CURSO, NOTA

  A1 TIPO_ALUMNO := TIPO_ALUMNO(NULL, NULL, NULL, NULL, NULL);
  A2 TIPO_ALUMNO := TIPO_ALUMNO('871234533A�, 'PEDRO',
                                '12/12/1996', 'SEGUNDO', 7);
  NOM A1.NOMBRE%TYPE;
  DNI A1.DNI%TYPE;
  NOTAF A1.NOTA_FINAL%TYPE;
BEGIN
  A1.NOTA_FINAL := 8;
  A1.CURSO := 'PRIMERO';
  A1.NOMBRE := 'JUAN';
  A1.FEC_NAC := '20/10/1997';
  A1.VER_DATOS;

  NOM := A2.GET_NOMBRE();
  DNI := A2.GET_DNI();
  NOTAF := A2.NOTA();
  A2.VER_DATOS;

  DBMS_OUTPUT.PUT_LINE(A1.EDAD());
  DBMS_OUTPUT.PUT_LINE(A2.EDAD());
END;
/
 
-----

CREATE TABLE TALUMNOS OF TIPO_ALUMNO (DNI PRIMARY KEY);

INSERT INTO TALUMNOS VALUES
      ('871234533A', 'PEDRO', '12/12/1996', 'SEGUNDO', 7);
INSERT INTO TALUMNOS VALUES
      ('809004534B', 'MANUEL', '12/12/1997', 'TERCERO', 8);

SELECT * FROM TALUMNOS;
SELECT DNI, NOMBRE, CURSO, NOTA_FINAL FROM TALUMNOS;
SELECT P.GET_DNI(), P.GET_NOMBRE(), P.EDAD(), P.NOTA() 
FROM TALUMNOS P;

----FIN HERENCIA

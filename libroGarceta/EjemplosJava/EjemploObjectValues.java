import java.math.BigDecimal;
import java.math.BigInteger;

import org.neodatis.odb.ODB;
import org.neodatis.odb.ODBFactory;
import org.neodatis.odb.ObjectValues;
import org.neodatis.odb.Values;
import org.neodatis.odb.impl.core.query.values.ValuesCriteriaQuery;

public class EjemploObjectValues {
	public static void main(String[] args) {
		ODB odb = ODBFactory.open("neodatis.test");// Abrir BD
		Values valores = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).field("nombre").field("ciudad"));
		while (valores.hasNext()) {
			ObjectValues objectValues = (ObjectValues) valores.next();
			System.out.printf("%s, Ciudad : %s %n", objectValues.getByAlias("nombre"), objectValues.getByIndex(1));
		}

		// SUMA – Obtiene la suma de las edades
		// SELECT SUM(edad) FROM Jugadores
		Values val = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).sum("edad"));
		ObjectValues ov = val.nextValues();
		BigDecimal value = (BigDecimal) ov.getByAlias("edad");
		System.out.printf("Suma de edad : %d %n", value.longValue());

		System.out.println("--------------------------------------------");
		System.out.printf("Suma de edad : %.2f %n", ov.getByAlias("edad"));

		// CUENTA – Obtiene el número de jugadores
		// SELECT COUNT(nombre) FROM Jugadores
		Values val2 = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).count("nombre"));
		ObjectValues ov2 = val2.nextValues();
		BigInteger value2 = (BigInteger) ov2.getByAlias("nombre");
		System.out.printf("Numero de jugadores : %d %n", value2.intValue());

		System.out.println("--------------------------------------------");
		// MEDIA – Obtiene la edad media de los jugadores
		// SELECT AVG(edad) FROM Jugadores
		Values val3 = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).avg("edad"));
		ObjectValues ov3 = val3.nextValues();
		BigDecimal value3 = (BigDecimal) ov3.getByAlias("edad");
		System.out.printf("Edad media : %.2f %n", value3.floatValue());

		System.out.println("--------------------------------------------");
		// MAXIMO Y MINIMO – Obtiene la edad máxima y la edad mínima
		// SELECT MAX(edad) edad_max , MIN(edad) edad_min FROM Jugadores
		Values val4 = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).max("edad", "edad_max"));
		ObjectValues ov4 = val4.nextValues();
		BigDecimal maxima = (BigDecimal) ov4.getByAlias("edad_max");

		Values val5 = odb.getValues(new ValuesCriteriaQuery(Jugadores.class).min("edad", "edad_min"));
		ObjectValues ov5 = val5.nextValues();

		BigDecimal minima = (BigDecimal) ov5.getByAlias("edad_min");
		System.out.printf("Edad máxima: %d, Edad mínima: %d %n", maxima.intValue(), minima.intValue());

		// GROUP BY
		Values groupby = odb
				.getValues(new ValuesCriteriaQuery(Jugadores.class).field("ciudad").count("nombre").groupBy("ciudad"));

		while (groupby.hasNext()) {
			ObjectValues objetos = (ObjectValues) groupby.next();
			System.out.printf("%s, %d%n", objetos.getByAlias("ciudad"), objetos.getByIndex(1));
		}

		//
		
		

		odb.close();

	}

}

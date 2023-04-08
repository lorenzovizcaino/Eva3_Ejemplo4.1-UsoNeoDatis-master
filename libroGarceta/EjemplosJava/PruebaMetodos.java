import org.neodatis.odb.ODB;
import org.neodatis.odb.ODBFactory;
import org.neodatis.odb.Objects;
import org.neodatis.odb.core.query.IQuery;
import org.neodatis.odb.core.query.criteria.And;
import org.neodatis.odb.core.query.criteria.ICriterion;
import org.neodatis.odb.core.query.criteria.Or;
import org.neodatis.odb.core.query.criteria.Where;
import org.neodatis.odb.impl.core.query.criteria.CriteriaQuery;

import clases.Jugadores;

public class PruebaMetodos {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		jugadores14irlandafranciaitalia();
		System.out.println("------------------------------------------------");
		actualizaredadjugadoresdepais("FRANCIA");

	}

	private static void actualizaredadjugadoresdepais(String pais) {
		ODB odb = ODBFactory.open("EQUIPOS.DB");
		ICriterion crit = Where.equal("pais.nombrepais", pais);
		IQuery query = new CriteriaQuery(Jugadores.class, crit);
		Objects jugadores = odb.getObjects(query);
		if (jugadores.size() == 0) {
			System.out.printf(" No existen Jugadores de %s, no se actualiza la edad %n", pais);
		} else {
			Jugadores jug;
			System.out.printf("ACTUALIZAMOS LA EDAD DE LOS JUGADORES DE %s%n", pais);
			while (jugadores.hasNext()) {
				jug = (Jugadores) jugadores.next();
				int edad = jug.getEdad() + 2;
				System.out.printf("%s %d, NUEVA: %d %n", jug.getNombre(), jug.getEdad(), edad);
				jug.setEdad(edad);
				odb.store(jug);
			}
			odb.commit();
		}
		odb.close();
	}

	private static void jugadores14irlandafranciaitalia() {
		ODB odb = ODBFactory.open("EQUIPOS.DB");
		ICriterion criterio = new And().add(Where.equal("edad", 14))
				.add(new Or().add(Where.equal("pais.nombrepais", "IRLANDA"))
						.add(Where.equal("pais.nombrepais", "ITALIA")).add(Where.equal("pais.nombrepais", "FRANCIA")));
		IQuery query = new CriteriaQuery(Jugadores.class, criterio);
		Objects jugadores = odb.getObjects(query);
		if (jugadores.size() == 0) {
			System.out.println(" No existen jugadores de 14 años de  IRLANDA, ITALIA, FRANCIA.");
		} else {
			Jugadores jug;
			System.out.println("Jugadores de 14 años de IRLANDA, ITALIA, FRANCIA.");
			while (jugadores.hasNext()) {
				jug = (Jugadores) jugadores.next();
				System.out.printf("Nombre: %s, Edad: %d, Ciudad: %s, Pais: %s%n", jug.getNombre(), jug.getEdad(),
						jug.getCiudad(), jug.getPais().getNombrepais());
			}
		}
		odb.close();
	}

}

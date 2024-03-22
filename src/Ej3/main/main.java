package main;


import Clases.CaballeroBuilder;
import Clases.ClaseBuilder;
import Clases.LadronBuilder;
import Clases.MagoBuilder;
import Clases.RangerBuilder;
import Razas.Director;
import Razas.OrcoBuilder;
import Razas.PersonajeBuilder;

class Main {

	static void TestDrive(){
		String name = "LeroyJenkins";
		/*Clases*/
		ClaseBuilder[] clases = {new CaballeroBuilder(),new LadronBuilder(),new MagoBuilder(),new RangerBuilder()};

		/*Orco */
		for(ClaseBuilder cb: clases){
			PersonajeBuilder personajeBuilder = new OrcoBuilder(cb);
			Director dir = new Director(personajeBuilder);
			dir.crearPersonaje(name);
			dir.mostrarPersonaje();
		}
	}

	public static void main(String[] args) {
		TestDrive();
		Fachada fac = Fachada.getInstancia();

		 fac.crearPersonaje();

	}

}

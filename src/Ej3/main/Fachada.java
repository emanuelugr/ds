package main;

import Clases.CaballeroBuilder;
import Clases.ClaseBuilder;
import Clases.LadronBuilder;
import Clases.MagoBuilder;
import Clases.RangerBuilder;
import Razas.Director;
import Razas.ElfoBuilder;
import Razas.EnanoBuilder;
import Razas.HumanoBuilder;
import Razas.OrcoBuilder;
import Razas.PersonajeBuilder;

public class Fachada {
	private static Fachada instancia;

	Menu menu;
	Director director;

	private Fachada(){
		menu = Menu.getInstancia();
	}

	public static Fachada getInstancia(){
		if (instancia == null){
			instancia = new Fachada();
		}

		return instancia;
	} 
	
	public void crearPersonaje(){
		String nombre = menu.preguntarNombre();
		int raza = menu.preguntarRaza();
		int clase = menu.preguntarClase();

		PersonajeBuilder constructorPersonaje;
		ClaseBuilder constructorClase;

		System.out.println("Inicializando Clase...");
		switch (clase){
			case (1):
				constructorClase = new CaballeroBuilder();
				break;
			case (2):
				constructorClase = new RangerBuilder();
				break;
			case (3):
				constructorClase = new MagoBuilder();
				break;
			case (4):
				constructorClase = new LadronBuilder();
				break;
			default:
				constructorClase = new CaballeroBuilder();
				break;				
		}


		System.out.println("Inicializando Clase...");
		switch (raza){
			case (1):
				constructorPersonaje = new HumanoBuilder(constructorClase);
				break;
			case (2):
				constructorPersonaje = new ElfoBuilder(constructorClase);
				break;
			case (3):
				constructorPersonaje = new EnanoBuilder(constructorClase);
				break;
			case (4):
				constructorPersonaje = new OrcoBuilder(constructorClase);
				break;
			default:
				constructorPersonaje = new HumanoBuilder(constructorClase);
				break;				
		}

	
		
		director = new Director(constructorPersonaje);
		System.out.println("Creando personaje...");
		director.crearPersonaje(nombre);
		director.mostrarPersonaje();

	}

}

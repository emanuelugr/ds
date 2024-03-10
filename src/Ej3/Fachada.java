
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

		creaRaza constructorRaza;
		creaClase constructorClase;

		switch (raza){
			case (1):
				constructorRaza = new creaHumano();
				break;
			case (2):
				constructorRaza = new creaElfo();
				break;
			case (3):
				constructorRaza = new creaEnano();
				break;
			case (4):
				constructorRaza = new creaOrco();
				break;
			default:
				constructorRaza = new creaHumano();
				break;				
		}

		switch (clase){
			case (1):
				constructorClase = new creaCaballero();
				break;
			case (2):
				constructorClase = new creaRanger();
				break;
			case (3):
				constructorClase = new creaMago();
				break;
			case (4):
				constructorClase = new creaLadron();
				break;
			default:
				constructorClase = new creaCaballero();
				break;				
		}

		director = new Director(constructorRaza,constructorClase);
		director.crearPersonaje(nombre);

		director.mostrarPersonaje();

	}

}


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
		int clase = menu.preguntarClase();

		creaPersonajes constructor;

		switch (clase){
			case (1):
				constructor = new creaCaballero();
				break;
			default:
				constructor = new creaCaballero();
				break;				
		}

		director = new Director(constructor);
		director.crearPersonaje(nombre);

		director.mostrarPersonaje();

	}

}

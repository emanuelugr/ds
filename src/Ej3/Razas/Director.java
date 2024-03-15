package Razas;

public class Director{
	private Personaje personaje;
	private PersonajeBuilder personajeBuilder;

	public Director(PersonajeBuilder personajeBuilder){
		this.personajeBuilder = personajeBuilder;
	}

	public void crearPersonaje(String nombre){
		personajeBuilder.CrearPersonaje();
		personaje = personajeBuilder.GetPersonaje();
		personaje.SetName(nombre);
	}

	public void mostrarPersonaje(){
		personaje.mostrarPersonaje();
	}

	public Personaje GetPersonaje(){
		return personaje;
	}

}
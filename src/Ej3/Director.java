

public class Director{
	private creaPersonajes CP;

	public Director(creaPersonajes cp){
		this.CP = cp;
	}

	public void crearPersonaje(String nombre){
		CP.asignarTitulo(nombre);

		CP.asignarVida();
		CP.asignarEstamina();
		CP.asignarMana();
		
		CP.asignarFuerza();
		CP.asignarDestreza();
		CP.asignarResistencia();
		CP.asignarInteligencia();
		CP.asignarSabiduria();
		CP.asignarCarisma();
		
		CP.asignarPersuasion();
		CP.asignarAgilidad();
		CP.asignarIntimidacion();
	}

	public void mostrarPersonaje(){
		creaPersonajes.pers.mostrarPersonaje();
	}

}
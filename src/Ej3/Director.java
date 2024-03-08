

public class Director{
	private creaPersonajes CP;

	public Director(creaPersonajes cp){
		this.CP = cp;
	}

	public void crearPersonaje(){
		CP.asignarClase();

		CP.asignarVida();
		CP.asignarEstamina();
		CP.asignarMana();
		
		CP.asignarFuerza();
		CP.asignarDestreza();
		CP.asignarResistencia();
		CP.asignarInteligencia();
		CP.asignarSabiduria();
		CP.asignarCarisma();
		
		CP.asignarArmadura();
		CP.asignarEquipamiento();
		CP.aisgnarHechizos();
		CP.asignarHabilidades();

		CP.asignarOro();
		CP.asignarKarma();
	}

	public void mostrarPersonaje(){
		creaPersonajes.pers.mostrarPersonaje();
	}

}

public class Personaje{
	protected String nombre, raza, clase;
	protected int fuerza, destreza, resistencia, inteligencia, sabiduria, carisma, percepcion;
	protected int vida, estamina, mana, persuasion, agilidad, intimidacion, critico, punteria;

	public Personaje(String nom){

		this.nombre = nom;
		this.raza = "";
		this.clase = "";

		this.fuerza = 0;
		this.destreza = 0;
		this.resistencia = 0;
		this.inteligencia = 0;
		this.sabiduria = 0;
		this.carisma = 0;
		this.percepcion = 0;

		this.vida = 0;
		this.estamina = 0;
		this.mana = 0;
		this.persuasion = 0;
		this.agilidad = 0;
		this.intimidacion = 0;
		this.critico = 0;
		this.punteria = 0;
	}

	public void mostrarPersonaje(){
		System.out.println("\nPersonaje: " + this.nombre + ", " +this.clase+" "+this.raza+ "\n\n"
			+ "-- Atributos primarios: \n"
			+ "----- Fuerza: " + this.fuerza + "\n"
			+ "----- Destreza: " + this.destreza + "\n"
			+ "----- Resistencia: " + this.resistencia + "\n"
			+ "----- Inteligencia: " + this.inteligencia + "\n"
			+ "----- Sabiduria: " + this.sabiduria + "\n"
			+ "----- Carisma: " + this.carisma + "\n"
			+ "----- Percepcion " + this.percepcion + "\n\n"
			+ "-- Atributos secundarios: \n"
			+ "----- Vida: " + this.vida + "\n"
			+ "----- Estamina: " + this.estamina + "\n"
			+ "----- Mana: " + this.mana + "\n"
			+ "----- Persuasion: " + this.persuasion + "\n"
			+ "----- Agilidad: " + this.agilidad + "\n"
			+ "----- Intimidacion: " + this.intimidacion + "\n"
			+ "----- Critico: " + this.critico + "\n"
			+ "----- Punteria: " + this.punteria + "\n"
			);
	}

}
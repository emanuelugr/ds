
public class Personaje{
	protected String nombre, raza, clase;
	protected int fuerza, destreza, resistencia, inteligencia, sabiduria, carisma;
	protected int vida, estamina, mana, persuasion, agilidad, intimidacion;

	public Personaje(){
		this.vida = 0;
		this.estamina = 0;
		this.mana = 0;

		this.fuerza = 0;
		this.destreza = 0;
		this.resistencia = 0;
		this.inteligencia = 0;
		this.sabiduria = 0;
		this.carisma = 0;

		this.persuasion = 0;
		this.agilidad = 0;
		this.intimidacion = 0;
	}

	public void mostrarPersonaje(){
		System.out.printf("Personaje: " + this.clase + " \n"
			+ "Vida: " + this.vida + "\n"
			+ "Estamina: " + this.estamina + "\n"
			+ "Mana: " + this.mana + "\n"
			+ "Fuerza: " + this.fuerza + "\n"
			+ "Destreza: " + this.destreza + "\n"
			+ "Resistencia: " + this.resistencia + "\n"
			+ "Inteligencia: " + this.inteligencia + "\n"
			+ "Sabiduria: " + this.sabiduria + "\n"
			+ "Carisma: " + this.carisma + "\n"
			+ "Persuasion: " + this.persuasion + "\n"
			+ "Agilidad: " + this.agilidad + "\n"
			+ "Intimidacion: " + this.intimidacion + "\n"
			);
	}

}

public class Personaje{
	protected String clase;
	protected int vida, estamina, mana;
	protected int fuerza, destreza, resistencia, inteligencia, sabiduria, carisma;
	protected String armadura, equipamiento, hechizos, habilidades;
	protected int oro, karma;

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

		this.armadura = "";
		this.equipamiento = "";
		this.hechizos = "";
		this.habilidades = "";

		this.oro = 0;
		this.karma = 0;
	}

	public void mostrarPersonaje(){
		System.out.printf("Personaje de clase: " + this.clase + ": \n"
			+ "Vida: " + this.vida + "\n"
			+ "Estamina: " + this.estamina + "\n"
			+ "Mana: " + this.mana + "\n"
			+ "Fuerza: " + this.fuerza + "\n"
			+ "Destreza: " + this.destreza + "\n"
			+ "Resistencia: " + this.resistencia + "\n"
			+ "Inteligencia: " + this.inteligencia + "\n"
			+ "Sabiduria: " + this.sabiduria + "\n"
			+ "Carisma: " + this.carisma + "\n"
			+ "Armadura: " + this.armadura + "\n"
			+ "Equipamiento: " + this.equipamiento + "\n"
			+ "Hechizos: " + this.hechizos + "\n"
			+ "Habilidades: " + this.habilidades + "\n"
			+ "Oro: " + this.oro + "\n"
			+ "Karma: " + this.karma + "\n"
			);
	}

}
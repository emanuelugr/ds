package Razas;

import java.util.HashMap;
import java.util.Map;

public class Personaje {
	protected String nombre, raza, clase;

	/* */
	private HashMap<String, Integer> primaryAttr;
	private HashMap<String, Integer> secondaryAttr;

	public Personaje() {
		primaryAttr = new HashMap<>();
		secondaryAttr = new HashMap<>();
	}

	public Personaje(String nom) {

		this.nombre = nom;
		this.raza = "";
		this.clase = "";
	}

	public HashMap<String, Integer> GetPrimary() {
		return primaryAttr;
	}

	public HashMap<String, Integer> GetSecondary() {
		return secondaryAttr;
	}

	public void SetPrimaryAttributes(HashMap<String, Integer> attr) {
		primaryAttr = attr;
	}

	public void SetSecondaryAttributes(HashMap<String, Integer> attr) {
		secondaryAttr = attr;
	}

	public void mostrarPersonaje() {
		System.out.println("\nPersonaje: " + nombre + ", " + this.clase + " " + this.raza + "\n\n"
				+ "-- Atributos primarios: \n"
				+ "----- Fuerza: " + this.primaryAttr.get("Fuerza") + "\n"
				+ "----- Destreza: " + this.primaryAttr.get("Destreza") + "\n"
				+ "----- Resistencia: " + this.primaryAttr.get("Resistencia") + "\n"
				+ "----- Inteligencia: " + this.primaryAttr.get("Inteligencia") + "\n"
				+ "----- Sabiduria: " + this.primaryAttr.get("Sabiduria") + "\n"
				+ "----- Carisma: " + this.primaryAttr.get("Carisma") + "\n"
				+ "----- Percepcion " + this.primaryAttr.get("Percepcion") + "\n\n"
				+ "-- Atributos secundarios: \n"
				+ "----- Vida: " + this.secondaryAttr.get("Vida") + "\n"
				+ "----- Estamina: " + this.secondaryAttr.get("Estamina") + "\n"
				+ "----- Mana: " + this.secondaryAttr.get("Mana") + "\n"
				+ "----- Persuasion: " + this.secondaryAttr.get("Persuasion") + "\n"
				+ "----- Agilidad: " + this.secondaryAttr.get("Agilidad") + "\n"
				+ "----- Intimidacion: " + this.secondaryAttr.get("Intimidacion") + "\n"
				+ "----- Critico: " + this.secondaryAttr.get("Critico") + "\n"
				+ "----- Punteria: " + this.secondaryAttr.get("Punteria") + "\n");
	}

	public void SetName(String nombre){
		this.nombre = nombre;
	}


	public void SetClass(String clase){
		this.clase = clase;
	}

	public void SetRace(String raza){
		this.raza = raza;
	}

}
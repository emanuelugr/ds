package Razas;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

import Clases.ClaseBuilder;

public abstract class PersonajeBuilder {
	protected Personaje personaje;
	protected ClaseBuilder claseBuilder;
	static protected String CFG_PATH = "src/Ej3/cfg/raza/";
	protected String raza;

	public PersonajeBuilder(ClaseBuilder claseBuilder) {
		this.claseBuilder = claseBuilder;
		personaje = new Personaje();
	}

	public void CrearPersonaje() {
		System.out.println("Creando personaje: "+raza);
		CrearAtributos();
	};

	public void CrearAtributos() {
		CrearPrimarios();
		CrearSecundarios();
		personaje.SetClass(claseBuilder.GetClassName());
		personaje.SetRace(raza);
	};

	public void CrearPrimarios() {
		var attr = LoadCfg();
		personaje.SetPrimaryAttributes(attr);
	};

	/* Es comun a todas las clases */
	private HashMap<String, Integer> LoadCfg() {
		HashMap<String, Integer> temp = new HashMap<>();
		// Leer el archivo y construir el HashMap
		try (BufferedReader br = new BufferedReader(new FileReader(PersonajeBuilder.CFG_PATH + raza+".txt"))) {
			String line;
			while ((line = br.readLine()) != null) {
				// Dividir la línea en clave y valor usando ":"
				String[] parts = line.split(":");
				if (parts.length == 2) {
					String key = parts[0].trim(); // Clave sin espacios
					int value = Integer.parseInt(parts[1].trim()); // Valor como entero
					temp.put(key, value); // Agregar al HashMap
				} else {
					System.out.println("Error: línea no válida - " + line);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return temp;
	}

	public void CrearSecundarios() {
		claseBuilder.CrearClase(personaje.GetPrimary());
		personaje.SetSecondaryAttributes(claseBuilder.GetClase());
	}

	public Personaje GetPersonaje(){
		return personaje;
	}
}

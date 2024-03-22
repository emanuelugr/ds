package Clases;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public abstract class ClaseBuilder {
	protected HashMap<String, Integer> secundarios;
	protected HashMap<String, Integer> primarios;

	protected double multiplier = 0d;
	static public String CFG_PATH = "src/Ej3/cfg/clase/";
	protected String clase;

	public ClaseBuilder() {

		secundarios = new HashMap<>();
	}

	public String GetClassName(){
		return clase;
	}

	public void CrearClase(HashMap<String, Integer> primaryAttr) {
		System.out.println("Creando clase: "+clase);

		var info = LoadCfg();
		secundarios.put("Vida", primaryAttr.get("Resistencia") + primaryAttr.get("Fuerza"));
		secundarios.put("Estamina", primaryAttr.get("Destreza") + primaryAttr.get("Resistencia"));
		secundarios.put("Mana", primaryAttr.get("Inteligencia") + primaryAttr.get("Sabiduria"));
		secundarios.put("Persuasion", primaryAttr.get("Carisma") + primaryAttr.get("Sabiduria"));
		secundarios.put("Agilidad", primaryAttr.get("Destreza") + primaryAttr.get("Inteligencia"));
		secundarios.put("Intimidacion", primaryAttr.get("Fuerza") + primaryAttr.get("Carisma"));
		secundarios.put("Critico", primaryAttr.get("Percepcion") + primaryAttr.get("Inteligencia"));
		secundarios.put("Punteria", primaryAttr.get("Destreza") + primaryAttr.get("Percepcion"));

		/* Aplico multiplicador */
		for (Map.Entry<String, Double> entry : info.entrySet()) {
			var oldValue = secundarios.get(entry.getKey());
			var mult = entry.getValue();
			secundarios.put(entry.getKey(), (int) (oldValue * mult));
		}

	}

	public HashMap<String, Integer> GetClase() {
		return secundarios;
	}

	/* Es comun a todas las clases */
	private HashMap<String, Double> LoadCfg() {
		HashMap<String, Double> temp = new HashMap<>();
		// Leer el archivo y construir el HashMap
		try (BufferedReader br = new BufferedReader(new FileReader(ClaseBuilder.CFG_PATH + clase+".txt"))) {
			String line;
			while ((line = br.readLine()) != null) {
				// Dividir la línea en clave y valor usando ":"
				String[] parts = line.split(":");
				if (parts.length == 2) {
					String key = parts[0].trim(); // Clave sin espacios
					double value = Double.parseDouble(parts[1].trim()); // Valor como double
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
}

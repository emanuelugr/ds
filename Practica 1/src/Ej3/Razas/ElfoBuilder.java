package Razas;
import Clases.ClaseBuilder;

public class ElfoBuilder extends PersonajeBuilder {
	
	private static String RAZA = "elfo";

	public ElfoBuilder(ClaseBuilder claseBuilder) {
		super(claseBuilder);
		raza = RAZA;
	}
}

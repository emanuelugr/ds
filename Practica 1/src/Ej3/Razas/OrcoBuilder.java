package Razas;
import Clases.ClaseBuilder;

public class OrcoBuilder extends PersonajeBuilder {
	private static String RAZA = "orco";

	public OrcoBuilder(ClaseBuilder claseBuilder) {
		super(claseBuilder);
		raza = RAZA;
	}

}

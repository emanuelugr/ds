package Razas;

import Clases.ClaseBuilder;

public class EnanoBuilder extends PersonajeBuilder{
	
	private static String RAZA = "enano";

	public EnanoBuilder(ClaseBuilder claseBuilder) {
		super(claseBuilder);
		raza = RAZA;
	}
}

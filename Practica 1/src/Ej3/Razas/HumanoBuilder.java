package Razas;

import Clases.ClaseBuilder;

public class HumanoBuilder extends PersonajeBuilder{
	private static String RAZA = "humano";

	public HumanoBuilder(ClaseBuilder claseBuilder) {
		super(claseBuilder);
		raza = RAZA;
	}
	
}

public class FiltroRepercutirRozamiento implements Filtro {
	private final double FACTROZE = -50;

	public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
		double nuRevs = revoluciones;

		switch (estadoMotor){
			case ACELERANDO, FRENANDO:
				nuRevs = FACTROZE;
				break;
			default:
				break;
		}
		return nuRevs;
	}

}
public class FiltroCalcularVelocidad implements Filtro {
	private final double DEFINCVEL = 100, DEFDECVEL = -100, DEFMAXVEL = 5000;

	public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
		double nuRevs = revoluciones;
        double incrementoVelocidad;

		switch (estadoMotor){
			case ACELERANDO:
				incrementoVelocidad = DEFINCVEL;
				break;
			case FRENANDO:
				incrementoVelocidad = DEFDECVEL;
				break;
			default:
				incrementoVelocidad = 0.0;
				break;
		}

		nuRevs += incrementoVelocidad;

		if (nuRevs > DEFMAXVEL){
			nuRevs = DEFMAXVEL;
		} else if(nuRevs < 0){
            nuRevs = 0;
        }

		return nuRevs;
	}

}

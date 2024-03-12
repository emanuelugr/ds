public class Objetivo {
	/* Puede que quede mejor que esta variable se transmita desde el cliente */
	private final double RADIO = 0.15;

	private double velocimetro, contReciente, contTotal, RPM;

	/*TODO
	 * Esta es la clase del salpicadero, la cual hara uso de las cosas graficas de java para mostrar sus atributos
	 * ejecutar se debe encargar de hacer todas las operaciones de modificar los atributos segun las revoluciones
	 * 
	 */

	public double ejecutar(double revoluciones, EstadoMotor estadoMotor){

		this.RPM = revoluciones;
							/* OPERACION MATEMATICA RPM => KM/H */
		this.velocimetro = 2*Math.PI*RADIO * RPM * (60/1000);

		/* DEBUG POR AHORA */

		System.out.println(
			"Velocidad: " + this.velocimetro + "\n"
			+ "RPM: "+ this.RPM + "\n"
			+ "ContRec: " + this.contReciente + "\n"
			+ "ContTotal: "+ this.contTotal + "\n");

		return revoluciones;
	}

}

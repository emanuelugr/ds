public class GestorFiltros {

	private CadenaFiltros cadenaFiltros ;

	public GestorFiltros(Objetivo objetivo) {
		cadenaFiltros = new CadenaFiltros ();
		cadenaFiltros.asignarObjetivo(objetivo);
	}
	public void añadirFiltro(Filtro filtro) {
		cadenaFiltros.añadirFiltro(filtro) ;
	}

	public void ejecutar(double revoluciones, EstadoMotor estadoMotor) {
		cadenaFiltros.ejecutar(revoluciones, estadoMotor);
	}

}

public class GestorFiltros {

	private CadenaFiltros cadenaFiltros ;

	public GestorFiltros(Objetivo objetivo) {
		cadenaFiltros = new CadenaFiltros ();
		cadenaFiltros.asignarObjetivo(objetivo);
	}
	public void añadirFiltro(Filtro filtro) {
		cadenaFiltros.añadirFiltro(filtro) ;
	}

	public double peticionFiltros(double revoluciones, EstadoMotor estadoMotor) {
        double revs = cadenaFiltros.ejecutar(revoluciones, estadoMotor);

        return revs;
	}

}

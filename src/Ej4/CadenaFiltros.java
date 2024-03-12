import java.util.ArrayList;
import java.util.List;

public class CadenaFiltros {

	private List < Filtro > filtros = new ArrayList < >() ;
	private Objetivo objetivo ;

	public void añadirFiltro ( Filtro filtro ) {
		filtros.add (filtro) ;
	}

	public void asignarObjetivo (Objetivo objetivo) {
		this.objetivo = objetivo ;
	}

	public void ejecutar ( double revoluciones, EstadoMotor estadoMotor ) {
		double revs = revoluciones;
		for ( Filtro filtro : filtros ) {
			revs = filtro.ejecutar(revs,  estadoMotor) ;
		}

		if ( objetivo != null ) {
			revs = objetivo.ejecutar( revs,  estadoMotor ) ;
		}
	}
	
}

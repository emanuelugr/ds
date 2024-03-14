package EJ4;

public class FilterRepercutirRozamiento implements Filtro {

    private double rozamiento; // Reibungswert
  
    public FilterRepercutirRozamiento() {
      this.rozamiento = 1;
    }
  
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
      double velocidadCalculada=0;
      if(revoluciones>=rozamiento){
      velocidadCalculada=revoluciones - rozamiento;
      }
      return velocidadCalculada;
    }
  }

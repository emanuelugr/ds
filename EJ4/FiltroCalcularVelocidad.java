package EJ4;

public class FiltroCalcularVelocidad implements Filtro {

    private double incrementoVelocidad ; 
  
    public FiltroCalcularVelocidad() {
      this.incrementoVelocidad = 100;
    }
  
    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
      double velocidadCalculada=revoluciones;
      
      switch (estadoMotor) {
        case ACELERANDO:
          velocidadCalculada = revoluciones+incrementoVelocidad;
          break;
        case FRENANDO:
          velocidadCalculada = revoluciones-incrementoVelocidad;
          break;

        //APAGADO does nothing for the moment: bc in the run method of GestorFiltros the engine stops 
        case APAGADO:
          velocidadCalculada = revoluciones-(incrementoVelocidad/2);
          break;
        default:
      break;      }
  
      if (velocidadCalculada > 5000) {
        velocidadCalculada = 5000;
      } else if (velocidadCalculada < 0) {
        velocidadCalculada = 0;
      }
      return velocidadCalculada;
    }
  }
  
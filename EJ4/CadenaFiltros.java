package EJ4;

import java.util.*;

public class CadenaFiltros {

    private List<Filtro> filtros;
  
    public CadenaFiltros() {
      this.filtros = new ArrayList<>();
    }

    public void addFiltroRepercutirRozamiento() {
      FilterRepercutirRozamiento rep=new FilterRepercutirRozamiento();
        filtros.add(rep);
      }

      public void addFiltroCalcularVelocidad() {
        FiltroCalcularVelocidad rep=new FiltroCalcularVelocidad();
          filtros.add(rep);
        }
  
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor) {
      double revo = revoluciones;
      for(Filtro f : filtros ){
        revo = f.ejecutar(revo, estadoMotor);

      }
      return revo;
    }
  }
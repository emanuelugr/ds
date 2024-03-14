package EJ4;

import java.lang.Thread;

public class GestorFiltros extends Thread {

    private Salpicadero obj;
    double revoluciones;
    double kmh;
    double kilometros;
    CadenaFiltros cadena;
    EstadoMotor estado;


    public GestorFiltros(Salpicadero sal) {
      this.obj=sal;
      revoluciones=0;  
      kmh=0;
      kilometros=0;   
      estado=EstadoMotor.APAGADO;
      cadena=new CadenaFiltros();
      cadena.addFiltroCalcularVelocidad();
      cadena.addFiltroRepercutirRozamiento();
    }

    @Override
    public void run(){

        while (estado!=EstadoMotor.APAGADO) {
          
        switch (estado) {
          case ACELERANDO:
            revoluciones=cadena.ejecutar(revoluciones, estado);
            kmh=calcularkmh(revoluciones);
            kilometros=calcularkilometros(kmh);
            obj.execute( kmh, revoluciones, kilometros);
            break;
          
          case FRENANDO:

            revoluciones=cadena.ejecutar(revoluciones, estado);
            kmh=calcularkmh(revoluciones);
            kilometros=calcularkilometros(kmh);
            obj.execute( kmh, revoluciones,kilometros);
          default:
            break;
        }
        try {
          Thread.sleep(1000);
          } catch(InterruptedException e) {
          System.out.println("got interrupted!");
      }        
      }
    }
    

    public double calcularkmh(double rpm){
      double r=0.15;
      double kmh=2*Math.PI*r*rpm*(60.0/1000);
      return kmh;
    }

    public double calcularkilometros(double kmh){
      
      double res= kmh / 3600;;
      return res;

    }

    public void toggleEngineState(EstadoMotor es){
      estado=es;
    }

    }
  

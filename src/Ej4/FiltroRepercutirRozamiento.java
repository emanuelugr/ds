public class FiltroRepercutirRozamiento implements Filtro {
    private final double FACTROCE = -50;

    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
        double nuRevs = revoluciones;

        nuRevs += FACTROCE;
        
        if(nuRevs < 0){
            nuRevs = 0;
        }

        return nuRevs;
    }
}
public class FiltroRepercutirRozamiento implements Filtro {
    private final double FACTROZE = -50;

    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
        double nuRevs = revoluciones;

        nuRevs += FACTROZE;
        
        if(nuRevs < 0){
            nuRevs = 0;
        }

        return nuRevs;
    }
}
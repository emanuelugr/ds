/**
 * FactoriaMontana
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    public Carrera crearCarrera(){
        return new CarreraMontana();
    }
    
}
/**
 * FactoriaMontana
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    
    @Override
    public Carrera crearCarrera(){
        return new CarreraMontana();
    }

    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaMontana();
    }
    
}
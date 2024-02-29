import java.util.ArrayList;

/**
 * FactoriaMontana
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta{
    
    @Override
    public Carrera crearCarrera(ArrayList<Bicicleta> bicicletas){
        return new CarreraMontana(bicicletas);
    }

    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaMontana(id);
    }
    
}
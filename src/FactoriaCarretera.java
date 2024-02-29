import java.util.ArrayList;

public class FactoriaCarretera implements FactoriaCarreraYBicicleta{


    @Override
    public Carrera crearCarrera(ArrayList<Bicicleta> bicicletas){
        return new CarreraCarretera(bicicletas);
    }


    @Override
    public Bicicleta crearBicicleta(int id){
        return new BicicletaCarretera(id);
    }


    
}

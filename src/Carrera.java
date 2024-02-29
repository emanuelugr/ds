import java.util.ArrayList;

public abstract class Carrera {
    private ArrayList<Bicicleta> bicicletas;
    public Carrera(ArrayList<Bicicleta> bicicletas){
        this.bicicletas = bicicletas;
    };
}

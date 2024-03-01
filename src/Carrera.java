import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera implements Runnable{
    protected ArrayList<Bicicleta> bicicletas;
    protected static final long DURATION = 60;


    public Carrera(){
        bicicletas = new ArrayList<>();
    };


    public void AddBicicleta(Bicicleta b){
        if(bicicletas==null){
            return;
        }

        bicicletas.add(b);
    }
   
    @Override
    public void run(){
        System.out.println("Carretera en la hebra "+Thread.currentThread().getName());
        for(Bicicleta b:bicicletas){
            System.out.println("Bibicleta: "+b.GetId()+" ha iniciado la carrera");
        }
 
    }

    public void quitarBicicleta(double DROPOUT_RATE){
        System.out.println("AQUI "+DROPOUT_RATE);
        int n = (int) Math.round(bicicletas.size()*DROPOUT_RATE);

        for(int i=0;i<n;++i){
            //pick random
            Random r = new Random();
            int num = r.nextInt(0,bicicletas.size()-1);
            var b = bicicletas.remove(num);
            System.out.println("Bicicleta" + b.GetId() + " se ha estrellado en la carrera "+Thread.currentThread().getName());
        }
    }

}

import java.util.ArrayList;
import java.util.Random;

public abstract class Carrera implements Runnable {
    private ArrayList<Bicicleta> bicicletas;
    protected static final long DURATION = 6000;
    private double DROPOUT_RATE = 0.0;

    public Carrera() {
        bicicletas = new ArrayList<>();
    };

    public Carrera(double DROPOUT_RATE) {
        bicicletas = new ArrayList<>();
        this.DROPOUT_RATE = DROPOUT_RATE;
    };

    public void AddBicicleta(Bicicleta b) {
        if (bicicletas == null) {
            return;
        }

        bicicletas.add(b);
    }

    @Override
    public void run() {
        System.out.println("Carretera en la hebra " + Thread.currentThread().getName());
        for (Bicicleta b : bicicletas) {
            System.out.println("Bibicleta: " + b.GetId() + " ha iniciado la carrera en la hebra "+Thread.currentThread().getName());
        }
        quitarBicicleta();

        try {
            Thread.sleep(DURATION);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Carrera se ha terminado en la hebra: " + Thread.currentThread().getName());

    }

    public void quitarBicicleta() {
        System.out.println("AQUI " + DROPOUT_RATE);
        int n = (int) Math.round(bicicletas.size() * DROPOUT_RATE);

        for (int i = 0; i < n; ++i) {
            // pick random
            Random r = new Random();
            int num = r.nextInt(0, bicicletas.size() - 1);
            var b = bicicletas.remove(num);
            System.out.println(
                    "Bicicleta" + b.GetId() + " se ha estrellado en la carrera " + Thread.currentThread().getName());
        }
    }

}

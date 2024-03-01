import java.util.ArrayList;
import java.util.Map;

public class CarreraMontana extends Carrera {
    private final static double DROPOUT_RATE = 0.2;

    public CarreraMontana() {
        super(); //
    }

    @Override
    public void run() {
        super.run();
        super.quitarBicicleta(DROPOUT_RATE);
        try {
            Thread.sleep(DURATION);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Carrera se ha terminado en la hebra: " + Thread.currentThread().getName());

    }

}

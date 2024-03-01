/*
 * Carrera: Emanuel
 * Bicicleta: Thomas
 * FactoriaCarreraYBicicleta: Timur
*/

import java.util.ArrayList;

class Main {
    static void TestCarreraMontana(int n) {
        System.out.println("Prueba Carrera de Montaña con " + n + " bicicletas");

        FactoriaMontana fm = new FactoriaMontana();
        var carrera = fm.crearCarrera();
        for (int i = 0; i < n; ++i) {
            carrera.AddBicicleta(fm.crearBicicleta(i));
        }
        Thread t = new Thread(carrera);
        t.start();
        try {
            t.join();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("Prueba Carrera de Montaña ha finalizado");

    }

    public static void main(String[] args) {
        int n = 10;
        TestCarreraMontana(n);
    }
}

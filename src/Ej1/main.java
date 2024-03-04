
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

    static void TestCarreraCarretera(int n) {
        System.out.println("Prueba Carrera de Carretera con " + n + " bicicletas");

        FactoriaCarreraYBicicleta fm = new FactoriaCarretera();
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


    static void Final(int n) {
        System.out.println("Prueba Final con " + n + " bicicletas");

        /*Factorias */
        FactoriaCarreraYBicicleta fmCarretera = new FactoriaCarretera();
        FactoriaCarreraYBicicleta fmMontana = new FactoriaMontana();
        
        /*Carreras */
        var carreraCaretera = fmCarretera.crearCarrera();
        var carreraMontana = fmMontana.crearCarrera();
        
        /*Bicicletas */
        for (int i = 0; i < n; ++i) {
            carreraCaretera.AddBicicleta(fmCarretera.crearBicicleta(i));
            carreraMontana.AddBicicleta(fmMontana.crearBicicleta(i));
        }

        /*Hebras */
        Thread tMontana = new Thread(carreraMontana);
        Thread tCarretera = new Thread(carreraCaretera);
        tMontana.start();
        tCarretera.start();
        try {
            tMontana.join();
            tCarretera.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Prueba Final ha finalizado");

    }


    public static void main(String[] args) {
        int n = 10;
        //TestCarreraMontana(n);
        //TestCarreraCarretera(n);
        Final(n);
    }
}

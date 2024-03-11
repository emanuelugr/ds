
public abstract class Bicicleta{
    
    private int id;
}

class BicicletaCarretera extends Bicicleta{

      public BicicletaCarretera(int id) {
        this.id = id;
        }

}

class BicicletaMontana extends Bicicleta{
         public BicicletaMontana(int id) {
        this.id = id;
    }
}
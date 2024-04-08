
public class FactoriaCarreraYBicicletaMetodo {

    public Carrera crearCarrera(TipoCarrera tipo) {
        switch (tipo) {
            case Carretera:
                return new CarreraCarretera();
            case Montana:
                return new CarreraMontana();
            default:
                throw new UnsupportedOperationException("Tipo de carrera incorrecto");
        }
    }



    public Bicicleta crearBicicleta(TipoCarrera tipo, int id) {
        switch (tipo) {
            case Carretera:
                return new BicicletaCarretera(id);
            case Montana:
                return new BicicletaMontana(id);
            default:
                throw new UnsupportedOperationException("Tipo de bicicleta incorrecto");
        }
    }

}
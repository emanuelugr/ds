
class Main {

    public static void main(String[] args) {

/* 
		creaPersonajes constructorCaballero = new creaCaballero(); 
		Director dir = new Director(constructorCaballero);

		dir.crearPersonaje("Juan");
		dir.mostrarPersonaje();
*/

		Fachada fac = Fachada.getInstancia();

		fac.crearPersonaje();

    }

}


class Main {

    public static void main(String[] args) {

		creaCaballero constructorCaballero = new creaCaballero(); 
		Director dir = new Director(constructorCaballero);

		dir.crearPersonaje();
		dir.mostrarPersonaje();
	
    }

}

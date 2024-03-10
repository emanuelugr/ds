
import java.util.Scanner;

public class Menu {

	private static Menu instancia;
	Scanner in;
	static private int MAXCLASES = 5;

	private Menu(){
		in = new Scanner(System.in);
	}

	public static Menu getInstancia(){
		if (instancia == null){
			instancia = new Menu();
		}

		return instancia;
	} 

	public String preguntarNombre(){
		String nombre;
		System.out.printf("Escriba el nombre del personaje: \n");
		nombre = in.nextLine();

		return nombre;
	}
	
	public int preguntarClase(){
		int resultado;

		System.out.printf("Eliga la clase del personaje: \n"
		+ "1: Caballero \n"
		


		);

		resultado = in.nextInt();

		comprobarNumero(resultado, 1, MAXCLASES);

		return resultado;
	}

	private int comprobarNumero(int numero, int min, int max){

		int num = numero;
		while (numero < min || numero > max){
			System.out.printf("Por favor, introduzca una opcion valida");

			num = in.nextInt();
		}

		return num; 
	}

}

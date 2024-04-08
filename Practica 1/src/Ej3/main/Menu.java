package main;

import java.util.Scanner;

public class Menu {

	private static Menu instancia;
	Scanner in;
	static private int MAXCLASES = 4;
	static private int MAXRAZAS = 4;

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
		System.out.printf("Escriba el nombre del personaje: ");
		nombre = in.nextLine();

		return nombre;
	}
	
	public int preguntarRaza(){
		int resultado;

		System.out.println("Eliga la raza del personaje: \n"
		+ "1: Humano \n"
		+ "2: Elfo \n"
		+ "3: Enano \n"
		+ "4: Orco"
		);

		resultado = in.nextInt();

		comprobarNumero(resultado, 1, MAXCLASES);

		return resultado;
	}

	public int preguntarClase(){
		int resultado;

		System.out.println("Eliga la clase del personaje: \n"
		+ "1: Caballero \n"
		+ "2: Ranger \n"
		+ "3: Mago \n"
		+ "4: Ladron"
		);

		resultado = in.nextInt();

		comprobarNumero(resultado, 1, MAXRAZAS);

		return resultado;
	}

	private int comprobarNumero(int numero, int min, int max){

		int num = numero;
		while (numero < min || numero > max){
			System.out.println("Por favor, introduzca una opcion valida");

			num = in.nextInt();
		}

		return num; 
	}

}

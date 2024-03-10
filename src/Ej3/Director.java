
/*
public class Director{
	private creaPersonajes CP;

	public Director(creaPersonajes cp){
		this.CP = cp;
	}

	public void crearPersonaje(String nombre){
		CP.asignarTitulo(nombre);

		CP.asignarVida();
		CP.asignarEstamina();
		CP.asignarMana();
		
		CP.asignarFuerza();
		CP.asignarDestreza();
		CP.asignarResistencia();
		CP.asignarInteligencia();
		CP.asignarSabiduria();
		CP.asignarCarisma();
		
		CP.asignarPersuasion();
		CP.asignarAgilidad();
		CP.asignarIntimidacion();
	}

	public void mostrarPersonaje(){
		creaPersonajes.pers.mostrarPersonaje();
	}

}

*/

public class Director{
	private Personaje P;
	private creaRaza CR;
	private creaClase CC;

	public Director(creaRaza cr, creaClase cc){
		this.CR = cr;
		this.CC = cc;
	}

	public void crearPersonaje(String nombre){
		P = new Personaje(nombre);

		P.raza = CR.asignarRaza();
		P.fuerza = CR.asignarFuerza();
		P.destreza = CR.asignarDestreza();
		P.resistencia = CR.asignarResistencia();
		P.inteligencia = CR.asignarInteligencia();
		P.sabiduria = CR.asignarSabiduria();
		P.carisma = CR.asignarCarisma();
		P.percepcion = CR.asignarPercepcion();
	
		P.clase = CC.asignarClase();
		P.vida = CC.asignarVida(P.fuerza, P.resistencia);
		P.estamina = CC.asignarEstamina(P.resistencia, P.destreza);
		P.mana = CC.asignarMana(P.inteligencia, P.sabiduria);
		P.persuasion = CC.asignarPersuasion(P.carisma, P.sabiduria);
		P.agilidad = CC.asignarAgilidad(P.destreza, P.inteligencia);
		P.intimidacion = CC.asignarIntimidacion(P.carisma, P.fuerza);
		P.critico = CC.asignarCritico(P.percepcion, P.inteligencia);
		P.punteria = CC.asignarPunteria(P.destreza, P.percepcion);

	}

	public void mostrarPersonaje(){
		P.mostrarPersonaje();
	}

}


public class creaCaballero implements creaClase{

	public String asignarClase(){
		return "Caballero";
	}

	public int asignarVida(int F, int R) {
		return (int) ((F+R)*1.25);
	}

	public int asignarEstamina(int R, int D) {
		return (int) ((R+D)*1.5);
	}

	public int asignarMana(int I, int S) {
		return (int) ((I+S)*0.5);
	}

	public int asignarPersuasion(int C, int S) {
		return C+S;
	}

	public int asignarAgilidad(int D, int I) {
		return (int) ((D+I)*0.75);
	}

	public int asignarIntimidacion(int C, int F) {
		return C+F;
	}

	public int asignarCritico(int P, int I) {
		return P+I;
	}

	public int asignarPunteria(int D, int P) {
		return D+P;
	}

}
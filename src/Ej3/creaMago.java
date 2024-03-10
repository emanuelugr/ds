public class creaMago implements creaClase{

	public String asignarClase(){
		return "Mago";
	}

	public int asignarVida(int F, int R) {
		return (int) ((F+R)*0.5);
	}

	public int asignarEstamina(int R, int D) {
		return (int) ((R+D)*0.75);
	}

	public int asignarMana(int I, int S) {
		return (int) ((I+S)*1.5);
	}

	public int asignarPersuasion(int C, int S) {
		return C+S;
	}

	public int asignarAgilidad(int D, int I) {
		return D+I;
	}

	public int asignarIntimidacion(int C, int F) {
		return C+F;
	}

	public int asignarCritico(int P, int I) {
		return (int) ((P+I)*1.25);
	}

	public int asignarPunteria(int D, int P) {
		return D+P;
	}

}

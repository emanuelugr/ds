public class creaLadron implements creaClase{

	public String asignarClase(){
		return "Ladron";
	}

	public int asignarVida(int F, int R) {
		return F+R;
	}

	public int asignarEstamina(int R, int D) {
		return (int) ((R+D)*0.75);
	}

	public int asignarMana(int I, int S) {
		return I+S;
	}

	public int asignarPersuasion(int C, int S) {
		return (int) ((C+S)*1.5);
	}

	public int asignarAgilidad(int D, int I) {
		return (int) ((D+I)*1.25);
	}

	public int asignarIntimidacion(int C, int F) {
		return (int) ((C+F)*0.5);
	}

	public int asignarCritico(int P, int I) {
		return P+I;
	}

	public int asignarPunteria(int D, int P) {
		return D+P;
	}

}

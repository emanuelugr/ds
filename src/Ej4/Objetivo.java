
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.*;

public class Objetivo extends JPanel{
	/* Puede que quede mejor que esta variable se transmita desde el cliente */
	private final double RADIO = 0.15;

	private double velocimetro, contReciente, contTotal, RPM;

	/*TODO
	 * Esta es la clase del salpicadero, la cual hara uso de las cosas graficas de java para mostrar sus atributos
	 * ejecutar se debe encargar de hacer todas las operaciones de modificar los atributos segun las revoluciones
	 * 
	 */

	
	//Codigo de thomas // --------------------------------------------
  	public Objetivo(){
		this.velocimetro = 0;
		this.RPM = 0;
		//kilometros=0;

		JFrame frame =new JFrame("Salpicadero");
		frame.setTitle("Salpicadero");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(400, 200);

		JPanel mainPanel = new JPanel();
		mainPanel.setLayout(new GridLayout(3, 1));

		JPanel p1=new JPanel();
		JLabel l11=new JLabel("km/h:");
		JTextField l12 = new JTextField(10);
		l12.setEditable(false);
		p1.add(l11);
		p1.add(l12);
		
		JPanel p2=new JPanel();
		JLabel l21=new JLabel("contador reciente");
		JTextField l22 = new JTextField(10);
		l22.setEditable(false);
		p2.add(l21);
		p2.add(l22);

		JPanel p3=new JPanel();
		JLabel l31=new JLabel("RPM");
		JTextField l32 = new JTextField(10);
		l32.setEditable(false);
		p3.add(l31);
		p3.add(l32);

		mainPanel.add(p1);
		mainPanel.add(p2);
		mainPanel.add(p3);
		
		frame.add(mainPanel);
		frame.setLayout(new FlowLayout());
		frame.setVisible(true);
  	}	 
	//FIn COdigo de thomas // --------------------------------------------

	public double ejecutar(double revoluciones, EstadoMotor estadoMotor){

		this.RPM = revoluciones;
							/* OPERACION MATEMATICA RPM => KM/H */
		this.velocimetro = 2*Math.PI*RADIO * RPM * (60/1000);

		/* DEBUG POR AHORA */

		System.out.println(
			"Velocidad: " + this.velocimetro + "\n"
			+ "RPM: "+ this.RPM + "\n"
			+ "ContRec: " + this.contReciente + "\n"
			+ "ContTotal: "+ this.contTotal + "\n");

		return revoluciones;
	}

}

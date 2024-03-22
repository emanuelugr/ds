
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import java.awt.*;
import java.text.DecimalFormat;

public class Objetivo extends javax.swing.JPanel{
    /* Puede que quede mejor que esta variable se transmita desde el cliente */
    private final double RADIO = 0.15;

    private double velocimetro, contReciente, contTotal, RPM;
    private JTextField velTF, crTF, ctTF, rpmTF;
    DecimalFormat df = new DecimalFormat("0.00");

    //Codigo de thomas // --------------------------------------------


    public Objetivo(){
        this.velocimetro = 0.0;
        this.RPM = 0.0;
        this.contReciente = 0.0;
        this.contTotal = 0.0;

        JFrame frame = new JFrame("Salpicadero");
        frame.setTitle("Salpicadero");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(540, 120);

        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new GridLayout(3, 1));

        JPanel p1=new JPanel();
        JLabel l11=new JLabel("km/h:");
        velTF = new JTextField(10);
        velTF.setText(Double.toString(velocimetro));
        velTF.setEditable(false);
        p1.add(l11);
        p1.add(velTF);

        JPanel p2=new JPanel();
        JLabel l21=new JLabel("contador reciente");
        crTF = new JTextField(10);
        crTF.setText(Double.toString(velocimetro));
        crTF.setEditable(false);
        p2.add(l21);
        p2.add(crTF);

        JPanel p3=new JPanel();        
        JLabel l31=new JLabel("contador total");
        ctTF = new JTextField(10);
        ctTF.setText(Double.toString(velocimetro));
        ctTF.setEditable(false);
        p3.add(l31);
        p3.add(ctTF);

        JPanel p4=new JPanel();
        JLabel l41=new JLabel("RPM");
        rpmTF = new JTextField(10);
        rpmTF.setEditable(false);
        rpmTF.setText(Double.toString(velocimetro));
        p4.add(l41);
        p4.add(rpmTF);

        mainPanel.add(p1);
        mainPanel.add(p4);
        mainPanel.add(p2);
        mainPanel.add(p3);

        frame.add(mainPanel);
        frame.setLayout(new FlowLayout());
        frame.setVisible(true);

        repaint();
    }

    //Fin Codigo de thomas // --------------------------------------------

    private void actualizar(){

        String num;

        num = df.format(velocimetro);
        velTF.setText(num);
        num = df.format(contReciente);
        crTF.setText(num);
        num = df.format(contTotal);
        ctTF.setText(num);
        num = df.format(RPM);
        rpmTF.setText(num); 
        
        repaint();
        revalidate();
    }
        
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){

        this.RPM = revoluciones;
                            /* OPERACION MATEMATICA RPM => KM/H */
        this.velocimetro = (2*Math.PI*RADIO * this.RPM * (60*0.001));

        /*
         * OPERACION CUENTA KILOMETROS
         * 1 KM/H = 0.278 M/S => 0.000278 K/S
        */
        this.contReciente = this.contReciente + this.velocimetro*0.000278;
        
        if (velocimetro <= 0.0){
            this.contReciente = 0.0;
        }
        
        this.contTotal = this.contTotal + this.velocimetro*0.000278;

        /* 

        System.out.println(
                "Velocidad: " + this.velocimetro + "\n"
                + "RPM: "+ this.RPM + "\n"
                + "ConstRec: " + this.contReciente + "\n"
                + "ContTotal: "+ this.contTotal + "\n");
        */

        actualizar();
        
        return revoluciones;
    }

}

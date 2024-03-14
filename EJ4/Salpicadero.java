package EJ4;

import javax.swing.*;
import java.awt.*;

public class Salpicadero extends JPanel {
  double kmh; double rpm ; double kilometros;
  JTextField l12,l22,l32;
  public Salpicadero(){
    kmh=0;
    rpm=0;
    kilometros=0;



    JFrame frame =new JFrame("Salpicadero");
    frame.setTitle("Salpicadero");
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(400, 200);

    JPanel mainPanel =new JPanel();
    mainPanel.setLayout(new GridLayout(3, 1));

    JPanel p1=new JPanel();
    JLabel l11=new JLabel("km/h:");
    l12 = new JTextField(10);
    l12.setEditable(false);
    p1.add(l11);
    p1.add(l12);
    
    JPanel p2=new JPanel();
    JLabel l21=new JLabel("contador reciente");
    l22 = new JTextField(10);
    l22.setEditable(false);
    p2.add(l21);
    p2.add(l22);

    JPanel p3=new JPanel();
    JLabel l31=new JLabel("RPM");
    l32 = new JTextField(10);
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

  public void execute(double kmh1, double rpm1 ,double kilometros1){
    double roundedValue = (double) Math.round(kmh1 * 100) / 100;

    l12.setText(String.valueOf(roundedValue));
    

    double roundedValue1 = (double) Math.round(kilometros1 * 100) / 100;
    
    l22.setText(String.valueOf(roundedValue1));


    l32.setText(String.valueOf(rpm1));
  }
  
  
}

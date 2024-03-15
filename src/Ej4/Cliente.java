import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JToggleButton;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Cliente extends javax.swing.JPanel implements ActionListener{

    private GestorFiltros gestorFiltros ;
    private JLabel estadoMotorLabel;
    private JToggleButton botonEncender, botonAcelerar, botonFrenar;	
    private double revoluciones = 0;
    private EstadoMotor estado = EstadoMotor.APAGADO;

    public Cliente(GestorFiltros gestorFiltros) {

        this.gestorFiltros = gestorFiltros;

        JFrame ventana = new JFrame("Simulador de Motor");
        ventana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ventana.setSize(400, 150);
        ventana.setVisible(true);

        botonEncender=new JToggleButton("ENCENDER");
        botonEncender.setForeground(Color.green);
        botonAcelerar=new JToggleButton("ACELERAR");
        botonFrenar= new JToggleButton("FRENAR");


        // Agregar los botones al panel
        JPanel panelBotones = new JPanel();
        panelBotones.add(botonEncender);
        panelBotones.add(botonAcelerar);
        panelBotones.add(botonFrenar);

        botonEncender.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (botonEncender.isSelected()) {
                    estadoMotorLabel.setText("ENCENDIDO");
                    botonEncender.setText("APAGAR");
                    botonEncender.setForeground(Color.red);
                    botonAcelerar.setEnabled(true);
                    botonFrenar.setEnabled(true);
                    estado = EstadoMotor.ENCENDIDO;
//                    gestorFiltros.peticionFiltros(revoluciones, EstadoMotor.ENCENDIDO);
                } else {
                    estadoMotorLabel.setText("APAGADO");
                    botonEncender.setText("ENCENDER");
                    botonEncender.setForeground(Color.green);
                    botonAcelerar.setEnabled(false);
                    botonFrenar.setEnabled(false);
                    estado = EstadoMotor.APAGADO;
//                    gestorFiltros.peticionFiltros(revoluciones, EstadoMotor.APAGADO);
                }
            }});

        botonAcelerar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (botonEncender.isSelected()){
                    if (botonAcelerar.isSelected()){
                        estadoMotorLabel.setText("ACELERANDO");
                        botonAcelerar.setText("Soltar Accelerar");
                        botonAcelerar.setForeground(Color.red);
                        botonFrenar.setSelected(false);
                        botonFrenar.setText("Frenar");
                        estado = EstadoMotor.ACELERANDO;                        
                    } else{
                        estado = EstadoMotor.ENCENDIDO;
                        estadoMotorLabel.setText("ENCENDIDO");
                        botonAcelerar.setText("Accelerar");
                        botonAcelerar.setForeground(Color.black);                        
                    }
                }
            }
        });

        botonFrenar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if (botonEncender.isSelected()){
                    if (botonFrenar.isSelected()){
                        estadoMotorLabel.setText("FRENANDO");
                        botonFrenar.setText("Soltar Frenar");
                        botonFrenar.setForeground(Color.red);
                        botonAcelerar.setSelected(false);
                        botonAcelerar.setText("Accelerar");
                        botonAcelerar.setForeground(Color.black);
                        estado = EstadoMotor.FRENANDO;                        
                    } else{
                        estado = EstadoMotor.ENCENDIDO;  
                        botonFrenar.setText("Frenar");
                        botonFrenar.setForeground(Color.black);                        
                    }
                
                }
                    
            }
        });

        JPanel panel1 = new JPanel();
        estadoMotorLabel = new JLabel("APAGADO", JLabel.CENTER);
        estadoMotorLabel.setFont(new Font("Arial", Font.BOLD, 24));
        estadoMotorLabel.setForeground(Color.red);

        panel1.add(estadoMotorLabel, BorderLayout.NORTH);

        ventana.add(panel1);
        ventana.add(panelBotones);
        ventana.setLayout(new FlowLayout());
        ventana.setVisible(true);
    }
    
    public void run(){
        revoluciones = gestorFiltros.peticionFiltros(revoluciones, estado);
    }
    
    @Override
    public void actionPerformed(ActionEvent e){}

}

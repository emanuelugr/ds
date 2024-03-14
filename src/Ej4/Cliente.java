import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JToggleButton;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Cliente {

	private GestorFiltros gestorFiltros ;
    private JLabel estadoMotorLabel;
    private JToggleButton botonEncender, botonAcelerar, botonFrenar;	
	private double velocidad = 0;

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

		ActionListener BE = new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if (botonEncender.isSelected()) {
					estadoMotorLabel.setText("ENCENDIDO");
					botonEncender.setText("APAGAR");
					botonEncender.setForeground(Color.red);
					botonAcelerar.setEnabled(true);
					botonFrenar.setEnabled(true);
					gestorFiltros.ejecutar(velocidad, EstadoMotor.ENCENDIDO);
				} else {
					estadoMotorLabel.setText("APAGADO");
					botonEncender.setText("ENCENDER");
					botonEncender.setForeground(Color.green);
					botonAcelerar.setEnabled(false);
					botonFrenar.setEnabled(false);
				}
			}
		};

		botonEncender.addActionListener(new ActionListener()) {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (botonEncender.isSelected()) {
					estadoMotorLabel.setText("ENCENDIDO");
					botonEncender.setText("APAGAR");
					botonEncender.setForeground(Color.red);
					botonAcelerar.setEnabled(true);
					botonFrenar.setEnabled(true);
					gestorFiltros.toggleEngineState(EstadoMotor.FRENANDO);
					gestorFiltros.start();
				} else {
					estadoMotorLabel.setText("APAGADO");
					botonEncender.setText("ENCENDER");
					botonEncender.setForeground(Color.green);
					botonAcelerar.setEnabled(false);
					botonFrenar.setEnabled(false);
					gestorFiltros.toggleEngineState(EstadoMotor.APAGADO);
				}
			}});

		botonAcelerar.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (botonEncender.isSelected() && botonAcelerar.isSelected()) {
					estadoMotorLabel.setText("ACELERANDO");
					botonAcelerar.setText("Soltar Accelerar");
					botonAcelerar.setForeground(Color.red);
					botonFrenar.setSelected(false);
					botonFrenar.setText("Frenar");
					gestorFiltros.toggleEngineState(EstadoMotor.ACELERANDO);
				botonFrenar.setForeground(Color.black);
				
				}else if(botonEncender.isSelected() && !botonAcelerar.isSelected()){
				estadoMotorLabel.setText("FRENANDO");
				botonAcelerar.setText("Accelerar");
				botonAcelerar.setForeground(Color.black);
				

				}
			}
		});


		botonFrenar.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (botonEncender.isSelected() && botonFrenar.isSelected()) {
					estadoMotorLabel.setText("FRENANDO");
					botonFrenar.setText("Soltar Frenar");
					botonFrenar.setForeground(Color.red);
					botonAcelerar.setSelected(false);
					botonAcelerar.setText("Accelerar");
					botonAcelerar.setForeground(Color.black);
					gestorFiltros.toggleEngineState(EstadoMotor.FRENANDO);
					
				}else if(botonEncender.isSelected() && !botonFrenar.isSelected()){
				botonFrenar.setText("Frenar");
				botonFrenar.setForeground(Color.black);
				
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

}

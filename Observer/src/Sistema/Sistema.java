package Sistema;

import java.awt.Color;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import javax.swing.JFrame;

import Configuracion.*;

public class Sistema extends JFrame implements Observador {
	private static final long serialVersionUID = 1L;
	private Color panelColor; // guarda el color actual de la ventana
	private int cambiosContador; // contara los cambios realizados

	public Sistema() {
		this.panelColor = this.getBackground();
		this.setSize(600, 400);
		this.addWindowListener(new WindowAdapter() {

			public void windowClosing(WindowEvent e) {
				close();
			}
		});
	}

	public Color getColor() {
		return panelColor;
	}

	public void setColor(Color color) {
		this.panelColor = color;
	}

	public int getContador() {
		return this.cambiosContador;
	}

	private void close() {
		this.dispose();
	}

	public void actualizar(Object objeto) {
		if (objeto instanceof Color) {
			// se verifica que el color sea diferente al actual
			if (!this.panelColor.equals((Color) objeto)) {
				// se actualiza y aumenta el contador
				this.setColor((Color) objeto);
				this.cambiosContador++;
			}
		}
	}

	public static void main(String[] args) {
		Sistema ventana = new Sistema();
		Ventana pan1 = new Ventana("Amarillo", "Azul", "Rojo");
		pan1.enlazarObservador(ventana);
		ventana.add(pan1);
		ventana.setVisible(true);
	}
}

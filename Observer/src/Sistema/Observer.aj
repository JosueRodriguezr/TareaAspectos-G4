package Sistema;

import Sistema.Sistema.*;
import java.awt.Color;
public aspect Observer {
	String antColor;
	
	/**
	 * Sirve para la recuperacion de color, de los colores al momento de cambiar
	 */
	pointcut observer() : execution(public void Sistema.Sistema.actualizar(..));
	
	
	//Se recupera el color previo al cambio 
	before() : observer(){
		Sistema sist = (Sistema) thisJoinPoint.getThis(); 
		antColor = darColor(sist.getColor());
	}
	
	//Se obtiene el color actual y se muestra por pantalla
	after() : observer(){
		Sistema sist = (Sistema) thisJoinPoint.getThis();
		Color actualColor = sist.getColor();
		
		//Verifica si ha dado un cambio de color
		if(!antColor.equals(darColor(actualColor))) {						
			System.out.println("Cambio de Color: de " + antColor + " a " + darColor(actualColor));
		}else {						
			System.out.println("No se ha podido realizar un cambio de color");
		}		
	}
	
	/**
	 * Sirve para obtener el n�mero de veces que ha cambiado de color la pantalla 
	 */
	pointcut mostrarNumCambios() : execution(private void Sistema.Sistema.close());
	
	//Muestra en pantalla la cantidad de veces que se ha cambiado de color
	before() : mostrarNumCambios(){
		Sistema sist = (Sistema) thisJoinPoint.getThis();
		System.out.println("Se ha cambido el color de la pantalla "+sist.getContador()+" veces");
	}
	
	/**
	 * Verficia el color correcto que debe retornar
	 */
	public String darColor(Color color) {
		String newColor = "";
		if(color.equals(new Color(238,238,238))){newColor = "Gris";}
		if(color.equals(new Color(255,255,0))){newColor = "Amarillo";}
		if(color.equals(new Color(0,0,255))){newColor = "Azul";}
		if(color.equals(new Color(255,0,0))){newColor = "Rojo";}	
		return newColor;
	}
}

package Configuracion;

public interface Observado {

	//notifican los cambios realizados
	public void notificar();
	
	//Crea un observador para el objeto, que observa los cambios que se realiza en el objeto
	public void enlazarObservador(Observador obs);
}

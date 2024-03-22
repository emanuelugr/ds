
class main {

	public static void wait(int ms)
	{
		try
		{
			Thread.sleep(ms);
		}
		catch(InterruptedException ex)
		{
			Thread.currentThread().interrupt();
		}
	}
		
	public static void main(String[] args){

		Objetivo objetivo = new Objetivo();
		GestorFiltros gestorfiltros = new GestorFiltros(objetivo);
		gestorfiltros.añadirFiltro(new FiltroCalcularVelocidad());
		gestorfiltros.añadirFiltro(new FiltroRepercutirRozamiento());

		Cliente cliente = new Cliente(gestorfiltros);

		while (true){
			cliente.run();  
			wait(1000);
		}
	}
}
	
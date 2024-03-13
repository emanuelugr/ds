package EJ4;



public class Main {
    public static void main(String[] args) {
    
    Salpicadero sal=new Salpicadero();
    GestorFiltros gestorfil= new GestorFiltros(sal);
    Cliente client =new Cliente(gestorfil);


}
}



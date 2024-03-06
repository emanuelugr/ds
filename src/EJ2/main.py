import Factorias


#Carretera
def TestCarretera(num:int)->None:
	factoria = Factorias.FactoriaCarretera()
	carrera = factoria.crearCarrera()
	for i in range(0,num):
		bicicleta = factoria.crearBicicleta(i)
		carrera.AddBicicleta(bicicleta)
	carrera.Run()
	
#Montaña
def TestMontana(num:int)->None:
	factoria = Factorias.FactoriaMontana()
	carrera = factoria.crearCarrera()
	for i in range(0,num):
		bicicleta = factoria.crearBicicleta(i)
		carrera.AddBicicleta(bicicleta)
	carrera.Run()
	

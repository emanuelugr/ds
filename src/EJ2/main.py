import Factorias
import Carreras
import Bicicletas

#Carretera
def TestCarretera(num:int)->None:
	print("===========TEST FACTORIA CARRETERA===========")
	factoria = Factorias.FactoriaCarretera()
	carrera = factoria.crearCarrera()
	for i in range(0,num):
		bicicleta = factoria.crearBicicleta(i)
		carrera.AddBicicleta(bicicleta)
	carrera.Run()
	print("===========FIN===========")

#Montaña
def TestMontana(num:int)->None:
	print("===========TEST FACTORIA MONTAÑA===========")
	factoria = Factorias.FactoriaMontana()
	carrera = factoria.crearCarrera()
	for i in range(0,num):
		bicicleta = factoria.crearBicicleta(i)
		carrera.AddBicicleta(bicicleta)
	carrera.Run()
	print("===========FIN===========")
	
#Prototipo
def TestPrototipo(num:int)->None:
	print("===========TEST PROTOTIPO===========")
	carrera = Carreras.CarreraMontana()
	prototipo = Bicicletas.BicicletaPrototipo()

	prototipo.register_bicicleta("mountain",Bicicletas.BicicletaMontana(0))
	for i in range(0,num):
		bicicleta = prototipo.clone("mountain", id=i)
		carrera.AddBicicleta(bicicleta)
	carrera.Run()
	print("===========FIN===========")



if __name__=="__main__":
	num = 10
	TestCarretera(num)
	TestMontana(num)
	TestPrototipo(num)
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
	factoriaMontana = Factorias.FactoriaMontana()
	factoriaCarretera = Factorias.FactoriaCarretera()

	carreraMontana = factoriaMontana.crearCarrera()
	carreraCarretera = factoriaCarretera.crearCarrera()


	bicicletaMontana = Bicicletas.BicicletaMontana(0)
	bicicletaCarretera = Bicicletas.BicicletaCarretera(0)

	for i in range(0,num):
		bm_clonada = bicicletaMontana.clonar()
		bc_clonada = bicicletaCarretera.clonar()


		bm_clonada.id = bc_clonada.id = i
		carreraMontana.AddBicicleta(bm_clonada)
		carreraCarretera.AddBicicleta(bc_clonada)
	carreraMontana.Run()
	carreraCarretera.Run()
	print("===========FIN===========")



if __name__=="__main__":
	num = 10
	TestCarretera(num)
	TestMontana(num)
	TestPrototipo(num)
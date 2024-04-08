import Carreras
import Bicicletas
from abc import ABC, abstractclassmethod

class FactoriaCarreraYBicicleta(ABC):
	@abstractclassmethod
	def crearCarrera(self):
		pass

	@abstractclassmethod
	def crearBicicleta(self,id:int):
		pass


class FactoriaCarretera(FactoriaCarreraYBicicleta):
	def crearCarrera(self)->Carreras.Carrera:
		return Carreras.CarreraCarretera()
	
	def crearBicicleta(self,id:int)->Bicicletas.Bicicleta:
		return Bicicletas.BicicletaCarretera(id)


class FactoriaMontana(FactoriaCarreraYBicicleta):
	def crearCarrera(self)->Carreras.Carrera:
		return Carreras.CarreraMontana()

	def crearBicicleta(self,id:int)->Bicicletas.Bicicleta:
		return Bicicletas.BicicletaMontana(id)
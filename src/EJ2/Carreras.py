import Bicicletas
from abc import ABC, abstractclassmethod


class Carrera(ABC):
	def __init__(self,droupout:float):
		self.DROPOUT_RATE=droupout
		self.bicicletas = list()
		self.duration = 6000

	def AddBicicleta(self,bicicleta:Bicicletas.Bicicleta):
		self.bicicletas.append(bicicleta)
	
	def AplicarDropOut(self)->None:
		#TODO
		pass
	
	def Run(self)->None:
		print(f"Carrera con {len(self.bicicletas)} bicicletas ha iniciado")
		self.AplicarDropOut()
		print("Carrera Terminada")
		
class CarreraCarretera(Carrera):
	def __init__(self):
		super().__init__(0.2)



class CarreraMontana(Carrera):
	def __init__(self):
		super().__init__(0.1)
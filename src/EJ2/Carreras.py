import Bicicletas
from abc import ABC, abstractclassmethod
import random

class Carrera(ABC):
	def __init__(self,droupout:float):
		self.DROPOUT_RATE=droupout
		self.bicicletas = list()
		self.duration = 6000

	def AddBicicleta(self,bicicleta:Bicicletas.Bicicleta):
		self.bicicletas.append(bicicleta)
	
	def AplicarDropOut(self)->None:
		n = int(len(self.bicicletas)*self.DROPOUT_RATE)
		for i in range(0,n):
			r = random.randint(0,n)
			b = self.bicicletas.pop(r)
			print(f"Bicicleta {b.id} ha estrellado")
	
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
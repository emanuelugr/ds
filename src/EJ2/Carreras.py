import Bicicletas
from abc import ABC, abstractclassmethod
import random

class Carrera(ABC):
	def __init__(self,droupout:float):
		self.DROPOUT_RATE=droupout
		self.bicicletas = list()
		self.duration = 6000


	"""No he planteado metodos abstractos porque se trata 
		del comportamiento común a todas las clases hijas.
		Aunque si es cierto que quizas va en contra del proposito de abstract
		En este caso considero que las ventajas > nomenclatura oficial
	"""
	def AddBicicleta(self,bicicleta:Bicicletas.Bicicleta):
		self.bicicletas.append(bicicleta)
	
	def AplicarDropOut(self)->None:
		n = int(len(self.bicicletas)*self.DROPOUT_RATE)
		for i in range(0,n):
			r = random.randint(0,n)
			b = self.bicicletas.pop(r)
			print(f"Bicicleta {b.id} ha estrellado")

	def Run(self)->None:
		self.AplicarDropOut()
		print(f"Carrera Terminada con {len(self.bicicletas)} bicicletas")
		

class CarreraCarretera(Carrera):
	def __init__(self):
		super().__init__(0.2)

	def Run(self)->None:
		print(f"Carrera de Carretera con {len(self.bicicletas)} bicicletas y dropout {self.DROPOUT_RATE} ha iniciado")
		super().Run()

class CarreraMontana(Carrera):
	def __init__(self):
		super().__init__(0.1)
	
	def Run(self)->None:
		print(f"Carrera de Montana con {len(self.bicicletas)} bicicletas y dropout {self.DROPOUT_RATE} ha iniciado")
		super().Run()
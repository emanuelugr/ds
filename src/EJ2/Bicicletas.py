from abc import ABC, abstractclassmethod
import copy

class Bicicleta(ABC):
	def __init__(self,id: int):
		self.id = id
	
	@abstractclassmethod
	def clonar(self):
		pass
	

class BicicletaCarretera(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)
	
	def clonar(self):
		return copy.deepcopy(self)


class BicicletaMontana(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)

	def clonar(self):
		return copy.deepcopy(self)


from abc import ABC, abstractclassmethod
import copy

class Bicicleta(ABC):
	def __init__(self,id: int):
		self.id = id
	

class BicicletaCarretera(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)


class BicicletaMontana(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)



class BicicletaPrototipo:
	def __init__(self):
		self.bicicletas = dict()

	def register_bicicleta(self,name:str,bicicleta:Bicicleta)->None:
		self.bicicletas[name] = bicicleta

	def unregister_bicicleta(self,name:str)->None:
		del self.bicicletas[name]

	def clone(self,name:str, **attrs:dict)->Bicicleta:
		bicicleta = copy.deepcopy(self.bicicletas.get(name))
		bicicleta.__dict__.update(attrs)
		return bicicleta
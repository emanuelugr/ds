from abc import ABC, abstractclassmethod

class Bicicleta(ABC):
	def __init__(self,id: int):
		self.id = id


class BicicletaCarretera(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)


class BicicletaMontana(Bicicleta):
	def __init__(self, id: int):
		super().__init__(id)
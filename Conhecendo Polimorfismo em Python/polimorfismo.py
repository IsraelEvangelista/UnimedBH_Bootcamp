class Passaro:
    def voar(self):
        print(f"{self} Voando...")

    def __str__(self):
        return f"{self.__class__.__name__}{', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

# FIXME: Exemplo ruim de uso de herança para "ganhar" o método voar.
class Avião(Passaro):
    def voar(self):
        print("Avião está decolando...")

class Pardal(Passaro):
    def voar(self):
        return super().voar()

class Pombo(Passaro):
    def voar(self):
        return super().voar()

class Pavão(Passaro):
    def voar(self):
        print("Pavão não pode voar")

class Avestruz(Passaro):
    def voar(self):
        print("Avestruz não pode voar")

def plano_voo(obj): #Objeto com Polimorfismo
    obj.voar()




plano_voo(Pardal())
plano_voo(Avestruz())
plano_voo(Pombo())
plano_voo(Pavão())
plano_voo(Avião())

f'''
   João tem uma bicicleta e gostaria de registrar as vendas de suas bicicletas. 
   
   Crie um programa onde João informe:
   ============================================
   - Cor;
   - Modelo;
   - Ano;
   - Valor.
   ============================================
   
   Uma bicicleta pode:
   ============================================
   - Buzinar;
   - Parar;
   - Correr.
   ]============================================
   
   * Adicione esses comportamentos!
'''

class Bicicleta:
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor

    def buzinar(self):
        print("Plim plim...")

    def parar(self):
        print("Parando bicicleta...")
        print("Bicicleta parada!")

    def correr(self):
        print("Vrummmm...")

    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

b1 = Bicicleta("vermelha", "caloi", 2022, 600)
b1.buzinar()
b1.parar()
b1.correr()

print(b1.cor, b1.modelo, b1.ano, b1.valor)

b2 = Bicicleta("verde", "monark", 2000, 189)
b2.buzinar()
b2.parar()
b2.correr()
print(b2)

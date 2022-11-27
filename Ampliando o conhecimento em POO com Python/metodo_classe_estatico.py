class Pessoa:
    def __init__(self, nome=None, idade=None):
        self.nome = nome
        self.idade = idade

    @classmethod
    def criar_de_data_nascimento(cls, ano, mes, dia, nome):
        idade = 2022 - ano
        return cls(nome, idade)
    
    @staticmethod
    def e_maior_idade(idade):
        return idade >= 18



#p = Pessoa("Israel", 36)
#print(p.nome, p.idade)

p = Pessoa().criar_de_data_nascimento(1986, 3, 15, "Israel")
print(p.nome, p.idade)

print(Pessoa.e_maior_idade(36))
print(Pessoa.e_maior_idade(5))

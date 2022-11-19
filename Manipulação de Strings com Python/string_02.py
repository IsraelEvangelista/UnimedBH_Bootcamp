# Variáveis
nome = "Israel"
idade = 36
profissao = "Cientista de Dados"
linguagem = "Python"
saldo = 80.457

# Lista
dados = {"nome": "Israel", "idade": 28, "saldo": 45.575}

# Old style
print("Nome: %a | Idade: %d" % (nome, idade))

# Método format
print("Nome: {} | Idade: {}".format(nome, idade))
print("Nome: {0} | Idade: {1}".format(nome, idade))
print("Nome: {Nm} | Idade: {Idd}".format(Nm=nome, Idd=idade))
print("Nome: {nome} | Idade: {idade}".format(**dados))

# Método f-string
print(f"O {nome} é um {profissao} com idade de {idade}, que executa linguagem {linguagem}.")

# Formatar strings com f-strings
print(f"Nome: {nome} Idade: {idade} Saldo: {saldo:5.2f}")

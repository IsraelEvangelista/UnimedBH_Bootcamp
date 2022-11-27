class Conta:
    def __init__(self,nro_agencia, nome_cliente ,saldo=0):
        self._saldo = saldo
        self.nro_agencia = nro_agencia
        self.nome_cliente = nome_cliente

    def depositar(self, valor):
        self._saldo += valor
        print("Depósito realizado com sucesso!")

    def sacar(self, valor):
        self._saldo -= valor
        print("Saque realizado com sucesso!")

    def mostrar_saldo(self):
        return self._saldo


conta = Conta(nro_agencia="0001", nome_cliente="Fulano de tal", saldo=2500)
opcao = -1
print("Bem vindo ao banco Python!")
while opcao != 0:
    opcao = int(input(f'''
============== Menu ==============
[1] Saldo 
[2] Sacar 
[3] Depositar 
[0] Sair 
=================================='''))
    if opcao == 1:
        print("Saldo disponível abaixo:")
        print(conta.mostrar_saldo)
    if opcao == 2:
        print("Quanto gostaria de sacar?")
        conta.sacar(int(input()))
        print("Saldo disponível abaixo:")
        print(conta.mostrar_saldo)
    elif opcao == 3:
        print("Quanto gostaria de depositar?")
        conta.depositar(int(input()))
        print("Saldo disponível abaixo:")
        print(conta.mostrar_saldo)
else:
        print(f"Obrigado {conta.nome_cliente} por usar nosso sistema bancário.")

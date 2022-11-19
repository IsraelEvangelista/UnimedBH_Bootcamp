saldo = float(input("Digite um valor para saldo:  "))
saque = float(input("Digite um valor para saque:  "))

status = "Sucesso" if saldo >= saque else "Falha"

print(f"{status} ao relaizar o saque!")
print(f"O valor do saldo é de {saldo}")
print(f"O valor do saque é de {saque}")

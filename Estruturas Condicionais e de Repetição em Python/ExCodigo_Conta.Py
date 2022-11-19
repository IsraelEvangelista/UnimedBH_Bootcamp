conta_normal = 0
conta_universitaria = 0
saldo = 2900
saque = int(input("Quanto deseja sacar?  "))
cheque_especial = 500   

if conta_normal:
    if saldo >= saque:
        print("Saque realizado com sucesso!")
        print("Saldo disponível abaixo:")
        print(saldo - saque)
    elif saque <= (saldo + cheque_especial):
        print("Saque realizado com uso do cheque especial!")
        print("Saldo disponível abaixo:")
        print(saldo - saque + cheque_especial)
    else:
        print("Não foi possível realizar a operação.")
elif conta_universitaria:
    if saldo >= saque:
        print("Saque realizado com sucesso!")
    else: 
        print("Saldo insuficiente!")
else:
    print("Não existe conta cadastrada. Vá até seu terminal de atendimento para mais informações.")

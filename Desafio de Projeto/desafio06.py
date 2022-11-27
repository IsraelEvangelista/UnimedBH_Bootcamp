f'''
A empresa que você trabalha resolveu conceder um aumento salarial a todos funcionários, de acordo com a tabela abaixo:

 ===================================================
|           Salário        | Percentual de Reajuste |
|__________________________|________________________|
|          0 - 600.00      |          17%           |
|       600.01 - 900.00    |          13%           |
|       900.01 - 1500.00   |          12%           |
|      1500.01 - 2000.00   |          10%           |
|       Acima de 2000.00   |          5%            |
 ===================================================

Leia o salário do funcionário e calcule e mostre o novo salário, bem como o valor de reajuste ganho e o índice reajustado, em percentual.

A entrada contém apenas um valor de ponto flutuante, que pode ser maior ou igual a zero, com duas casas decimais, conforme exemplos abaixo.

Exemplo 01
 ==================================================
|           Entrada        |         Saída         |
|__________________________|_______________________|
|            1000          | Novo salario: 1120,00 |
|                          |Reajuste ganho: 120,00 |
|                          |                       |
|                          |   Em percentual: 12%  |
 ==================================================
 
 Exemplo 02
 ==================================================
|           Entrada        |         Saída         |
|__________________________|_______________________|
|            2000          | Novo salario: 2200,00 |
|                          |Reajuste ganho: 200,00 |
|                          |                       |
|                          |   Em percentual: 10%  |
 ==================================================

'''
# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
salario = int(input()) 

if (salario <= 600):
    novo_salario = salario * 1.17
    reajuste_salario = novo_salario - salario
    reajuste_perc = 17

elif (salario > 600 and salario <= 900):
    novo_salario = salario * 1.13
    reajuste_salario = novo_salario - salario
    reajuste_perc = 13

elif (salario > 900 and salario <= 1500):
    novo_salario = salario * 1.12
    reajuste_salario = novo_salario - salario
    reajuste_perc = 12

elif (salario > 1500 and salario <= 2000):
    novo_salario = salario * 1.10
    reajuste_salario = novo_salario - salario
    reajuste_perc = 10

else: novo_salario = salario * 1.05
reajuste_salario = novo_salario - salario
reajuste_perc = 5


print(f'Novo salario: {"{:.2f}".format(novo_salario)}\nReajuste ganho: {"{:.2f}".format(reajuste_salario)}\nEm percentual: {reajuste_perc} %')

# Porém este da um erro no desafio. O código abaixo está ok:

salario = int(input())                                

if (salario <= 600):
   novo_salario = salario + (salario * (17/100))
   reajuste_ganho = novo_salario - salario
   em_percentual = 17
   print("Novo salario:", "{:.2f}".format(novo_salario))    
   print("Reajuste ganho:", "{:.2f}".format(reajuste_ganho))
   print("Em percentual:", em_percentual, "%")

elif (salario >=600.01 and salario <=900):
   novo_salario = salario + (salario * (13/100))
   reajuste_ganho = novo_salario - salario
   em_percentual = 13
   print("Novo salario:", "{:.2f}".format(novo_salario))
   print("Reajuste ganho:", "{:.2f}".format(reajuste_ganho))
   print("Em percentual:", em_percentual, "%")

elif (salario >=900.01 and salario <=1500):
   novo_salario = salario + (salario * (12/100))
   reajuste_ganho = novo_salario - salario
   em_percentual = 12
   print("Novo salario:", "{:.2f}".format(novo_salario))
   print("Reajuste ganho:", "{:.2f}".format(reajuste_ganho))
   print("Em percentual:", em_percentual, "%")

elif (salario >=1500.01 and salario <=2000):
   novo_salario = salario + (salario * (10/100))
   reajuste_ganho = novo_salario - salario
   em_percentual = 10
   print("Novo salario:", "{:.2f}".format(novo_salario))
   print("Reajuste ganho:", "{:.2f}".format(reajuste_ganho))
   print("Em percentual:", em_percentual, "%")

else: 
   novo_salario = salario + (salario * (5/100))
   reajuste_ganho = novo_salario - salario
   em_percentual = 5
   print("Novo salario:", "{:.2f}".format(novo_salario))
   print("Reajuste ganho:", "{:.2f}".format(reajuste_ganho))
   print("Em percentual:", em_percentual, "%")

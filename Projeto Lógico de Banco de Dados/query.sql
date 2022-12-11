-- Query

-- Recuperações simples com SELECT Statement:
select * from cliente;
select * from pedido;
select * from produto;
select * from estoque;
select * from produto_estoque;
select * from fornecedor;
select * from terceiro;

-- Filtros com WHERE Statement:
-- Filtrando clientes por "Nome"
select 
	CNPJ_CPF as CPF, 
	nome as Cliente, 
	endereço as Endereço
from 
	cliente
where 
	nome
like
	'%Evangelista';
    
-- Quantificando mercadorias dos fornecedores
select
	PD.descrição as 'Mercadoria dos Fornecedores',
    sum(D.quantidade) as 'Quantidade'
from
	produto PD,
    fornecedor F,
    disponibilizando D
where
	PD.idproduto = D.PD_idproduto and
    F.idfornecedor = D.F_idfornecedor
group by PD.descrição;

-- Quantificando mercadorias de terceiros
select
	PD.descrição as 'Mercadoria dos Terceiros',
    sum(DT.quantidade) as 'Quantidade'
from
	produto PD,
    terceiro T,
    disponibilizando_terc DT
where
	PD.idproduto = DT.PD_idproduto and
    T.idterceiro = DT.T_idterceiro
group by PD.descrição;

-- Crie expressões para gerar atributos derivados
-- Listar quais pedidos foram realizados e verificar o valor total:                  
select 
	C.nome, 
    P.descrição as Item, 
    PD.descrição as Descrição, 
    PD.categoria, 
    PP.quantidade,
    PD.valor,
    P.frete,
    ((PP.quantidade*PD.valor)+P.frete) as 'Valor Total'
from
	cliente C
left join
	pedido P
    on C.idcliente = P.C_idcliente
left join
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto;
    
-- Defina ordenações dos dados com ORDER BY
-- Ordenar por clientes os produtos, forma de pagamento e status do pedido
select 
	C.nome as Cliente,
    P.descrição as Produto,
	FP.tipo_pagamento as 'Forma de Pagamento',
    P.status_pedido as 'Status do Pedido'
from
	forma_pagamento FP
left join
	pedido P
    on P.idpedido = FP.idforma_pgt
left join
	cliente C
    on C.idcliente = P.C_idcliente
    order by C.nome;

-- Condições de filtros aos grupos – HAVING Statement
-- Ordenar por um cliente específico os produtos, forma de pagamento e status do pedido
 select 
	C.nome as Cliente,
    P.descrição as Produto,
	FP.tipo_pagamento as 'Forma de Pagamento',
    P.status_pedido as 'Status do Pedido'
from
	forma_pagamento FP
left join
	pedido P
    on P.idpedido = FP.idforma_pgt
left join
	cliente C
    on C.idcliente = P.C_idcliente
    having(C.nome) = 'Israel Evangelista'
    order by C.nome;   
    
-- Clientes que compraram mais de R$ 200 no total
select PD.categoria, 
	   sum(PP.quantidade) as Quantidade, 
       sum(PD.valor) as Valor, 
       sum(P.frete) as Frete, 
       sum(((PP.quantidade*PD.valor)+P.frete)) as 'Total'
from 
	pedido P
left join 
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto
    group by PD.categoria
    having(Total) > 200;
    
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Síntese de valores cobrados por categoria:
select PD.categoria, 
	   sum(PP.quantidade) as Quantidade, 
       sum(PD.valor) as Valor, 
       sum(P.frete) as Frete, 
       sum(((PP.quantidade*PD.valor)+P.frete)) as 'Valor Total'
from 
	pedido P
left join 
	rel_produto_pedido PP
    on P.idpedido = PP.P_idpedido
left join
	produto PD
    on PP.PD_idproduto = PD.idproduto
    group by PD.categoria;
    
-- Perguntas
-- Quantos pedidos foram feitos por cada cliente?
select 
	C.nome as Clientes,
    sum(PP.quantidade) as 'Pedidos Realizados'
from 
	rel_produto_pedido PP
left join
	pedido P
    on P.idpedido = PP.P_idpedido
left join
	cliente C
    on C.idcliente = P.C_idcliente
    group by C.nome;

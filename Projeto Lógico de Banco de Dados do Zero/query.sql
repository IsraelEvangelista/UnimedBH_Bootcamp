-- Query

-- Recuperações simples com SELECT Statement:
select * from cliente;
select * from equipe;
select * from estoque;
select * from mecanico;
select * from ordem;
select * from pagamento;
select * from pecas_servico;
select * from pgt_ordem;
select * from servico;
select * from veiculo;

-- Filtros com WHERE Statement:
-- A quais clientes pertencem os veículos?
select distinct 
	V.placa as Placa,
    V.cor as Cor,
    C.nome as Nome
from
	cliente C, veiculo V
where
	C.idcliente = V.idcliente;
    
-- Quanto custou cada serviço?
select
	V.placa as Placa,
    S.descricao as 'Descrição do Serviço',
    S.valor as 'Valor do Serviço',
    PS.valor_peca as 'Valor das Peças',
    round((S.valor + PS.valor_peca),2) as 'Valor Total'
from
	veiculo V
left join
	servico S
    on V.idveiculo = S.idveiculo
left join
	pecas_servico PS
    on S.idveiculo = PS.idveiculo;

-- Quantificando peças usadas em serviço
select
	E.descricao as Peça,
    ifnull((sum(PS.quantidade)),0) as Quantidade
from
	estoque E
left join
	pecas_servico PS
    on E.idpecas = PS.idpecas
left join
	servico S
	on PS.idordem = S.idordem
	group by E.descricao;
    
-- Crie expressões para gerar atributos derivados
-- Valor total cobrado por serviço:
select distinct
	S.descricao as Serviço,
    round(sum(S.valor + PS.valor_peca),2) as 'Valor Total'
from
	cliente C
left join
	veiculo V
    on C.idcliente = V.idcliente
left join
	servico S
    on V.idveiculo = S.idveiculo
left join
	pecas_servico PS
    on S.idordem = PS.idordem
left join
	ordem O
    on PS.idordem = O.idordem
left join
	pgt_ordem PO
    on O.idordem = PO.idordem
    group by S.descricao;

-- Defina ordenações dos dados com ORDER BY
select
	M.nome as Mecanico,
    M.especialidade as Especialidade,
    S.descricao as Serviços
from
	mecanico M
left join
	equipe E
    on M.idmecanico = E.idmecanico1 and
    M.idmecanico = E.idmecanico2 and
    M.idmecanico = E.idmecanico3
left join
	servico S
    on E.idequipe = S.idequipe
    order by M.nome;
    
-- Condições de filtros aos grupos – HAVING Statement e junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select
	V.placa as Placa,
    S.descricao as Servico,
    round((S.valor + PS.valor_peca),2) as 'Valor Total',
    O.emissao as Emissão,
    PO.status as 'Status de Pagamento',
    P.metodo_pagamento as 'Método de Pagamento'
from
	cliente C
left join
    veiculo V
    on C.idcliente = V.idcliente
left join
    servico S
    on V.idveiculo = S.idveiculo
left join
	pecas_servico PS
    on S.idordem = PS.idordem
left join
	ordem O
    on PS.idordem = O.idordem
left join
	pgt_ordem PO
    on O.idordem = PO.idordem
left join
	pagamento P
    on P.idpagamento = PO.idpagamento
    having(V.placa) = 'OSU5022';

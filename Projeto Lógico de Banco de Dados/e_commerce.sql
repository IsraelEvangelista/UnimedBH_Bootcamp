-- Criação do Banco de Dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;
show tables;

-- Criação de tabela cliente:
create table cliente(
	idcliente int auto_increment primary key,
    nome varchar(30),
    CNPJ_CPF char(11) not null,
    endereço varchar(45),
    Dnascimento date,
    e_mail varchar(30),
    telefone varchar(30),
    constraint unique_CNPJ_CPF unique (CNPJ_CPF)
);

alter table cliente auto_increment = 1;

-- Criação de tabela pedido:
create table pedido(
	idpedido int auto_increment primary key,
    status_pedido ENUM('Pendente', 'Processando', 'Enviado', 'Entregue') default 'Pendente',
    descrição varchar(45),
    frete float,
    C_idcliente int,
    foreign key (C_idcliente) references cliente(idcliente)
);

alter table pedido auto_increment = 1;

-- Criação de tabela produto:
create table produto(
	idproduto int auto_increment primary key,
    categoria ENUM('Eletrônico', 'Vestimenta', 'Brinquedos','Alimentos'),
    descrição varchar(45),
    valor float
);

alter table produto auto_increment = 1;

-- Criação de tabela estoque:
create table estoque(
	idestoque int auto_increment primary key,
    endereço varchar(45)
);

alter table estoque auto_increment = 1;

-- Criação de tabela terceiro:
create table terceiro(
	idterceiro int auto_increment primary key,
    CNPJ_CPF char(11) not null,
    razao_social varchar(30),
    endereço varchar(45),
    telefone varchar(30),
    e_mail varchar(45),
    constraint unique_terc_CNPJ_CPF unique (CNPJ_CPF)
);

alter table terceiro auto_increment = 1;

-- Criação de tabela fornecedor:
create table fornecedor(
	idfornecedor int auto_increment primary key,
    CNPJ_CPF char(11) not null,
    razao_social varchar(30),
    endereço varchar(45),
    telefone varchar(30),
    e_mail varchar(45),
    constraint unique_forn_CNPJ_CPF unique (CNPJ_CPF)
);

alter table fornecedor auto_increment = 1;

-- Criação de tabela forma de pagamento:
create table forma_pagamento(
	idforma_pgt int auto_increment primary key,
    tipo_pagamento ENUM('Boleto','Cartão','PIX'),
    P_idpedido int,
    P_Cidcliente int,
    foreign key (P_idpedido) references pedido(idpedido),
    foreign key (P_Cidcliente) references pedido(C_idcliente)
);

alter table forma_pagamento auto_increment = 1;

-- Criação de tabela relação produto/Pedido:
create table rel_produto_pedido(
	P_idpedido int,
    PD_idproduto int,
    quantidade int default 1,
    foreign key (P_idpedido) references pedido(idpedido),
    foreign key (PD_idproduto) references produto(idproduto)
);

-- Criação de tabela Produto em estoque:
create table Produto_estoque(
	PD_idproduto int,
    E_idestoque int,
    quantidade int,
    foreign key (PD_idproduto) references produto(idproduto),
    foreign key (E_idestoque) references estoque(idestoque)
);

-- Criação de tabela Disponibilizando um Produto:
create table disponibilizando(
	F_idfornecedor int,
    PD_idproduto int,
    quantidade int,
    foreign key (PD_idproduto) references produto(idproduto),
    foreign key (F_idfornecedor) references fornecedor(idfornecedor)
);

-- Criação de tabela Produto por Vendedor:
create table disponibilizando_terc(
    PD_idproduto int,
    T_idterceiro int,
    quantidade int,
    foreign key (PD_idproduto) references produto(idproduto),
    foreign key (T_idterceiro) references terceiro(idterceiro)
);

-- Inserindo dados no banco

-- cliente:
insert into cliente(nome, CNPJ_CPF, endereço, Dnascimento, e_mail, telefone)
				values('Israel Evangelista','00744532101','Rua F','1986-03-15','i_ev@mail.com','(55)9998-9999'),
					  ('Leidiane Evangelista','00847833105','Rua F','1986-03-08','l_ev@mail.com','(55)9999-9999'),
					  ('Jefferson Santana','10449834707','Rua M','1987-11-03','j_ev@mail.com','(55)9997-9999'),
					  ('Raquel Pinheiro','11774564120','Rua K','1986-03-15','r_ev@mail.com','(55)9996-9999'),
					  ('Krishna Martins','55744602970','Rua Z','1971-03-11','m_ev@mail.com','(55)9995-9999'),
                      ('Leide Alves','64781603371','Rua A','1952-02-24','ld_ev@mail.com','(55)9985-9999');
                          
select * from cliente;

-- pedido:
insert into pedido(status_pedido, descrição, frete, C_idcliente) values('Pendente','Mouse Gamer Pro','5.00','1'),
																	   ('Enviado','Teclado','5.00','1'),
                                                                       ('Processando','Mouse Pad','0.00','2'),
                                                                       ('Entregue','Boneco Comandos em Ação','10.00','5'),
                                                                       ('Enviado','Arroz Oriental Japa','30.00','3'),
                                                                       ('Enviado','Sapatos de Corrida Sprint','25.00','2'),
                                                                       ('Pendente','T-shirt - Sprint','7.00','4'),
                                                                       ('Entregue','Bolachas Maria Refinada','0.00','1'),
                                                                       ('Pendente','Calça Jeans - Legs','7.00','3'),
                                                                       ('Pendente','Liquidificador - Spin Air','10.00','6');
                                                                       
select * from pedido;

-- produto:
insert into produto(categoria, descrição, valor) values('Eletrônico','Mouse com tempo de respota alto','125.00'),
													   ('Eletrônico','Teclado Mecânico ultra fino','350.00'),
                                                       ('Eletrônico','Mouse Pad sorvete rosa','10.00'),
                                                       ('Brinquedos','Comandos em Ação Edição II','100.00'),
                                                       ('Alimentos','Arroz oriental 500g','12.00'),
                                                       ('Vestimenta','Sapato marca Sprint, modelo Wingboots','450.00'),
													   ('Vestimenta','Camisa corrida marca Sprint pequena','75.00'),
                                                       ('Alimentos','Biscoito Maria - 1kg, Edição Refinada','10.00'),
                                                       ('Vestimenta','Calça Jeans - Modelo Long Legs Azul','50.00'),
													   ('Eletrônico','Liquidificador Modelo Spin Air Preto','110.00');

select * from produto;

-- estoque:
insert into estoque(endereço) values('Rua AAA, n. 100. Bairro ABC'),
									('Rua BBB, n. 110. Bairro CBA');
                                    
select * from estoque;

-- terceiro:
insert into terceiro(CNPJ_CPF, razao_social, endereço, telefone, e_mail) 
			values('01001000101','Zezé Distribuidora','Rua do zeze','(55)84576589','zeze@mail.com'),
                  ('02002000201','Avoado Comércio','Rua do avoado','(55)99553254','avoado@mail.com'),
                  ('01001000103','Brincalhão da Esquina ME','Rua do brincalhão','(55)96541000','brincahao@mail.com');
								
select * from terceiro;

-- fornecedor:
insert into fornecedor(CNPJ_CPF, razao_social, endereço, telefone, e_mail) 
			values('05004000005','Star Sports','Rua das Estrelas','(21)99513719','starsport@mail.com'),
                  ('08004000202','Holandesas ME','Rua da Holanda','(21)99522173','avoado@mail.com'),
                  ('09005500105','Rede Cupuaçu Ltda','Rua do Cupuaçu','(21)99555022','cupuacu@mail.com');
								
select * from fornecedor;

-- forma de pagamento:
insert into forma_pagamento(tipo_pagamento, P_idpedido, P_Cidcliente) 
            values('Cartão','1','1'),
				  ('Cartão','2','1'),
                  ('Boleto','3','2'),
				  ('PIX','4','5'),
                  ('PIX','5','3'),
				  ('Cartão','6','2'),
				  ('Cartão','7','4'),
				  ('PIX','8','1'),
                  ('Boleto','9','3'),
				  ('Boleto','10','6');

select * from forma_pagamento;

-- forma de pagamento:
insert into rel_produto_pedido(P_idpedido, PD_idproduto, quantidade) 
            values('1','1','1'),
				  ('2','2','1'),
                  ('3','3','2'),
				  ('4','4','1'),
                  ('5','5','3'),
				  ('6','6','1'),
				  ('7','7','2'),
				  ('8','8','5'),
                  ('9','9','2'),
				  ('10','10','1');

select * from rel_produto_pedido;

-- Produto em estoque:
insert into Produto_estoque(PD_idproduto,  E_idestoque, quantidade) 
            values('1','1','15'),
				  ('2','2','10'),
                  ('3','1','30'),
				  ('4','1','2'),
                  ('5','1','32'),
				  ('6','2','5'),
				  ('7','1','4'),
				  ('8','2','86'),
                  ('9','1','9'),
				  ('10','1','10');

select * from Produto_estoque;

-- Disponibilizando Produto:
insert into disponibilizando(F_idfornecedor, PD_idproduto, quantidade) 
            values('2','1','20'),
				  ('2','2','10'),
                  ('2','3','25'),
                  ('3','5','150'),
				  ('1','6','5'),
				  ('1','7','25'),
				  ('3','8','80'),
                  ('2','9','20'),
				  ('2','10','20');

select * from disponibilizando;

-- Disponibilizando Produto (Terceiro):
insert into disponibilizando_terc(PD_idproduto, T_idterceiro, quantidade) 
            values('3','7','5'),
				  ('4','9','20'),
                  ('5','8','3'),
                  ('5','7','42'),
				  ('8','7','30'),
                  ('8','8','12'),
                  ('9','7','5'),
				  ('10','7','5');

select * from disponibilizando_terc;

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
    
    -- 
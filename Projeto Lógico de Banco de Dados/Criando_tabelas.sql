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

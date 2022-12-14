-- Criação do Banco de Dados para o cenário de Oficina
create database oficina;
use oficina;
show tables;

-- Criação de tabela cliente:
create table cliente(
	idcliente int auto_increment primary key,
    nome varchar(30),
    cpf varchar(15) not null,
    email varchar(60),
    telefone varchar(30),
    constraint unique_cpf unique (cpf)
);

alter table cliente auto_increment = 1;

-- Criação de tabela veiculo:
create table veiculo(
	idveiculo int auto_increment primary key,
    placa varchar(45) not null,
    cor varchar(15) not null,
    situacao varchar(45) not null,
    idcliente int,
    constraint FK_idcliente foreign key (idcliente) references cliente(idcliente)
);

alter table veiculo auto_increment = 1;

-- Criação de tabela ordem:
create table ordem(
	idordem int auto_increment primary key,
    emissao date,
    previsao_conclusao date,
    status ENUM('Em Serviço', 'Finalizado', 'Entregue')
);

alter table ordem auto_increment = 1;

-- Criação de tabela Pagamento:
create table pagamento(
	idpagamento int auto_increment primary key,
    metodo_pagamento ENUM('Cartão', 'Boleto', 'PIX')
);

alter table pagamento auto_increment = 1;

-- Criação de tabela estoque:
create table estoque(
	idpecas int auto_increment primary key,
    descricao varchar(45),
    quantidade int
);

alter table estoque auto_increment = 1;

-- Criação de tabela mecânico:
create table mecanico(
	idmecanico int auto_increment primary key,
    nome varchar(45),
    endereco varchar(45),
    especialidade varchar(45)
);

alter table mecanico auto_increment = 1;

-- Criação de tabela equipe:
create table equipe(
	idequipe int auto_increment primary key,
    idmecanico int,
    constraint FK_idmecanico foreign key (idmecanico) references mecanico(idmecanico),
    constraint FK_idmecanico2 foreign key (idmecanico2) references mecanico(idmecanico),
    constraint FK_idmecanico3 foreign key (idmecanico3) references mecanico(idmecanico)
);

alter table equipe auto_increment = 1;

-- Criação de tabela peças serviço:
create table pecas_servico(
	idpecas int,
    idordem int,
    idveiculo int,
    quantidade int,
    valor_peca float,
    constraint FK_idpecas foreign key (idpecas) references estoque(idpecas),
    constraint FK_idordem foreign key (idordem) references ordem(idordem),
    constraint FK_idveiculo foreign key (idveiculo) references veiculo(idveiculo)
);

alter table pecas_servico auto_increment = 1;

-- Criação de tabela peças serviço:
create table pgt_ordem(
	idpagamento int,
    idordem int,
    status ENUM('Pendente', 'Processando', 'Pago'),
    constraint FK_idpagamento_pgt foreign key (idpagamento) references pagamento(idpagamento),
    constraint FK_idordem_pgt foreign key (idordem) references ordem(idordem)
);

alter table pgt_ordem auto_increment = 1;

-- Criação de tabela serviço:
create table servico(
	idveiculo int,
    idordem int,
    idequipe int,
    descricao varchar(45),
    valor float,
    constraint FK_idveiculo_serv foreign key (idveiculo) references veiculo(idveiculo),
    constraint FK_idordem_serv foreign key (idordem) references ordem(idordem),
    constraint FK_idequipe_pgt foreign key (idequipe) references equipe(idequipe)
);

alter table servico auto_increment = 1;

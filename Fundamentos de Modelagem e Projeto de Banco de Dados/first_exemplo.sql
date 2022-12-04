create TABLE periodicos(
    id serial primary key,
    nome_periodico VARCHAR(20),
	issn int unique,
	id_editora INT
);

create table editora(
    id serial,
	nome_editora varchar(120) unique,
	pais varchar(5),
	PRIMARY key(id)
);

alter table periodicos add constraint fk_editora_periodico FOREIGN KEY(id_editora) REFERENCES editora(id);

insert into editora (nome_editora, pais) VALUES ('IEEE', 'EUA'), ('DataSciendeMagazine', 'EUA');
insert into periodicos (nome_periodico, issn, id_editora) VALUES ('Special Issue', '156795164', '1');

select P.nome_periodico, P.issn, E.nome_editora, E.pais FROM periodicos P, editora E where P.id_editora = E.id;
select * from editora
SELECT * from periodicos

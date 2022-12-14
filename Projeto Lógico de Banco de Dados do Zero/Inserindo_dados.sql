-- Inserindo dados no banco

-- Cliente:
insert into cliente(nome, cpf, email, telefone)
				values('Israel Evangelista','00744532101','i_ev@mail.com','(55)9998-9999'),
					  ('Leidiane Evangelista','00847833105','l_ev@mail.com','(55)9999-9999'),
					  ('Jefferson Santana','10449834707','j_ev@mail.com','(55)9997-9999'),
					  ('Raquel Pinheiro','11774564120','r_ev@mail.com','(55)9996-9999'),
					  ('Krishna Martins','55744602970','m_ev@mail.com','(55)9995-9999'),
                      ('Leide Alves','64781603371','ld_ev@mail.com','(55)9985-9999');
                          
select * from cliente;

-- Veículo:
insert into veiculo(placa, cor, situacao, idcliente)
				values('AAA0001','Azul','Disco de Freio','1'),
					  ('BWS1410','Amarelo','Revisão Geral','5'),
                      ('PWD0807','Cinza','Ar Condicionado','4'),
                      ('OSU5022','Vermelho','Suspensão','2'),
                      ('ZSX9897','Verde Escuro','Revisão Geral','3'),
                      ('PWD0807','Cinza','Radiador','4'),
                      ('BSS0800','Branco','Ar Condicionado','6'),
                      ('OSU5022','Vermelho','Caixa de Macha','2'),
                      ('AAA0001','Azul','Motor','1'),
                      ('BWS1410','Amarelo','Disco de Freio','5'),
                      ('ZSX9897','Verde Escuro','Motor','3'),
                      ('BWS1410','Amarelo','Ar Condicionado','5');
                      
select * from veiculo;

-- Ordem:
insert into ordem(emissao, previsao_conclusao, status)
				values('2022-05-22','2022-05-30','Entregue'),
					  ('2022-05-24','2022-05-26','Entregue'),
                      ('2022-06-10','2022-06-14','Entregue'),
                      ('2022-06-12','2022-06-20','Em Serviço'),
                      ('2022-06-12','2022-06-21','Em Serviço'),
                      ('2022-06-13','2022-06-25','Em Serviço'),
                      ('2022-06-13','2022-06-25','Finalizado'),
                      ('2022-06-14','2022-06-26','Em Serviço'),
                      ('2022-06-14','2022-06-27','Finalizado'),
                      ('2022-06-14','2022-06-30','Em Serviço'),
                      ('2022-06-14','2022-07-02','Em Serviço'),
                      ('2022-06-15','2022-07-02','Em Serviço');
                      
select * from ordem;

-- Pagamento:
insert into pagamento(metodo_pagamento)
				values('PIX'),
					  ('Cartão'),
                      ('Boleto'),
                      ('PIX'),
                      ('Cartão'),
                      ('Cartão'),
                      ('PIX'),
                      ('Boleto'),
                      ('Cartão'),
                      ('Cartão'),
                      ('PIX'),
                      ('Cartão');
                      
select * from pagamento;

-- Estoque:
insert into estoque(descricao, quantidade)
				values('Molas de Suspensão','40'),
					  ('Pneu Médio','20'),
                      ('Pneu Grande','15'),
                      ('Pastilhas de Freio','48'),
                      ('Bateria','25'),
                      ('Óleo Lubrificante','75'),
                      ('Filtro de Ar','14'),
                      ('Conjunto de Peças Menores para Reposição','187'),
                      ('Conjunto de Peças Médias para Reposição','112'),
                      ('Conjunto de Peças Grandes para Reposição','94');
                      
select * from estoque;

-- Mecânico:
insert into mecanico(nome, endereco, especialidade)
				values('Chico Bento','Rua do Bento','Freios e Motor'),
					  ('Junior Filho','Rua do Pai','Ar Condicionado e Direção Hidráulica'),
                      ('Pé de Graxa','Rua Escorregou Morreu','Sistema Elétrico, Freios e Motor'),
                      ('Zé Mão Boba','Rua Terremoto','Geral'),
                      ('Vesgo do Pé','Rua do Calo','Sistema Elétrico'),
                      ('Thompson Bucão','Rua TB','Geral'),
                      ('Omar Zul','Rua do Nascente','Ar Condicionado e Sistema Elétrico'),
                      ('Ryu da Bahia','Rua Japão','Sistema Elétrico e Motor'),
                      ('Ken de Osasco','Rua EUA','Freios, Motor e Direção Hidráulica');
                      
select * from mecanico;

-- Equipe:
insert into equipe(idmecanico1, idmecanico2, idmecanico3)
				values('8','9','6'),
					  ('7','6','1'),
                      ('2','3','4');
                      
select * from equipe;

-- Peças Serviço: 
insert into pecas_servico(idpecas, idordem, idveiculo, quantidade, valor_peca)
		values('4','1','1','5','57.86'),
              ('6','2','2','2','20.00'),
              ('8','2','2','10','5.00'),
              ('7','3','3','1','35.00'),
              ('9','3','3','4','6.00'),
              ('1','4','4','4','475.00'),
              ('6','4','4','5','20.00'),
              ('10','4','4','7','8.00'),
              ('2','5','5','4','314.91'),
              ('9','5','5','16','6.00'),
              ('6','6','6','5','20.00'),
              ('8','6','6','20','5.00'),
              ('7','7','7','1','35.00'),
              ('5','7','7','1','455.57'),
              ('2','7','7','1','314.91'),
              ('1','8','8','2','475.00'),
              ('10','8','8','12','8.00'),
              ('4','8','8','3','57.86'),
              ('6','9','9','5','20.00'),
              ('10','9','9','24','8.00'),
              ('8','9','9','10','5.00'),
              ('9','9','9','18','6.00'),
              ('4','10','10','3','57.86'),
              ('10','11','11','20','8.00'),
              ('6','11','11','5','20.00'),
              ('7','12','12','1','35.00'),
              ('5','12','12','1','455.57');
              
select * from pecas_servico;

-- Pagamento de Ordem: 'Pendente', 'Processando', 'Pago'
insert into pgt_ordem(idpagamento, idordem, status)
		values('1','1','Pago'),
			  ('2','2','Pago'),
              ('3','3','Pago'),
              ('4','4','Processando'),
              ('4','4','Pago'),
              ('5','5','Processando'),
              ('6','6','Pago'),
              ('7','7','Pendente'),
              ('8','8','Pago'),
              ('9','9','Pendente'),
              ('10','10','Processando'),
              ('11','11','Pendente');
              
select * from pgt_ordem;

-- Serviço:
insert into servico(idordem, idveiculo, idequipe, descricao, valor)
		values('1','1','3','Rangido no disco de freio','70.00'),
			  ('2','2','2','Revisão geral e troca de peças','60.00'),
              ('3','3','1','Ar Condicionado não funcionando','140.00'),
              ('4','4','1','Instabilidade por conta da suspensão','80.00'),
              ('5','5','3','Revisão geral e troca de peças','60.00'),
              ('6','6','2','Manutenção do radiador','40.00'),
              ('7','7','2','Troca do ar, bateria e pneus','120.00'),
              ('8','8','1','Reparo da caixa de macha','150.00'),
              ('9','9','3','Reparo do motor','400.00'),
              ('10','10','3','Reparo do disco de freio','40.00'),
              ('11','11','1','Manutenção do motor','70.00'),
              ('12','12','3','Troca de bateria e filtro de ar','70.00');
              
select * from servico;

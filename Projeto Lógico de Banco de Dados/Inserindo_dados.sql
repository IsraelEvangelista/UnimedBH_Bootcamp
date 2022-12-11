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

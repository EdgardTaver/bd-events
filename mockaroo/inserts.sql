INSERT INTO Beneficio (Nome, Descricao) -- 1
VALUE ('Marca de patrocinador', 'O nome da entidade aparecerá na lista de patrocinadores do evento');

INSERT INTO Beneficio (Nome, Descricao) -- 2
VALUE ('Produtos personalizados', 'O evento oferecerá produtos personalizados com o nome da entidade');

INSERT INTO Beneficio (Nome, Descricao) -- 3
VALUE ('Presença prioritária', 'Membros da entidades ganham presença prioritária nas atividades do evento');

INSERT INTO Beneficio (Nome, Descricao) -- 4
VALUE ('Desconto nos ingressos', 'Membros da entidades ganham desconto nos ingressos das atividades do evento');

INSERT INTO Beneficio (Nome, Descricao) -- 5
VALUE ('Espaço de divulgação', 'A entidades terá um espaço e página no evento para divulgar sua marca');

INSERT INTO Pacote (Tipo, Class) -- 1
VALUE ('Universidade', 'Einsten');

INSERT INTO Pacote (Tipo, Class) -- 2
VALUE ('Universidade', 'Newton');

INSERT INTO Pacote (Tipo, Class) -- 3
VALUE ('Universidade', 'Curie');

INSERT INTO Pacote (Tipo, Class) -- 4
VALUE ('Empresa', 'Einsten');

INSERT INTO Pacote (Tipo, Class) -- 5
VALUE ('Empresa', 'Newton');

INSERT INTO Pacote (Tipo, Class) -- 6
VALUE ('Empresa', 'Curie');

INSERT INTO PacoteCompostoPorBeneficio (fk_Pacote_idPacote, fk_Beneficio_idBeneficio)
VALUE (1, )
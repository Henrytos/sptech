-- a) Criar um banco de dados chamado Campanha.
CREATE DATABASE Campanha;

--  

-- b) Selecionar esse banco de dados.
USE Campanha;
--  

-- c) Criar as tabelas correspondentes à sua modelagem.

CREATE TABLE organizador(
	idOrganizador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    fkExperiente INT NOT NULL,
    CONSTRAINT fkOrganizadorExperiente FOREIGN KEY (fkExperiente) REFERENCES organizador(idOrganizador)
);
ALTER TABLE organizador AUTO_INCREMENT=30;


CREATE TABLE campanhas(
	idCampanha INT AUTO_INCREMENT,
    categoria VARCHAR(45) NOT NULL,
    dataFinal DATE NOT NULL,
	fkInstituicao1 INT,
    fkInstituicao2 INT,
    fkOrganizador INT NOT NULL,
    CONSTRAINT PRIMARY KEY(idCampanha, fkOrganizador),
    CONSTRAINT fkCampanhaInstituicao1 FOREIGN KEY (fkInstituicao1) REFERENCES instituicao(idInstituicao),
	CONSTRAINT fkCampanhaInstituicao2 FOREIGN KEY (fkInstituicao2) REFERENCES instituicao(idInstituicao)
);
ALTER TABLE organizador AUTO_INCREMENT=500;

CREATE TABLE instituicao(
	idInstituicao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

--  

-- d) Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente.
INSERT INTO organizador (idOrganizador, nome, email, endereco, fkExperiente) VALUES
(30, 'Carlos Andrade', 'carlos@email.com', 'Rua das Flores, 123', 30), -- Ele se representa
(31, 'Mariana Souza', 'mariana@email.com', 'Avenida Central, 456', 30), -- Experiente: Carlos
(32, 'Henry franz', 'henry@email.com', 'Rua papoula, 88', 30); -- Experiente: Carlos

INSERT INTO instituicao (idInstituicao, nome) VALUES
(1, 'Instituto Esperança'),
(2, 'Fundação Vida'),
(3, 'Casa Solidária'),
(4, 'Ação Fraterna');

INSERT INTO campanhas (categoria, dataFinal, fkInstituicao1, fkInstituicao2, fkOrganizador) VALUES
('Alimentos', '2024-07-01', 1, 2, 30), -- Organizada por Carlos
('Educação', '2024-08-15', 3, 4, 30), -- Organizada por Carlos
('Saúde', '2024-09-10', 2, 4, 31); -- Organizada por Mariana

--  

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM organizador;
SELECT * FROM instituicao;
SELECT * FROM campanhas;

--  

-- f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação das tabelas.

--  

-- g) Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
SELECT * FROM organizador JOIN campanhas ON campanhas.fkOrganizador = organizador.idOrganizador;
--  

-- h) Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
SELECT * FROM organizador JOIN campanhas ON campanhas.fkOrganizador = organizador.idOrganizador WHERE organizador.nome = 'Carlos Andrade';
--  

-- i) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
SELECT novato.nome AS 'Organizador Novato' , experiente.nome AS 'Organizador Experiente' FROM organizador AS novato JOIN organizador AS experiente ON novato.fkExperiente = experiente.idOrganizador;
--  

-- j) Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador (informar o nome do organizador orientador na consulta).
SELECT novato.nome AS 'Organizador Novato' , experiente.nome AS 'Organizador Experiente' FROM organizador AS novato JOIN organizador AS experiente ON novato.fkExperiente = experiente.idOrganizador WHERE experiente.nome ='Carlos Andrade';

--  

-- l) Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
SELECT novato.nome AS 'Organizador Novato' , experiente.nome AS 'Organizador Experiente', campanhas.categoria AS 'Categoria da campanha' 
FROM organizador AS novato JOIN organizador AS experiente ON novato.fkExperiente = experiente.idOrganizador 
JOIN campanhas ON novato.idOrganizador = campanhas.fkOrganizador
WHERE novato.idOrganizador <> experiente.idOrganizador ;
--  

-- m) Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador.

SELECT novato.nome AS 'Organizador Novato' , experiente.nome AS 'Organizador Experiente', campanhas.categoria AS 'Categoria da campanha' 
FROM organizador AS novato JOIN organizador AS experiente ON novato.fkExperiente = experiente.idOrganizador 
JOIN campanhas ON novato.idOrganizador = campanhas.fkOrganizador
WHERE novato.idOrganizador <> experiente.idOrganizador AND novato.nome = 'Mariana Souza';
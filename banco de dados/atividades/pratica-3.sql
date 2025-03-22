CREATE DATABASE sprint2;
USE sprint2;

-- ------------------------------------------EXERCICIO 1 ------------------------------------------

CREATE TABLE Pais(
	idPais INT PRIMARY KEY auto_increment,
    nome varchar(30),
    capital varchar(40)
);

CREATE TABLE Atleta(
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int,
	fkPais int
);

-- Inserindo dados na tabela País
INSERT INTO Pais ( nome, capital) VALUES
( 'Brasil', 'Brasília'),
( 'Estados Unidos', 'Washington, D.C.'),
( 'França', 'Paris'),
( 'Japão', 'Tóquio');

ALTER TABLE Atleta ADD constraint  fkAtletaPais foreign key (fkPais) references Pais(idPais);

-- Inserindo dados na tabela Atleta
INSERT INTO Atleta (nome, modalidade, qtdMedalha, fkPais) VALUES
( 'João Silva', 'Natação', 5, 1),
( 'Carlos Souza', 'Natação', 3, 1),
( 'Michael Johnson', 'Atletismo', 6, 2),
( 'Usain Bolt', 'Atletismo', 8, 2),
( 'Marie Curie', 'Judô', 4, 3),
( 'Jean Dupont', 'Judô', 2, 3),
( 'Yuki Tanaka', 'Ginástica', 7, 4),
( 'Hiroshi Sato', 'Ginástica', 5, 4);


UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 1 or idAtleta = 2;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 3 or idAtleta = 4;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 5 or idAtleta = 6;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 7 or idAtleta = 8;
SELECT * FROM atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.nome , Pais.nome FROM atleta JOIN Pais ON idPais = fkPais;
SELECT Atleta.* , Pais.nome , Pais.capital FROM atleta JOIN Pais ON idPais = fkPais WHERE capital = 'Paris';



-- ------------------------------------------EXERCICIO2 ------------------------------------------
CREATE TABLE Album(
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(45),
    dtLancamento VARCHAR(45),
    CONSTRAINT chkTipo CHECK(tipo IN ('digital', 'físico'))
);
CREATE TABLE Musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40),
    fkAlbum INT
    );

-- Inserir dois álbuns
INSERT INTO Album (nome, tipo, dtLancamento) 
VALUES
('Album 1', 'digital', '2025-03-01'),
('Album 2', 'físico', '2025-02-01');


-- Inserir músicas para o primeiro álbum
INSERT INTO Musica (titulo, artista, genero, fkAlbum) 
VALUES
('Musica 1', 'Artista A', 'Pop', 1),
('Musica 2', 'Artista A', 'Pop', 1),
('Musica 3', 'Artista B', 'Rock', 1);

-- Inserir músicas para o segundo álbum
INSERT INTO Musica (titulo, artista, genero, fkAlbum) 
VALUES
('Musica 4', 'Artista A', 'Pop', 2),
('Musica 5', 'Artista B', 'Rock', 2);


-- a) Exibir todos os dados das tabelas separadamente;
SELECT * FROM Musica;
SELECT * FROM Album;
-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
ALTER TABLE Musica ADD CONSTRAINT fkMusicaAlbum FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);
-- c) Atualizar os álbuns de cada música;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 3;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 4;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 5;

-- d) Exibir as músicas e seus respectivos álbuns;
SELECT * FROM Musica JOIN Album ON idAlbum = fkAlbum;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
SELECT m.titulo, a.nome FROM Musica AS m JOIN Album as a ON idMusica = fkMusica;

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
SELECT * FROM Musica AS m JOIN Album AS a ON idAlbum = fkAlbum WHERE a.tipo = 'digital';

-- ------------------------------------------EXERCICIO 3 -----------------------------------------
CREATE TABLE Pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    cpf char(11)
);

CREATE TABLE Reserva(
	idReserva int primary key auto_increment,
    dtReserva DATETIME,
    dtRetira DATETIME,
    dtDevolucao DATETIME,
    fkPessoa int
);

ALTER TABLE Reserva ADD CONSTRAINT fkPessoaReserva FOREIGN KEY (fkPessoa) references Pessoa(idPessoa);

-- Inserindo dados na tabela pessoa
INSERT INTO pessoa ( nome, cpf) VALUES
( 'João Silva', '12345678901'),
( 'Maria Oliveira', '23456789012'),
( 'Carlos Souza', '34567890123'),
( 'Ana Pereira', '45678901234'),
( 'Lucas Fernandes', '56789012345');

INSERT INTO pessoa ( cpf) VALUES
(  '12345678901');


-- Inserindo dados na tabela reserva
INSERT INTO reserva (dtReserva, dtRetira, dtDevolucao, fkPessoa) VALUES
( '2024-03-17 10:00:00', '2024-03-18 08:00:00', '2024-03-20 18:00:00', 1),
( '2024-03-17 11:30:00', '2024-03-19 09:00:00', '2024-03-22 15:00:00', 2),
( '2024-03-17 14:00:00', '2024-03-20 10:00:00', '2024-03-23 20:00:00', 3),
( '2024-03-17 16:00:00', '2024-03-21 11:00:00', '2024-03-24 16:00:00', 4),
( '2024-03-17 18:30:00', '2024-03-22 14:00:00', '2024-03-25 12:00:00', 5);
-- SELECT Atleta.* , Pais.nome , Pais.capital FROM atleta JOIN Pais ON idPais = fkPais WHERE capital = 'Paris';

SELECT * FROM Reserva JOIN pessoa ON idPessoa = FkPessoa;
SELECT pessoa.nome AS Nome, pessoa.cpf AS Documento, reserva.dtReserva AS "Data Reserva", reserva.dtRetira AS "Data Retira", reserva.dtDevolucao AS Devolução FROM Reserva JOIN pessoa ON idPessoa = FkPessoa;
SELECT pessoa.nome, CASE WHEN pessoa.nome NOT LIKE '%r%'  THEN 'Pagamento atrasado' ELSE 'Pagamento em dia' END AS Situação, reserva.dtReserva AS 'Data reserva' FROM Reserva JOIN pessoa ON idPessoa = FkPessoa;

INSERT INTO pessoa ( cpf) VALUES
(  '12345678901');
INSERT INTO reserva (dtReserva, dtRetira, dtDevolucao, fkPessoa) VALUES
( '2024-03-17 10:00:00', '2024-03-18 08:00:00', '2024-03-20 18:00:00', 6);

SELECT ifnull(pessoa.nome, 'Usuario desconhecido') AS usuário , reserva.dtReserva AS Horario FROM Reserva JOIN pessoa on idPessoa = FkPessoa;

-- ------------------------------------------EXERCICIO 5 ------------------------------------------

CREATE TABLE Pessoa(
	idPessoa int primary key auto_increment,
    nome VARCHAR(45),
    idade INT,
    cpf CHAR(15)
);

CREATE TABLE Carteira(
	idCarteira int primary key auto_increment,
    TipoCarteira char(2),
    validade int,
    FkPessoa int
);

INSERT INTO Pessoa (nome, idade, cpf) VALUES
('Guilherme Marques', 18, '123.456.789-00'),
('Ana Souza', 25, '987.654.321-00'),
('Carlos Silva', 30, '456.123.789-11'),
('Mariana Lima', 22, '321.654.987-22'),
('Fernando Rocha', 40, '159.357.852-33');

INSERT INTO Carteira (TipoCarteira, validade, FkPessoa) VALUES
('A', 2028, 1),
('B', 2030, 2),
('AB', 2025, 3),
('B', 2027, 4),
('AB', 2029, 5);

ALTER TABLE Carteira ADD CONSTRAINT fkPessoaCarteira FOREIGN KEY (fkPessoa) references Pessoa(idPessoa);

SELECT * FROM Carteira JOIN pessoa ON FkPessoa = idPessoa;
SELECT pessoa.nome AS Nome, pessoa.idade AS Idade, carteira.tipoCarteira AS Tipo, carteira.validade AS Validade FROM Carteira JOIN pessoa on FkPessoa = idPessoa;
SELECT pessoa.nome, CASE WHEN carteira.tipoCarteira = 'A' THEN 'Moto' WHEN carteira.tipoCarteira = 'B' THEN 'Carro' WHEN carteira.tipoCarteira = 'AB' THEN 'Carro e moto' END AS tipo FROM carteira JOIN pessoa ON FkPessoa = idPessoa;
INSERT INTO Pessoa (idade, cpf) VALUES
( 15, '123.456.789-00');
INSERT INTO Carteira (TipoCarteira, validade, FkPessoa) VALUES
( 'A' , 2028 , 6);
SELECT ifnull(pessoa.nome, 'Usuario desconhecido') AS usuário , carteira.tipoCarteira AS tipo FROM carteira JOIN pessoa ON FkPessoa = idPessoa;


-- ------------------------------------------EXERCICIO 4 ------------------------------------------

-- - Criar as tabelas;

CREATE TABLE Pessoa1(
	idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	dtNascimento DATE 
);

CREATE TABLE Pessoa2(
	idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	dtNascimento DATE,
	fkPessoa1 INT UNIQUE
);

-- - Inserir 5 registros
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
('Fernanda Silva', '1985-03-10'),
('Maria Oliveira', '1990-07-25'),
('Tatiane Souza', '1978-12-15'),
('Ana Mendes', '2000-05-30'),
('Carla Lima', '1995-09-18');

-- Inserindo dados na tabela Pessoa2, referenciando Pessoa1
INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('João Silva', '2005-06-20', 1),
('Rafael Oliveira', '2010-11-05', 2),
('Carlos Souza', '2003-04-12', 3),
('Lucas Mendes', '2015-08-22', 4),
('Bruno Lima', '2008-02-17', 5);



-- - Configurar chave estrangeira
ALTER TABLE Pessoa2 ADD CONSTRAINT FOREIGN KEY fkPessoa2Pessoa1 (fkPessoa1) REFERENCES Pessoa1(idPessoa1);
-- - Exibir dados;
SELECT * FROM  Pessoa1 as p1 JOIN Pessoa2 as p2 ON p2.fkPessoa1 = p1.idPessoa1;

-- - Exibir dados com AS;
SELECT p1.nome AS 'Nome Da namorada',p2.nome AS 'Nome Do namorado'  FROM  Pessoa1 as p1 JOIN Pessoa2 as p2 ON p2.fkPessoa1 = p1.idPessoa1;

-- - Exibir dados com CASE;
SELECT 
	CASE 
		WHEN p1.nome LIKE 'Carla%' THEN CONCAT('Vish se Lascou ',p2.nome)
		WHEN p1.nome NOT LIKE 'Carla%' THEN CONCAT('Tamo safe a ',p1.nome, ' Não é uma carla arrassa corações')
        END AS 'status do relacionamento' FROM Pessoa1 as p1 JOIN Pessoa2 as p2 ON p2.fkPessoa1 = p1.idPessoa1;

-- - Exibir dados com IFNULL
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES('Maria pega ninguem', '1985-03-10');
INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES('Miguel o solteiro', NULL, 6);
SELECT IFNULL(p2.dtNascimento, 'Oshi não nasceu kksksk') AS 'Data de nacimento',p2.nome AS 'Nome'  FROM Pessoa1 as p1 JOIN Pessoa2 as p2 ON p2.fkPessoa1 = p1.idPessoa1;


-- ------------------------------------------EXERCICIO 6 ------------------------------------------

-- - Criar as tabelas;
CREATE TABLE farmacia(
	idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    horarioDeAbertura TIMESTAMP(0),
    horarioDeFechamento TIMESTAMP(0)
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(5),
    cidade VARCHAR(45),
    rua VARCHAR(45),
    numero VARCHAR(5),
    fkFarmacia INT UNIQUE
);

CREATE TABLE farmaceutico(
	idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(15),
    fkFarmacia INT     
);


-- - Inserir 5 registros;

-- Inserindo farmácias
INSERT INTO farmacia (nome, horarioDeAbertura, horarioDeFechamento) VALUES
('Farmácia Vida', '2024-03-22 08:00:00', '2024-03-22 22:00:00'),
('Drogaria Saúde', '2024-03-22 07:30:00', '2024-03-22 21:30:00'),
('Farmácia Popular', '2024-03-22 08:00:00', '2024-03-22 23:00:00'),
('Drogaria Bem-Estar', '2024-03-22 07:00:00', '2024-03-22 20:00:00'),
('Farmácia Central', '2024-03-22 09:00:00', '2024-03-22 23:30:00');

-- Inserindo endereços associados às farmácias
INSERT INTO endereco (estado, cidade, rua, numero, fkFarmacia) VALUES
('SP', 'São Paulo', 'Rua das Flores', '123', 1),
('RJ', 'Rio de Janeiro', 'Av. Brasil', '456', 2),
('MG', 'Belo Horizonte', 'Rua Minas', '789', 3),
('PR', 'Curitiba', 'Av. Paraná', '101', 4),
('RS', 'Porto Alegre', 'Rua Gaúcha', '202', 5);


-- Inserindo farmacêuticos vinculados às farmácias
INSERT INTO farmaceutico (nome, telefone, fkFarmacia) VALUES
('Carlos Souza', '(11) 98765-4321', 1),
('Mariana Lima', '(21) 99874-3210', 2),
('Fernando Oliveira', '(31) 98888-9999', 3),
('Tatiane Mendes', '(41) 97654-1234', 4),
('Ricardo Santos', '(51) 96543-2100', 5);

-- - Configurar chave estrangeira;
ALTER TABLE farmaceutico ADD CONSTRAINT FOREIGN KEY fkFarmaceuticoFarmacia (fkFarmacia) REFERENCES farmacia(idFarmacia);
ALTER TABLE endereco ADD CONSTRAINT FOREIGN KEY fkEnderecoFarmacia (fkFarmacia) REFERENCES farmacia(idFarmacia);

-- - Exibir dados;
SELECT * FROM farmacia AS f JOIN endereco AS e ON f.idFarmacia = e.fkFarmacia JOIN farmaceutico AS t ON  f.idFarmacia = t.fkFarmacia;

-- - Exibir dados com AS;
SELECT f.nome AS 'Nome do estabelicimento', t.nome AS 'Nome do farmaceutico', e.rua AS 'Rua' FROM farmacia AS f JOIN endereco AS e ON f.idFarmacia = e.fkFarmacia JOIN farmaceutico AS t ON  f.idFarmacia = t.fkFarmacia;

USE sprint2;
-- - Exibir dados com CASE;
SElECT * FROM farmacia JOIN endereco ON idFarmacia = endereco.fkFarmacia 
		JOIN farmaceutico ON idFarmacia = farmaceutico.fkFarmacia;
        
-- - Exibir dados com IFNULL;

INSERT INTO farmacia (nome, horarioDeAbertura, horarioDeFechamento) VALUES ('Não compre aqui', '2024-03-22 08:00:00', '2024-03-22 08:00:00');
INSERT INTO endereco VALUES (DEFAULT , NULL, NULL, NULL, NULL, 6);
INSERT INTO farmaceutico VALUES(DEFAULT, NULL, NULL, 6);

SELECT IFNULL(e.estado,'Não possui estado ainda') AS 'Possui estado', f.nome AS 'Nome da farmacia' FROM farmacia AS f JOIN endereco AS e ON f.idFarmacia = e.fkFarmacia JOIN farmaceutico AS t ON f.idFarmacia = t.fkFarmacia; 

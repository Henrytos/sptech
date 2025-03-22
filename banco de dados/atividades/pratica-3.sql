CREATE DATABASE sprint2;

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

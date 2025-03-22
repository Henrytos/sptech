USE spritn2;
SHOW TABLES;
DROP TABLE Album;
CREATE TABLE Album(
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(45),
    dtLancamento VARCHAR(45),
    CONSTRAINT chkTipo CHECK(tipo IN ('digital', 'físico'))
);
DROP TABLE Musica ;
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
    fkPessoa1 INT UNIQUE,
    CONSTRAINT FOREIGN KEY fkPessoa2Pessoa1 (fkPessoa1) REFERENCES Pessoa1(idPessoa1)
);


-- - Inserir 5 registros

-- - Configurar chave estrangeira

-- - Exibir dados;

-- - Exibir dados com AS;

-- - Exibir dados com CASE;

-- - Exibir dados com IFNULL

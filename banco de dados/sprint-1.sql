-- --------------------------Exercício 1--------------------------
 USE sprint1;
 
 --  Criar a tabela chamada Atleta 
 CREATE TABLE Atleta(
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);
 
 --  Inserir dados na tabela
INSERT INTO Atleta VALUES(1, 'Rafaela', 'Judo', 2);
INSERT INTO Atleta VALUES(2, 'Bia', 'Judo', 2);
INSERT INTO Atleta VALUES(3, 'Rebeca', 'Ginastica Artistica', 6);
INSERT INTO Atleta VALUES(4, 'Flávia', 'Ginastica Artistica', 5);
INSERT INTO Atleta VALUES(5, 'Marcus', 'Tiro com Arco', 0);
INSERT INTO Atleta VALUES(6, 'Ana', 'Tiro com Arco', 2);
INSERT INTO Atleta VALUES(7, 'Sandro', 'Natação', 2);
INSERT INTO Atleta VALUES(8, 'Leo', 'Natação', 2);

-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
SELECT nome, qtdMedalha FROM Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
SELECT * FROM Atleta WHERE modalidade = 'Ginastica Artistica';

-- Exibir os dados da tabela ordenados pela modalidade.
SELECT * FROM Atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM Atleta WHERE nome LIKE 'R%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT * FROM Atleta WHERE nome LIKE '%o';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM Atleta WHERE nome LIKE '%r_';

-- Eliminar a tabela.
DROP TABLE Atleta;

-- --------------------------Exercício 2--------------------------

CREATE TABLE Musica(
  idMusica INT PRIMARY KEY,
  titulo VARCHAR(40),
  artista VARCHAR(40),
  genero VARCHAR(40)
);

INSERT INTO Musica VALUES(1, 'Feiticeiros (Jujutsu Kaisen)', 'M4rkim', 'Rap Geek');
INSERT INTO Musica VALUES(2, 'Nova Geração (Maki, Hakari e Yuta)', 'AniRap', 'Rap Geek');
INSERT INTO Musica VALUES(3, 'Bling‐Bang‐Bang‐Born', 'Creepy Nuts', 'Hip Hop');
INSERT INTO Musica VALUES(4, 'Yofukashino Uta', 'Creepy Nuts', 'Hip Hop');
INSERT INTO Musica VALUES(5, 'Sukuna (Jujutsu Kaisen) | ARMAGEDOM', 'AniRap', 'Rap Geek');
INSERT INTO Musica VALUES(6, 'Yuta Okkotsu (Jujutsu Kaisen)', 'M4rkim', 'Rap Geek');
INSERT INTO Musica VALUES(7, 'After Dark', 'Mr. Kitty', 'Música eletrônica');
INSERT INTO Musica VALUES(8, 'Can You Feel My Heart', 'Oliver Sykes', 'Música eletrônica');


-- a) Exibir todos os dados da tabela.
SELECT * FROM Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.
SELECT titulo, artista FROM Musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
SELECT * FROM Musica WHERE genero = 'Rap Geek';

-- d) Exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM Musica WHERE artista = 'AniRap'

-- e) Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM Musica ORDER BY titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM Musica ORDER BY artista DESC;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE 'Y%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%k';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Musica WHERE genero LIKE '_i%'

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%r_'

-- k) Elimine a tabela.
DROP TABLE Musica;

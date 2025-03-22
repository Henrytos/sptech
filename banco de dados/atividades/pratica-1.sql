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
SELECT * FROM Musica WHERE artista = 'AniRap';

-- e) Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM Musica ORDER BY titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM Musica ORDER BY artista DESC;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE 'Y%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%k';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Musica WHERE genero LIKE '_i%';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%r_';

-- k) Elimine a tabela.
DROP TABLE Musica;


-- --------------------------Exercício 3--------------------------
CREATE TABLE Filme(
  idFilme INT PRIMARY KEY,
  titulo VARCHAR(50),
  genero VARCHAR(40),
  diretor VARCHAR(40)
);

INSERT INTO Filme VALUES(1, 'Agente Oculto', 'Ação', 'Anthony Russo');
INSERT INTO Filme VALUES(2, 'Vingadores: Ultimato', 'Ação', 'Anthony Russo');
INSERT INTO Filme VALUES(3, 'As Aventuras de Pi', 'Aventura', 'Ang Lee');
INSERT INTO Filme VALUES(4, 'Projeto Gemini', 'Ficção científica', 'Ang Lee');
INSERT INTO Filme VALUES(5, 'Jujutsu Kaisen 0', 'Anime', 'Sunghoo Park');
INSERT INTO Filme VALUES(6, 'Your Name', 'Animação', 'Makoto Shinkai');
INSERT INTO Filme VALUES(7, 'Suzume', 'Animação', 'Makoto Shinkai');

-- • Exibir todos os dados da tabela.
SELECT * FROM Filme;

-- • Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM Filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM Filme WHERE genero = 'Animação';

-- • Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM Filme WHERE diretor = 'Anthony Russo';

-- • Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM Filme ORDER BY titulo;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM Filme ORDER BY diretor DESC;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE 'A%';

-- • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
SELECT * FROM Filme WHERE diretor LIKE '%k';

-- • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Filme WHERE genero LIKE '_n%';

-- • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE '%t_';

-- • Elimine a tabela.
DROP TABLE Filme;


# --------------------------EXERCICIO 4 --------------------------
USE sprint1;

# Criar a tabela chamada Professor
CREATE TABLE Professor(
	idProfessor INT PRIMARY KEY,
  nome VARCHAR(50),
  especialidade VARCHAR(40),
  dtNasc DATE
);

# Escreva e execute os comandos para:
INSERT INTO Professor VALUES(1, 'VIvian', 'Banco de Dados', '1983-01-01');
INSERT INTO Professor VALUES(2, 'Petry', 'Tecnologia da informação', '1983-02-01');
INSERT INTO Professor VALUES(3, 'Kaline', 'Socio emocional', '1983-03-01');
INSERT INTO Professor VALUES(4, 'Jp', 'Algoritimo', '1983-04-01');
INSERT INTO Professor VALUES(5, 'Celia', 'Arquitetura de computadores', '1983-05-01');
INSERT INTO Professor VALUES(6, 'Kaori', 'Algoritimo', '2000-04-01');
INSERT INTO Professor VALUES(7, 'Paula', 'Socio emocional', '1983-010-01');

# a) Exibir todos os dados da tabela.
SELECT * FROM Professor;

# b) Exibir apenas as especialidades dos professores.
SELECT especialidade FROM Professor;

# c) Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM Professor WHERE especialidade = 'Algoritimo';

# d) Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Professor ORDER BY nome;

# e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM Professor ORDER BY dtNasc DESC;

# f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE 'J%';

# g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%a';

# h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '_a%';

# i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%a_';

# j) Elimine a tabela.
DROP TABLE Professor;

-- ----------------------------Exercício 5----------------------------

USE sprint1;

CREATE TABLE Jogo(
	idJogo INT PRIMARY KEY,
  nome VARCHAR(50),
  comentario VARCHAR(200),
  ranking INT 
);

INSERT INTO Jogo VALUES(1, 'Genshin Impact', 'jogo de mundo aberto...', 1);
INSERT INTO Jogo VALUES(2, 'Fortnite', 'jogo batle royale onde podemos construir...', 2);
INSERT INTO Jogo VALUES(3, 'Clash Royale', 'Jogo de batalha de cartas...', 3);
INSERT INTO Jogo VALUES(4, 'Among us', 'jogo de misão em grupo onde há um impostor na nave...', 4);
INSERT INTO Jogo VALUES(5, 'Horizon', 'jogo de mundo aberto, em mundo pós apolitico...', 5);
INSERT INTO Jogo VALUES(6, 'CS GO', 'Jogo de tiro em primeira pessoa...', 6);
INSERT INTO Jogo VALUES(7, 'Dark Souls', 'jogo dificil dms....',7);
INSERT INTO Jogo VALUES(8, 'MInecraft', 'jogo de mundo aberto feito de blocos....',8);
# a) Exibir todos os dados da tabela.
SELECT * FROM Jogo;

# b) Exibir apenas os nomes dos jogos.
SELECT nome FROM Jogo;

# c) Exibir apenas o comentário de um determinado jogo.
SELECT comentario FROM Jogo WHERE idJogo = 1;

# d) Exibir os dados da tabela ordenados pelo nome do jogo.
SELECT * FROM Jogo ORDER BY nome;

# e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.
SELECT * FROM Jogo ORDER BY ranking DESC;

# f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE 'C%';

# g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '%e';

# h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '_o%';

# i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '%l_';

# j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.
SELECT * FROM Jogo WHERE nome <> 'Minecraft';

# k) Elimine a tabela.
DROP TABLE Jogo;
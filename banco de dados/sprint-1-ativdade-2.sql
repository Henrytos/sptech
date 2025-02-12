
#  ------------------ EXERCICIO 1 ------------------

USE sprint1;

# • Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
#  tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
#  (int, representando a quantidade de medalhas que o atleta possui)

CREATE TABLE Atleta(
	idAtleta INT PRIMARY KEY AUTO_INCREMENT ,
  nome VARCHAR(40),
  modalidade VARCHAR(40),
  qtdMedalha INT
);


# • Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
# e pelo menos 5 atletas.
INSERT INTO Atleta VALUES(default, 'henry', 'volei', 1);
INSERT INTO Atleta VALUES(default, 'ciclano', 'volei', 2);
INSERT INTO Atleta VALUES(default, 'deutrano', 'fultebool', 3);
INSERT INTO Atleta VALUES(default, 'fulano', 'fultebool', 4);
INSERT INTO Atleta VALUES(default, 'vivian', 'volei', 5);
INSERT INTO Atleta VALUES(default, 'frizza', 'fultebool', 6);
INSERT INTO Atleta VALUES(default, 'petry', 'natação', 7);
INSERT INTO Atleta VALUES(default, 'paula', 'natação', 8);
INSERT INTO Atleta VALUES(default, 'joão', 'ping pong', 9);

# • Exibir todos os dados da tabela.
SELECT * FROM Atleta;

# • Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta SET qtdMedalha = 10 WHERE idAtleta = 1;

# • Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 10 WHERE idAtleta = 2 OR idAtleta = 3;

# • Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = 'fulano vieira' WHERE idAtleta = 4;

# • Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

# • Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = '1990-10-10';

# • Excluir o atleta com o id=5;
DELETE FROM Atleta WHERE idAtleta = 5; 

# • Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM Atleta WHERE modalidade <> 'natação';

# • Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta WHERE qtMedalha >= 3;

# • Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

# • Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESC Atleta;

# • Limpar os dados da tabela;
TRUNCATE Atleta;



#  ------------------ EXERCICIO 2 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
# Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
# (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
# Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
# música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
# menos umas 7 músicas.

USE sprint1;
DROP TABLE Musica;

CREATE TABLE Musica(
		idMusica INT PRIMARY KEY AUTO_INCREMENT, 
  	titulo VARCHAR(40),
	  artista VARCHAR(40),
  	genero VARCHAR(40)
);

INSERT INTO Musica VALUES(default, 'Feiticeiros (Jujutsu Kaisen)', 'M4rkim', 'Rap Geek');
INSERT INTO Musica VALUES(default, 'Nova Geração (Maki, Hakari e Yuta)', 'AniRap', 'Rap Geek');
INSERT INTO Musica VALUES(default, 'Bling‐Bang‐Bang‐Born', 'Creepy Nuts', 'Hip Hop');
INSERT INTO Musica VALUES(default, 'Yofukashino Uta', 'Creepy Nuts', 'Hip Hop');
INSERT INTO Musica VALUES(default, 'Sukuna (Jujutsu Kaisen) | ARMAGEDOM', 'AniRap', 'Rap Geek');
INSERT INTO Musica VALUES(default, 'Yuta Okkotsu (Jujutsu Kaisen)', 'M4rkim', 'Rap Geek');
INSERT INTO Musica VALUES(default, 'After Dark', 'Mr. Kitty', 'Música eletrônica');
INSERT INTO Musica VALUES(default, 'Can You Feel My Heart', 'Oliver Sykes', 'Música eletrônica');

# Execute os comandos para:
# a) Exibir todos os dados da tabela.
SELECT * FROM Musica;

# b) Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE Musica ADD COLUMN curtidas INT;

# c) Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE Musica SET curtidas = 0;
-- OR
UPDATE Musica SET curtidas = 15 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 16 WHERE idMusica = 2;
UPDATE Musica SET curtidas = 17 WHERE idMusica = 3;
UPDATE Musica SET curtidas = 18 WHERE idMusica = 4;
UPDATE Musica SET curtidas = 19 WHERE idMusica = 5;
UPDATE Musica SET curtidas = 20 WHERE idMusica = 6;
UPDATE Musica SET curtidas = 21 WHERE idMusica = 7;
UPDATE Musica SET curtidas = 22 WHERE idMusica = 8;

# d) Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80); 

# e) Atualizar a quantidade de curtidas da música com id=1;
UPDATE Musica SET curtidas = 10 WHERE idMusica = 1;

# f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE Musica SET curtidas = 10 WHERE idMusica = 2 OR idMusica = 3;

# g) Atualizar o nome da música com o id=5;
UPDATE Musica SET titulo = 'ARMAGEDOM' WHERE idMusica = 5;

# h) Excluir a música com o id=4;
DELETE FROM Musica WHERE idMusica = 4;

# i) Exibir as músicas onde o gênero é diferente de funk;
SElECT * FROM Musica WHERE genero <> 'funk';

# j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM Musica WHERE curtidas >= 20;

# k) Descrever os campos da tabela mostrando a atualização do campo artista;
DESCRIBE Musica;

# l) Limpar os dados da tabela;
TRUNCATE Musica;



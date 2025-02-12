
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

#  ------------------ EXERCICIO 3 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;
# Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
# (tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
# Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
# filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
# uns 7 filmes.

CREATE TABLE Filme(
	idFilme INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50),
  genero VARCHAR(40),
  diretor VARCHAR(40)
);  

INSERT INTO Filme VALUES(DEFAULT, 'Agente Oculto', 'Ação', 'Anthony Russo');
INSERT INTO Filme VALUES(DEFAULT, 'Vingadores: Ultimato', 'Ação', 'Anthony Russo');
INSERT INTO Filme VALUES(DEFAULT, 'As Aventuras de Pi', 'Aventura', 'Ang Lee');
INSERT INTO Filme VALUES(DEFAULT, 'Projeto Gemini', 'Ficção científica', 'Ang Lee');
INSERT INTO Filme VALUES(DEFAULT, 'Jujutsu Kaisen 0', 'Anime', 'Sunghoo Park');
INSERT INTO Filme VALUES(DEFAULT, 'Your Name', 'Animação', 'Makoto Shinkai');
INSERT INTO Filme VALUES(DEFAULT, 'Suzume', 'Animação', 'Makoto Shinkai');

# Execute os comandos para:
# • Exibir todos os dados da tabela.
SELECT * FROM Filme;

# • Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);

# • Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE Filme SET protagonista = 'ciclano' WHERE idFilme= 1;
UPDATE Filme SET protagonista = 'homen de ferro' WHERE idFilme = 2;
UPDATE Filme SET protagonista = 'pi' WHERE idFilme = 3;
UPDATE Filme SET protagonista = 'will smith' WHERE idFilme = 4;
UPDATE Filme SET protagonista = 'yuta' WHERE idFilme = 5;
UPDATE Filme SET protagonista = 'deutrano' WHERE idFilme = 6;
UPDATE Filme SET protagonista = 'Suzume' WHERE idFilme = 7;

# • Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);

# • Atualizar o diretor do filme com id=5;
UPDATE Filme SET diretor = 'gege akutami' WHERE idFilme = 5; 

# • Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE Filme SET diretor = 'adlam sandler' WHERE idFilme IN (2, 7);

# • Atualizar o título do filme com o id=6;
UPDATE Filme SET titulo = 'Yur name 2' WHERE idFilme = 6; 

# • Excluir o filme com o id=3;
DELETE FROM Filme WHERE idFilme = 4;

# • Exibir os filmes em que o gênero é diferente de drama;
SELECT * FROM Filme WHERE genero <> 'drama';
SELECT * FROM Filme WHERE genero != 'drama';

# • Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM Filme WHERE genero = 'suspense'; 

# • Descrever os campos da tabela mostrando a atualização do campo protagonista e
# diretor;
DESCRIBE Filme;

# • Limpar os dados da tabela;
TRUNCATE Filme;

#  ------------------ EXERCICIO 4 ------------------
# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
# Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
# especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
# tabela.
# Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
# Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
# Procure inserir pelo menos uns 6 professores.
USE sprint1; 

DROP TABLE Professor;
CREATE TABLE Professor(
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  especialidade VARCHAR(40),
  dtNasc DATE
);

INSERT INTO Professor VALUES(DEFAULT, 'VIvian', 'Banco de Dados', '1983-01-01');
INSERT INTO Professor VALUES(DEFAULT, 'Petry', 'Tecnologia da informação', '1983-02-01');
INSERT INTO Professor VALUES(DEFAULT, 'Kaline', 'Socio emocional', '1983-03-01');
INSERT INTO Professor VALUES(DEFAULT, 'Jp', 'Algoritimo', '1983-04-01');
INSERT INTO Professor VALUES(DEFAULT, 'Celia', 'Arquitetura de computadores', '1983-05-01');
INSERT INTO Professor VALUES(DEFAULT, 'Kaori', 'Algoritimo', '2000-04-01');
INSERT INTO Professor VALUES(DEFAULT, 'Paula', 'Socio emocional', '1983-010-01');

# Execute os comandos para:
# a) Exibir todos os dados da tabela.
SELECT * FROM Professor;

# b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
# ‘assistente’ ou ‘titular’;

ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50) CHECK(funcao IN ('monitor', 'assistente', 'titular')) ;
-- or
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);
ALTER TABLE Professor ADD CONSTRAINT funcao CHECK(funcao IN ('monitor', 'assistente', 'titular'));
-- or
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);
ALTER TABLE Professor ADD CONSTRAINT CHK_Professor CHECK(funcao IN ('assistente', 'monitor', 'titular') );

# c) Atualizar os professores inseridos e suas respectivas funções;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 1;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 2;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 3;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 4;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 5;
UPDATE Professor SET funcao = 'assistente' WHERE idProfessor = 6;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 7;

# d) Inserir um novo professor;
INSERT INTO Professor VALUES(DEFAULT, 'xavier', 'pedagogia', '1940-09-23', 'titular');

# e) Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM Professor WHERE idProfessor = 5;

# f) Exibir apenas os nomes dos professores titulares;
SELECT * FROM Professor WHERE funcao = 'titular'; 

# g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
SELECT * FROM especialidade, dtNasc WHERE func =  'monitor';

# h) Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE Professor SET dtNasc = '1990-03-01' WHERE idProfessor = 3;   

# i) Limpar a tabela Professor;
TRUNCATE Professor;


#  ------------------ EXERCICIO 5 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
# Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
# (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
# Inserir dados na tabela, procure inserir pelo menos 3 cursos.
USE sprint1;
CREATE TABLE Curso(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  sigla VARCHAR(3),
  coordenador VARCHAR(50)
);

INSERT INTO Curso VALUES(DEFAULT, 'desenvolvimento sistemas', 'ds', '');
INSERT INTO Curso VALUES(DEFAULT, 'admnistração', 'adm', '');
INSERT INTO Curso VALUES(DEFAULT, 'desinger de interiores', 'di', '');
INSERT INTO Curso VALUES(DEFAULT, 'recursos humanos', 'rh', '');

# Execute os comandos para:
# a) Exibir todos os dados da tabela.
SElECT  * FROM Curso;

# b) Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

# c) Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WheRE sigla = 'ti';

# d) Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome;

# e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem
# decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

# f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 't%';

# g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%i';

# h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
# determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_i%';

# i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
# determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%i_';

# j) Elimine a tabela.
DROP TABLE Curso;


#  ------------------ EXERCICIO 6 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1;

# Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
# Epoca, Quatro Rodas, Claudia, etc).
# Escreva e execute os comandos para:
# • Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
# primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
# valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
# pelo sistema.

CREATE TABLE Revista(
  idRevista INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  categoria VARCHAR(30)
);

# • Inserir 4 registros na tabela, mas sem informar a categoria.
# Escreva e execute os comandos para:
INSERT INTO Revista VALUES(DEFAULT, 'Ultima hora', NULL);
INSERT INTO Revista VALUES(DEFAULT, 'O Globo', NULL);
INSERT INTO Revista VALUES(DEFAULT, 'Gazeta do povo', NULL);
INSERT INTO Revista VALUES(DEFAULT, 'Gazeta Mercantil', NULL);

# • Exibir todos os dados da tabela.
SElECT * FROM Revista;

# • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
# novamente para verificar se atualizou corretamente.
UPDATE Revista SET categoria = 'informativo' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'moda' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'financeira' WHERE idRevista = 3;

# • Insira mais 3 registros completos
INSERT INTO Revista VALUES(DEFAULT, 'sptehc jornal', 'informativo estudantil');
INSERT INTO Revista VALUES(DEFAULT, 'papel zona norte', 'informativo regional');
INSERT INTO Revista VALUES(DEFAULT, 'universal', 'envagelico');

# • Exibir novamente os dados da tabela.
SElECT * FROM Revista;

# • Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

# • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

# • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
# tamanho da coluna categoria
DESCRIBE Revista;

# • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

# • Exibir os dados da tabela.
SELECT * FROM Revista;

# • Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;


#  ------------------ EXERCICIO 7 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
USE sprint1; 

# Você vai criar uma tabela para armazenar os dados de Carros (como por ex: Gol, Fusca, Onix, HB20, Corola, etc).
# Escreva e execute os comandos para:
# • Criar a tabela chamada Carro para conter os campos: idCarro (int e chave primária da tabela), nome (varchar, tamanho 40), placa (char, tamanho 7). Os valores de idCarro devem iniciar com o valor 1000 e ser incrementado automaticamente pelo sistema.
# • Inserir 4 registros na tabela;
CREATE TABLE Carro(
	idCarro INT PRIMARY KEY AUTO_INCREMENT ,
  nome VARCHAR(40),
  placa CHAR(7) 
) AUTO_INCREMENT = 1000;

ALTER TABLE Carro AUTO_INCREMENT = 1000;

INSERT INTO Carro VALUES(DEFAULT, 'Gol', 'L23456G');
INSERT INTO Carro VALUES(DEFAULT, 'HB20', '023456H');
INSERT INTO Carro VALUES(DEFAULT, 'Onix', 'X23456O');
INSERT INTO Carro VALUES(DEFAULT, 'Sandero', 'O23456S');

# Escreva e execute os comandos para:
# • Exibir todos os dados da tabela.
SELECT * FROM Carro;

# • Insira mais 3 registros sem a placa dos carros.
INSERT INTO Carro(nome) VALUES('Tucson');
INSERT INTO Carro(nome) VALUES('Renegade');
INSERT INTO Carro(nome) VALUES('Hilux');

# • Exibir novamente os dados da tabela.
SELECT * FROM Carro;

# • Exibir a descrição da estrutura da tabela.
DESCRIBE Carro;

# • Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE Carro MODIFY COLUMN nome VARCHAR(28);

# • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
DESCRIBE Carro;

# • Acrescentar a coluna ano à tabela, que é char(4);
ALTER TABLE Carro ADD COLUMN ano CHAR(4);

# • Atualizar todos os dados nulos da tabela;
UPDATE Carro SET ano = '2015' WHERE idCarro = 1000;
UPDATE Carro SET ano = '2016' WHERE idCarro = 1001;
UPDATE Carro SET ano = '2017' WHERE idCarro = 1002;
UPDATE Carro SET ano = '2018' WHERE idCarro = 1003;
UPDATE Carro SET ano = '2019', placa = 'S23456T' WHERE idCarro = 1004;
UPDATE Carro SET ano = '2020', placa = 'E23456R' WHERE idCarro = 1005;
UPDATE Carro SET ano = '2021', placa = 'X23456H' WHERE idCarro = 1006;

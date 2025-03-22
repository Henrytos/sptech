
#  ------------------ EXERCICIO 5 ------------------

# No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
# Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
# (tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
# Inserir dados na tabela, procure inserir pelo menos 3 cursos.
USE sprint1;
DROP TABLE Curso;
CREATE TABLE Curso(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  sigla VARCHAR(3),
  coordenador VARCHAR(50)
);

INSERT INTO Curso VALUES(DEFAULT, 'desenvolvimento sistemas', 'ds', 'fulano');
INSERT INTO Curso VALUES(DEFAULT, 'admnistração', 'adm', 'ciclano');
INSERT INTO Curso VALUES(DEFAULT, 'desinger de interiores', 'di', 'deutrano');
INSERT INTO Curso VALUES(DEFAULT, 'recursos humanos', 'rh', 'vivian');

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
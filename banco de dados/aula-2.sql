USE sprint1;

# • Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
#  tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
#  (int, representando a quantidade de medalhas que o atleta possui)
DROP TABLE Atleta;

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
# • Descrever os campos da tabela mostrando a atualização do campo modalidade;
# • Limpar os dados da tabela;

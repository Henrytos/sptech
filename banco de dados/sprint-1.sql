-- Exercício 1:
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
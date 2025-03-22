CREATE DATABASE spritn2;

USE spritn2;

--  CRIAR TABELA RESPONSAVEL

CREATE TABLE Responsavel(
	idResponsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

INSERT INTO Responsavel(nome) VALUES 
('Andresa'),
('Joana');

--  CRIAR TABELA EMPRESSA
CREATE TABLE Empressa(
	idEmpressa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkResponsavel INT UNIQUE,
    
    CONSTRAINT fkEmpressaResponsa FOREIGN KEY(fkResponsavel) REFERENCES Responsavel(idResponsavel)
);

-- NUM relacionamento 1:1 a fk sempre vai ser unique , cardinalidade (0, 1), não pode ser inserido referencias inexistencia
INSERT INTO Empressa VALUES
(DEFAULT, 'c6 bank', 1),
(DEFAULT, 'stefanini', 2);


-- CRIAR TABELA ALUNO

DROP TABLE Aluno;

CREATE TABLE Aluno(
	ra CHAR(8) PRIMARY KEY ,
    nome VARCHAR(45),
    email VARCHAR(45),
    fkEmpressa INT,
    CONSTRAINT fkALunoEmpressa FOREIGN KEY (fkEmpressa) REFERENCES Empressa(idEmpressa)
); 

INSERT INTO Aluno(ra, nome, fkEmpressa) VALUES
('01251020', 'henry', 1),
('01251021', 'manu', 2)
;

SELECT * FROM Responsavel JOIN Empressa
ON idResponsavel = fkResponsavel;

SELECT Empressa.nome AS Empressa, Responsavel.nome AS Nome FROM Responsavel JOIN Empressa ON idResponsavel = fkResponsavel;

SELECT * FROM Empressa JOIN Responsavel ON idResponsavel = fkResponsavel;

SELECT Empressa.nome AS Empressa, Aluno.nome AS Aluno FROM Empressa JOIN Aluno ON idEmpressa=fkEmpressa;


-- INNER JOI = JOIN

SELECT a.nome as NomeALuno,
	e.nome AS NomeEmpressa,
	r.nome AS NomeReponsavel
    FROM Aluno as a JOIN Empressa AS e
    ON a.fkEmpressa = e.idEmpressa
    JOIN Responsavel AS r
    ON e.fkResponsavel = r.idResponsavel;

SELECT a.nome as NomeALuno,
	e.nome AS NOmeEmpressa,
	r.nome AS NomeReponsavel
    FROM Aluno as a JOIN empresa AS e
    ON a.fkEmpressa = e.idEmpressa
    JOIN responsavel AS r
    ON e.fkResponsavel = r.idReponsavel WHERE a.nome ='Yuri';

-- se criar primeiro tabela aluno

CREATE TABLE Aluno (
	ra CHAR(8) PRIMARY KEY,
    nome VARCHAR(45),
    email VARCHAR(45)
);


INSERT INTO Responsavel(nome) VALUES ('Ícaro');

SELECT * FROM Responsavel;

SELECT * FROM Responsavel JOIN Empressa ON idResponsavel = fkResponsavel;
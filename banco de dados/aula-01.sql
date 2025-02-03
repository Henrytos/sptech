-- TODOS OS COMANDO SÂO EM INGLES
-- TODO COMANDO TERMINA COM PONTO E VIRGULA
-- TODA TABELA TEM UMA CHAVE PRIMARIA 

-- CRIAR BANCO DE DADOS SPRINT1
CREATE DATABASE sprint1; 

-- UTILIZAR BANCO DE DADOS EXISTENTE
USE sprint1;

-- MOSTRAR BASES DE DADOS
SHOW DATABASES;

-- CRIAR NOSSA PRIMEIRA TABELA 

CREATE TABLE aluno(
	ra CHAR(8) PRIMARY KEY, -- idAluno INT PRIMARY KEY AUTO_INCREMENT
    nome VARCHAR(30),
    bairro VARCHAR(25)
);


-- COMO REGRA A CHAVE PRIMARIA É SEMPRE DO TIPO INTEIRO (INT)
-- SE TEM EXCEÇÃO COMO O RA, PODE SER OUTRA TIPAGEM


-- DESCREVER TABELA
DESCRIBE aluno;
DESC aluno;

-- MOSTRAR TABELAS CRIADAS
SHOW TABLES;

-- INSERIR DADOS
INSERT INTO aluno VALUES ('01251020', 'Henry', 'Flor de Maio');
INSERT INTO aluno VALUES ('01251089', 'Anne', 'Barroso');
INSERT INTO aluno VALUES ('01251008', 'João Victor', 'Cantiho do Céu');
INSERT INTO aluno (ra, nome) VALUES('01251057', 'Hygor');

-- EXIBIR DADOS 
SELECT ra, nome, bairro FROM aluno;
SELECT * FROM aluno;
SELECT ra ,nome FROM aluno;

-- EXIBIR OS ALUNOS QUE MORA EM 'Cantiho do Céu'


-- EXIBIR OS ALUNOS QUE MORAM NO BAIRRO DIFERENTE 'Cantiho do Céu'
/* != === <> */
SELECT * FROM aluno WHERE bairro != 'Cantiho do Céu';
SELECT * FROM aluno WHERE bairro <> 'Cantiho do Céu';

-- EXIBIR O ALUNO QUE MORA EM FLOR DE MAIO E O ALUNO QUE MORA NO CANTIHO DO CEU 
SELECT * FROM  aluno WHERE bairro = 'Flor de Maio' OR bairro = 'Cantiho do Céu'; -- PRECISA SER OR NÂO AND(TABELA VERDADE)


SELECT * FROM  aluno WHERE bairro IN ('Flor de Maio', 'Cantiho do Céu'); -- PRECISA SER OR NÂO AND(TABELA VERDADE)

-- 

SELECT * FROM aluno;

-- exibir os nomes que começa com a letra h (COMEÇA)
SELECT * FROM aluno WHERE nome LIKE 'H%';

-- exibir os nomes que termina com a letra r (TERMINA)
SELECT * FROM aluno WHERE nome LIKE '%r';

-- exibir os nomes contain a letra y (CONTAIN)
SELECT nome FROM aluno WHERE nome LIKE '%y%';

-- EXIBIR OS NOMES ONDE A SEGUNDA LETRA é E
SELECT nome FROM aluno WHERE nome LIKE '_e%'; -- underine conta o caracter

SELECT * FROM aluno ;-- underline conta o caracter

-- EXIBIR ALUNOS ORDENADOS EM CRESCENTE PELO NOME 

SELECT * FROM aluno ORDER BY nome ASC;

-- EXIBIR ALUNOS ORDENADOS EM DECRESCENTE PELO NOME 
SELECT * FROM aluno ORDER BY nome DESC;

-- EXIBIR OS DADOS DOS ALUNOS QUE COMEÇAM H ORDERNADOS PELO BAIRRO

SELECT * FROM aluno WHERE nome LIKE 'H%' ORDER BY bairro ASC; -- ASC POR DEFAULT

-- EXIBIR OS NOMES QUE TEM  2 NOMES

SELECT * FROM aluno WHERE nome LIKE '% %';

SELECT * FROM aluno WHERE bairro LIKE '% % M%'
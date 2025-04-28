CREATE DATABASE sprint3;
USE sprint3;

CREATE TABLE aluno(
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dtNac DATE 
) AUTO_INCREMENT=100;

INSERT INTO aluno VALUES 
	(DEFAULT, 'Hugo', '2000-01-20'),
    (DEFAULT, 'Cássio', '1988-03-23'),
    (DEFAULT, 'Donelli', '1990-05-28');
    
CREATE TABLE curso(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cargaHoraria INT
);


INSERT INTO curso VALUES 
	(DEFAULT, 'Inglês', 100),
	(DEFAULT, 'Espanhol', 80),
	(DEFAULT, 'Mandarin', 120);
    
-- TABELA ASSOCIATIVA

CREATE TABLE matricula (
	idMatricula INT AUTO_INCREMENT,
    fkCurso INT,
    fkAluno INT,
    CONSTRAINT pkComposta PRIMARY KEY (idMatricula , fkCurso, fkALuno),
    nota DECIMAL(4,2),
    statusMat VARCHAR(45),
    dtMatricula DATE,
    CONSTRAINT fkAlunoMat FOREIGN KEY (fkALuno) REFERENCES aluno(idAluno),
	CONSTRAINT fkCursoMat FOREIGN KEY (fkCurso) REFERENCES curso(idCurso)
);

INSERT INTO matricula(idMatricula, fkAluno, fkCurso, nota,statusMat, dtMatricula) VALUES 
	(DEFAULT, 100, 1, 9.5, 'aprovado', '2024-01-01'),
    (DEFAULT, 100, 2, 4.5, 'reprovado', '2024-01-01'),
    (DEFAULT, 101, 1, NULL, 'cursando', '2024-01-01'),
    (DEFAULT, 102, 2, NULL, 'cursando', '2024-01-01');
    
    
SELECT 
	aluno.nome AS 'Nome', 
    curso.nome AS 'Curso', 
    IFNULL(matricula.nota, 'Sem Nota') AS 'Nota' 
    FROM aluno JOIN matricula 
    ON aluno.idAluno = matricula.fkAluno 
	RIGHT JOIN curso ON curso.idCurso = matricula.fkCurso WHERE fkAluno IS NULL;
    
SELECT 
	aluno.nome AS 'Nome', 
    curso.nome AS 'Curso', 
    IFNULL(matricula.nota, 'Sem Nota') AS 'Nota' 
    FROM matricula JOIN curso 
    ON curso.idCurso = matricula.fkCurso 
    RIGHT JOIN aluno
    ON aluno.idAluno IS NULL;
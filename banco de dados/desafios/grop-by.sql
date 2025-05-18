CREATE DATABASE EscolaOnline;
USE EscolaOnline;

-- Tabela Aluno
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

-- Tabela Curso
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    descricao TEXT
);

-- Tabela de relacionamento N:N: Aluno_Curso
CREATE TABLE Aluno_Curso (
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Entidade fraca: Acesso (chave composta)
CREATE TABLE Acesso (
    id_aluno INT,
    id_curso INT,
    data_acesso DATETIME,
    duracao_minutos INT,
    PRIMARY KEY (id_aluno, id_curso, data_acesso),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Alunos
INSERT INTO Aluno (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Carlos Souza', 'carlos.souza@email.com'),
('Beatriz Lima', 'beatriz.lima@email.com');

-- Cursos
INSERT INTO Curso (nome_curso, descricao) VALUES
('Lógica de Programação', 'Curso introdutório de lógica de programação.'),
('Banco de Dados', 'Curso de fundamentos e SQL com MySQL.');

-- Aluno_Curso (matrículas)
INSERT INTO Aluno_Curso (id_aluno, id_curso, data_inscricao) VALUES
(1, 1, '2024-05-01'),
(1, 2, '2024-05-02'),
(2, 1, '2024-05-03'),
(3, 2, '2024-05-04');

-- Acessos
INSERT INTO Acesso (id_aluno, id_curso, data_acesso, duracao_minutos) VALUES
(1, 1, '2024-05-10 08:00:00', 60),
(1, 2, '2024-05-11 09:30:00', 45),
(2, 1, '2024-05-12 14:00:00', 50),
(3, 2, '2024-05-13 16:15:00', 30);

# 🧪 Atividades — Total: 10 Itens
# Parte 1 – Compreensão e Manipulação de Dados
# Listar todos os alunos e os cursos em que estão inscritos.
SELECT * FROM Aluno JOIN Aluno_Curso ON Aluno.id_aluno = Aluno_Curso.id_aluno JOIN Curso ON Curso.id_curso = Aluno_Curso.id_curso;

# Dica: JOIN entre Aluno, Aluno_Curso e Curso.

# Exibir todos os acessos feitos pela aluna “Ana Silva”, com data e duração.
SELECT Aluno.nome, Acesso.data_acesso, Acesso.duracao_minutos FROM Aluno JOIN Acesso ON Aluno.id_aluno = Acesso.id_aluno WHERE Aluno.nome = "Ana Silva";

# Listar os cursos que têm mais de 1 aluno inscrito.
SELECT Aluno_Curso.id_curso, Curso.nome_curso, COUNT(Aluno_Curso.id_aluno) qtd_aluno FROM Aluno_Curso JOIN Curso ON Aluno_Curso.id_curso = Curso.id_curso GROUP BY Aluno_Curso.id_curso, Curso.id_curso HAVING COUNT(Aluno_Curso.id_curso) > 1; 
SELECT COUNT(Acesso.id_aluno) FROM Acesso GROUP BY Acesso.data_acesso;
# Dica: Use COUNT() e GROUP BY.

# Exibir a duração média dos acessos em cada curso.
SELECT AVG(Acesso.duracao_minutos) qtd_duracao, Curso.nome_curso FROM Acesso JOIN Curso ON Acesso.id_curso = Curso.id_curso GROUP BY Acesso.id_curso;

# Dica: Use AVG() agrupando por curso.

# Mostrar o total de minutos acessados por cada aluno em cada curso.
SELECT SUM(Acesso.duracao_minutos) qtd_duracao, Curso.nome_curso FROM Acesso JOIN Curso ON Acesso.id_curso = Curso.id_curso GROUP BY Acesso.id_curso;

# Dica: SUM(duracao_minutos) com GROUP BY.

# Parte 2 – Views e Análises
# Criar uma VIEW chamada vw_total_acessos que contenha:

# id_aluno, nome do aluno, id_curso, nome do curso, total de minutos acessados.
CREATE VIEW vw_total_acessos AS SELECT Aluno.id_aluno, Aluno.nome AS 'Nome do Aluno', Curso.id_curso, Curso.nome_curso AS 'Nome do Curso', SUM(Acesso.duracao_minutos) AS 'Tempo de acesso'
	FROM Aluno JOIN Acesso ON Aluno.id_aluno = Acesso.id_aluno
  JOIN Curso ON Curso.id_curso = Acesso.id_curso
  GROUP BY Acesso.id_aluno, Acesso.id_curso;

SELECT * FROM vw_total_acessos;

# Dica: Combine JOIN, SUM, GROUP BY.

# Criar uma VIEW chamada vw_estatisticas_curso com:

# id_curso, nome_curso, quantidade de alunos inscritos, tempo médio de acesso por curso.
CREATE VIEW vw_estatisticas_curso AS SELECT Curso.id_curso, Curso.nome_curso AS 'Nome do Curso', COUNT(DISTINCT Aluno_Curso.id_aluno) AS 'Quantidade de alunos', AVG(Acesso.duracao_minutos) AS 'Média de acesso'
	FROM Aluno JOIN Acesso ON Aluno.id_aluno = Acesso.id_aluno
  JOIN Curso ON Curso.id_curso = Acesso.id_curso
  JOIN Aluno_Curso ON Aluno_Curso.id_curso = Curso.id_curso 
  GROUP BY Acesso.id_curso, Curso.id_curso;
  

# Exibir os 3 alunos com mais tempo total de acesso (em minutos).
SELECT Aluno.*, SUM (Acesso.duracao_minutos) AS 'Tempo' FROM Aluno JOIN Acesso ON Aluno.id_aluno = Acesso.id_aluno GROUP BY Acesso.id_aluno ORDER BY Tempo DESC LIMIT 3;

# Dica: ORDER BY SUM(duracao_minutos) DESC LIMIT 3.

# Listar os cursos que nunca foram acessados.
INSERT INTO Curso (nome_curso, descricao) VALUES
('Socio emocional', 'Curso de desenvolvimento de habilidades socio emocionais(softs skills).');
SELECT Curso.* FROM Curso LEFT JOIN Acesso ON Acesso.id_curso =Curso.id_curso WHERE Acesso.id_aluno IS NULL; 

# Dica: Use LEFT JOIN entre Curso e Acesso.

# Mostrar a quantidade de acessos por data, agrupando por dia.
SELECT CONCAT(DAY(Acesso.data_acesso),'/',MONTH(Acesso.data_acesso),'/', YEAR(Acesso.data_acesso)) AS 'Data', COUNT(Acesso.id_aluno) AS 'Acessos' FROM Acesso GROUP BY Acesso.data_acesso; 

# Dica: Use DATE(data_acesso) e COUNT().

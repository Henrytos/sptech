CREATE DATABASE praticas;
USE praticas;

# Aluno(id_aluno, nome, email)
# Curso(id_curso, nome_curso, descricao)
# Aluno_Curso(id_aluno, id_curso, data_inscricao) — relacionamento N:N
# Acesso(id_aluno, id_curso, data_acesso, duracao_minutos) — entidade fraca (chave composta)

CREATE TABLE Aluno (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Curso(
	id_curso INT PRIMARY KEY AUTO_INCREMENT, 
  nome_curso VARCHAR(45) NOT NULL, 
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Aluno_Curso(
  id_aluno INT,
  id_curso INT,
  data_inscricao DATE,
  CONSTRAINT pk_composta PRIMARY KEY (id_aluno, id_curso),
  CONSTRAINT fk_aluno FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
  CONSTRAINT fk_curso FOREIGN KEY (id_curso) REFERENCES Curso (id_curso)
);

CREATE TABLE Acesso(
	id_aluno INT, 
  id_curso INT, 
  data_acesso DATE NOT NULL, 
  duracao_minutos INT NOT NULL,
  CONSTRAINT pk_acesso_composta PRIMARY KEY (id_aluno, id_curso),
  CONSTRAINT fk_acesso_aluno FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno),
  CONSTRAINT fk_acesso_curso FOREIGN KEY (id_curso) REFERENCES Curso (id_curso)
);

INSERT INTO Aluno (nome, email) VALUES
('Ana Silva', 'ana.silva@faculdadexyz.com'),
('Bruno Costa', 'bruno.costa@faculdadexyz.com'),
('Carla Mendes', 'carla.mendes@faculdadexyz.com');

INSERT INTO Curso (nome_curso, descricao) VALUES
('Programação em Python', 'Curso introdutório à linguagem Python'),
('Banco de Dados', 'Fundamentos de bancos de dados relacionais'),
('Desenvolvimento Web', 'Criação de aplicações web com HTML, CSS e JS');

INSERT INTO Aluno_Curso (id_aluno, id_curso, data_inscricao) VALUES
(1, 1, '2025-04-01'),
(1, 2, '2025-04-03'),
(2, 1, '2025-04-02'),
(2, 3, '2025-04-04'),
(3, 2, '2025-04-05'),
(3, 3, '2025-04-06');

INSERT INTO Acesso (id_aluno, id_curso, data_acesso, duracao_minutos) VALUES
(1, 1, '2025-05-10', 45),
(1, 2, '2025-05-11', 30),
(2, 1, '2025-05-10', 60),
(2, 3, '2025-05-12', 50),
(3, 2, '2025-05-10', 25),
(3, 3, '2025-05-11', 40);


# 1 - Listar todos os alunos e os cursos em que estão inscritos.
# Dica: JOIN entre Aluno, Aluno_Curso e Curso.

SELECT a.nome , c.nome_curso FROM Aluno a JOIN Aluno_Curso ac ON a.id_aluno = ac.id_aluno JOIN Curso c ON c.id_curso = ac.id_curso; 


# Exibir todos os acessos feitos pela aluna “Ana Silva”, com data e duração.
SELECT a.nome, c.nome_curso , ac.data_acesso, ac.duracao_minutos FROM Acesso ac JOIN Aluno a ON ac.id_aluno = a.id_aluno JOIN Curso c ON ac.id_curso=c.id_curso WHERE a.nome = 'Ana Silva';

# Listar os cursos que têm mais de 1 aluno inscrito.
# Dica: Use COUNT() e GROUP BY.


# Exibir a duração média dos acessos em cada curso.

# Dica: Use AVG() agrupando por curso.

# Mostrar o total de minutos acessados por cada aluno em cada curso.

# Dica: SUM(duracao_minutos) com GROUP BY.

# Criar uma VIEW chamada vw_total_acessos que contenha:

# id_aluno, nome do aluno, id_curso, nome do curso, total de minutos acessados.

# Dica: Combine JOIN, SUM, GROUP BY.

# Criar uma VIEW chamada vw_estatisticas_curso com:

# id_curso, nome_curso, quantidade de alunos inscritos, tempo médio de acesso por curso.

# Exibir os 3 alunos com mais tempo total de acesso (em minutos).

# Dica: ORDER BY SUM(duracao_minutos) DESC LIMIT 3.

# Listar os cursos que nunca foram acessados.

# Dica: Use LEFT JOIN entre Curso e Acesso.

# Mostrar a quantidade de acessos por data, agrupando por dia.

# Dica: Use DATE(data_acesso) e COUNT().

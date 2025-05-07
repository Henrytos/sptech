CREATE DATABASE ex8;
USE ex8;
DROP DATABASE ex8;


# Criar as tabelas no MySQL e executar as instruções relacionadas a seguir.
CREATE TABLE professor(
  idProfessor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  disciplina VARCHAR(40) NOT NULL,
  
  CONSTRAINT chkDiciplina CHECK(disciplina IN ('algoritmo', 'banco de dados', 'pesquisa e inovação', 'arquitetura computacional', 'intro so')) 
) AUTO_INCREMENT = 1000;

CREATE TABLE grupo(
  idGrupo INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE avaliacao(
  idAvaliacao INT AUTO_INCREMENT,
  fkProfessor INT,
  fkGrupo INT,
  nota INT NOT NULL,
  dtApres DATETIME NOT NULL,
  CONSTRAINT pkComposta PRIMARY KEY(idAvaliacao, fkProfessor, fkGrupo),
  CONSTRAINT fkAvaliacaoProfessor FOREIGN KEY (fkProfessor) REFERENCES professor(idProfessor),
  CONSTRAINT fkAvaliacaoGrupo FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo),
  CONSTRAINT chckNota CHECK(nota >= 0 AND nota <=10)
);

CREATE TABLE aluno(
  ra CHAR(8) PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  fkGrupo INT NOT NULL,
  CONSTRAINT fkAlunoGrupo FOREIGN KEY (fkGrupo) REFERENCES grupo(idGrupo),
  CONSTRAINT chkEmail CHECK (email LIKE '%@%') 
);



# Insira dados nas tabelas, de forma que tenha pelo menos 2 grupos cadastrados.

-- Inserindo dados na tabela 'professor'
INSERT INTO professor (nome, disciplina) VALUES
('João Silva', 'algoritmo'),
('Maria Oliveira', 'banco de dados'),
('Carlos Pereira', 'pesquisa e inovação');

-- Inserindo dados na tabela 'grupo'
INSERT INTO grupo (nome, descricao) VALUES
('Grupo Alpha', 'Desenvolvimento de um sistema de recomendação.'),
('Grupo Beta', 'Análise de desempenho de algoritmos de ordenação.'),
('Grupo Gama', 'Estudo sobre inteligência artificial aplicada à saúde.');

-- Inserindo dados na tabela 'aluno'
INSERT INTO aluno (ra, nome, email, fkGrupo) VALUES
('01251020', 'Ana Souza', 'ana.souza@email.com', 1),
('01251021', 'Pedro Santos', 'pedro.santos@email.com', 1),
('01251022', 'Victor souza', 'victor.souza@email.com', 1),
('01251023', 'Lays abreu', 'lays.abreu@email.com', 1),
('01251030', 'Mariana Costa', 'mariana.costa@email.com', 2),
('01251031', 'Mariana koga', 'marina.koga@email.com', 2),
('01251032', 'Lucas Valdez', 'lucas.valdez@email.com', 2),
('01251033', 'Beatriz Ferreira', 'bia.ferreira@email.com', 2),
('01251034', 'Lucas Oliveira', 'lucas.oliveira@email.com', 2),
('01251040', 'Fernanda Rocha', 'fernanda.rocha@email.com', 3),
('01251041', 'Emanuelle oliveira', 'manu.oli@email.com', 3),
('01251042', 'João victor', 'joao.victor@email.com', 3),
('01251043', 'Carlinhos joão', 'carlinhos@gmail.com', 3),
('01251044', 'Ezequiel', 'ezikas@email.com', 3);

-- Inserindo dados na tabela 'avaliacao'
INSERT INTO avaliacao (fkProfessor, fkGrupo, nota, dtApres) VALUES
(1000, 1, 9, '2025-05-15 19:00:00'),
(1000, 2, 8, '2025-05-15 19:00:00'),
(1001, 2, 8, '2025-05-16 20:30:00'),
(1001, 3, 7, '2025-05-22 14:00:00'),
(1002, 1, 7, '2025-05-22 14:00:00'),
(1002, 3, 10, '2025-05-23 16:45:00');

# Após inserir dados nas tabelas:

# Se for necessário, fazer os acertos da(s) chave(s) estrangeira(s).

# Exibir os dados dos grupos e os dados de seus respectivos alunos.
SELECT grupo.nome AS 'Nomde do grupo', grupo.descricao AS 'Descrição do grupo', aluno.nome AS 'Nome integrante', aluno.email AS 'Email', aluno.ra AS 'RA' FROM grupo JOIN aluno ON aluno.fkGrupo = grupo.idGrupo;

# Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
SELECT grupo.nome AS 'Nomde do grupo', grupo.descricao AS 'Descrição do grupo', aluno.nome AS 'Nome integrante', aluno.email AS 'Email', aluno.ra AS 'RA' FROM grupo JOIN aluno ON aluno.fkGrupo = grupo.idGrupo WHERE grupo.idGrupo = (SELECT idGrupo FROM grupo ORDER BY idGrupo DESC LIMIT 1);

# Exibir a média das notas atribuídas aos grupos, no geral.
SELECT AVG(nota) 'Média' FROM avaliacao;

# Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
SELECT MAX(nota) 'Nota Maxima', MIN(nota) 'Nota Minima' FROM avaliacao;

# Exibir a soma das notas dadas aos grupos, no geral.
SELECT AVG(nota) 'Média' FROM avaliacao;

# Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação.
SELECT p.nome AS 'Nome Professor', a.nota AS 'Nota' ,g.nome AS 'Nome do grupo', g.descricao AS 'Descrição do grupo', DATE(a.dtApres) AS 'Data da apresentação', TIME(a.dtApres) AS 'Hora da apresentação' FROM professor AS p JOIN avaliacao AS a ON a.fkProfessor = p.idProfessor JOIN grupo AS g ON a.fkGrupo = g.idGrupo; 

# Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.
SELECT p.nome AS 'Nome Professor', a.nota AS 'Nota' ,g.nome AS 'Nome do grupo', g.descricao AS 'Descrição do grupo', DATE(a.dtApres) AS 'Data da apresentação', TIME(a.dtApres) AS 'Hora da apresentação' FROM professor AS p JOIN avaliacao AS a ON a.fkProfessor = p.idProfessor JOIN grupo AS g ON a.fkGrupo = g.idGrupo WHERE a.fkGrupo = 2;

# Exibir os nomes dos grupos que foram avaliados por um determinado professor.
SELECT g.nome AS 'Nome do Grupo' ,a.nota AS 'Nota' ,p.nome AS 'Nome do professor' FROM professor AS p JOIN avaliacao AS a ON a.fkProfessor = p.idProfessor JOIN grupo AS g ON a.fkGrupo = g.idGrupo WHERE a.fkProfessor = 1000;

# Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação.
SELECT p.nome AS 'Nome Professor', a.nota AS 'Nota' , s.nome 'Nome do integrante',g.nome AS 'Nome do grupo', g.descricao AS 'Descrição do grupo', DATE(a.dtApres) AS 'Data da apresentação', TIME(a.dtApres) AS 'Hora da apresentação' FROM professor AS p JOIN avaliacao AS a ON a.fkProfessor = p.idProfessor JOIN grupo AS g ON a.fkGrupo = g.idGrupo JOIN aluno AS s ON s.fkGrupo = g.idGrupo; 

# Exibir a quantidade de notas distintas.
SELECT COUNT(DISTINCT nota) AS 'Quantidade de notas' FROM avaliacao;

# Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor.
SELECT professor.idProfessor, professor.nome, AVG(avaliacao.nota) AS 'Média', SUM(avaliacao.nota) AS 'Soma' FROM professor JOIN avaliacao ON avaliacao.fkProfessor = professor.idProfessor GROUP BY professor.nome, professor.idProfessor;

# Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.
SELECT grupo.idGrupo, grupo.nome, AVG(avaliacao.nota) AS 'Média', SUM(avaliacao.nota) AS 'Soma' FROM grupo JOIN avaliacao ON avaliacao.fkGrupo = grupo.idGrupo GROUP BY grupo.idGrupo;

# Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.
SELECT professor.idProfessor , professor.nome , MIN(avaliacao.nota) AS 'Menor Avaliação', MAX(avaliacao.nota) AS 'Maior avaliação' FROM professor JOIN avaliacao ON avaliacao.fkProfessor = professor.idProfessor GROUP BY professor.idProfessor; 

# Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.
SELECT grupo.idGrupo, grupo.nome, MIN(avaliacao.nota) AS 'Menor Avaliação', MAX(avaliacao.nota) AS 'Maior avaliação' FROM grupo JOIN avaliacao ON avaliacao.fkGrupo = grupo.idGrupo GROUP BY grupo.idGrupo; 
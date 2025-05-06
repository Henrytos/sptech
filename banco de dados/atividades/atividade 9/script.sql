CREATE DATABASE ex8;
USE ex8;
DROP DATABASE ex8;

CREATE TABLE professor(
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  disciplina VARCHAR(40) NOT NULL,
  
  CONSTRAINT chkDiciplina CHECK(disciplina IN ('algortimo', 'banco de dados', 'pesquisa e inovção', 'arquitetura computacional', 'intro so')) 
) AUTO_INCREMENT = 1000;

CREATE TABLE grupo(
  idGrupo INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE avaliacao(
	fkProfessor INT,
  fkGrupo INT,
  nota INT NOT NULL,
  dtApres DATETIME NOT NULL,
  CONSTRAINT pkComposta PRIMARY KEY(fkProfessor, fkGrupo),
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

# Criar as tabelas no MySQL e executar as instruções relacionadas a seguir.

# Insira dados nas tabelas, de forma que tenha pelo menos 2 grupos cadastrados.

# Após inserir dados nas tabelas:

# Se for necessário, fazer os acertos da(s) chave(s) estrangeira(s).

# Exibir os dados dos grupos e os dados de seus respectivos alunos.

# Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.

# Exibir a média das notas atribuídas aos grupos, no geral.

# Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.

# Exibir a soma das notas dadas aos grupos, no geral.

# Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da avaliação.

# Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.

# Exibir os nomes dos grupos que foram avaliados por um determinado professor.

# Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação.

# Exibir a quantidade de notas distintas.

# Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor.

# Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.

# Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.

# Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo.

CREATE DATABASE AlunoProjeto;
USE AlunoProjeto;

-- - Criar as tabelas equivalentes à modelagem.
CREATE TABLE alunos(
	ra CHAR(8) ,
    nome VARCHAR(45),
    telefone CHAR(17),
    fkRepresentante CHAR(8) NOT NULL,
    fkProjeto INT NOT NULL,	
    CONSTRAINT PRIMARY KEY (ra, fkRepresentante),
    CONSTRAINT fkAlunoProjeto FOREIGN KEY (fkProjeto) REFERENCES projetos(idProjeto),
    CONSTRAINT fkAlunoRepresentante FOREIGN KEY (fkRepresentante) REFERENCES alunos(ra)
);

CREATE TABLE projetos(
	idProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(255)
);

-- - Inserir dados nas tabelas.
INSERT INTO projetos (nome, descricao) VALUES
('Sistema de Gestão Escolar', 'Desenvolvimento de um sistema para gerenciamento de escolas'),
('Aplicativo de Saúde', 'Criação de um app para monitoramento de saúde e bem-estar');

INSERT INTO alunos (ra, nome, telefone, fkRepresentante, fkProjeto) VALUES
('01251021', 'João Silva', '(11) 99999-1111', '01251021', 1), -- João é o próprio representante
('01251022', 'Maria Oliveira', '(11) 99999-2222', '01251021', 1),
('01251023', 'Carlos Souza', '(11) 99999-3333', '01251023', 2), -- Carlos é o próprio representante
('01251024', 'Ana Pereira', '(11) 99999-4444', '01251023', 2);

-- - Exibir todos os dados de cada tabela criada, separadamente.
SELECT ra AS 'RA do aluno', nome AS 'Nome do aluno', telefone AS 'Telefone do aluno' FROM alunos AS aluno;
SELECT idProjeto AS 'Identificador', nome AS 'Nome do projeto do aluno', descricao AS 'Descrição do Projeto' FROM projetos ;

-- - Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação.


-- - Exibir os dados dos alunos e dos projetos correspondentes.
SELECT aluno.ra AS 'RA do aluno', aluno.nome AS 'Nome do aluno', aluno.telefone AS 'Telefone do aluno',
projeto.nome AS 'Nome do projeto', projeto.descricao AS 'Descrição do Projeto'
FROM  alunos AS aluno JOIN projetos AS projeto 
ON aluno.fkProjeto = projeto.idProjeto;

-- - Exibir os dados dos alunos e dos seus representantes.
SELECT aluno.ra AS 'RA do aluno', aluno.nome AS 'Nome do aluno', aluno.telefone AS 'Telefone do aluno',
representante.ra AS 'RA do representante',representante.nome AS 'Nome do representante', representante.telefone AS 'Telefone do Representante'
FROM  alunos AS aluno JOIN alunos AS representante 
ON aluno.fkRepresentante = representante.ra ;

-- - Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
SELECT aluno.ra AS 'RA do aluno', aluno.nome AS 'Nome do aluno', aluno.telefone AS 'Telefone do aluno',
projeto.nome AS 'Nome do projeto', projeto.descricao AS 'Descrição do Projeto'
FROM  alunos AS aluno JOIN projetos AS projeto 
ON aluno.fkProjeto = projeto.idProjeto WHERE projeto.nome = 'Aplicativo de Saúde';



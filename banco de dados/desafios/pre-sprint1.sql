CREATE DATABASE presprint2;

USE presprint2;

# 1. Crie a modelagem correspondente ao cenário do exercício.
CREATE TABLE aluno(
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  dtNasc DATE, 
  matricula CHAR(8) UNIQUE  
);

CREATE TABLE endereco(
	idEndereco INT PRIMARY KEY AUTO_INCREMENT ,
	logradouro VARCHAR(50),
  numero INT,
  bairro VARCHAR(100),
  cidade VARCHAR(100),
  estado VARCHAR(100),
  cep CHAR(8),
  fkAluno INT UNIQUE,
  FOREIGN KEY (fkAluno) REFERENCES aluno(idAluno) 
);

ALTER TABLE endereco AUTO_INCREMENT = 100;


# 2. Insira 10 registros de alunos e 10 registros de endereços.
INSERT INTO aluno (nome, dtNasc, matricula) VALUES 
('Ana Souza', '2004-03-15', '20230001'),
('Bruno Lima', '2003-11-20', '20230002'),
('Carlos Silva', '2005-06-05', '20230003'),
('Daniela Rocha', '2004-01-25', '20230004'),
('Eduardo Alves', '2003-07-14', '20230005'),
('Fernanda Dias', '2005-10-30', '20230006'),
('Gustavo Pires', '2004-09-10', '20230007'),
('Helena Costa', '2003-12-12', '20230008'),
('Igor Nascimento', '2005-08-01', '20230009'),
('Juliana Martins', '2004-04-22', '20230010');

INSERT INTO endereco (logradouro, numero, bairro, cidade, estado, cep, fkAluno) VALUES
('Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', '01001000', 1),
('Av. Paulista', 456, 'Bela Vista', 'São Paulo', 'SP', '01311000', 2),
('Rua da Alegria', 78, 'Jardins', 'Rio de Janeiro', 'RJ', '20040002', 3),
('Travessa da Paz', 12, 'Boa Viagem', 'Recife', 'PE', '51020010', 4),
('Rua do Sol', 321, 'Centro', 'Belo Horizonte', 'MG', '30120000', 5),
('Av. Atlântica', 1500, 'Copacabana', 'Rio de Janeiro', 'RJ', '22021000', 6),
('Rua Aurora', 88, 'Vila Mariana', 'São Paulo', 'SP', '04020060', 7),
('Av. Brasil', 987, 'Santa Efigênia', 'Belo Horizonte', 'MG', '30130110', 8),
('Rua Esperança', 234, 'Ponta Verde', 'Maceió', 'AL', '57035000', 9),
('Rua Harmonia', 45, 'Pinheiros', 'São Paulo', 'SP', '05435000', 10);


# 3. Exiba todos os alunos e seus endereços (logradouro, número, bairro,
# cidade, estado e CEP).


SELECT 
	endereco.logradouro AS 'Logradouro do aluno', 
  endereco.cep AS 'Cep do aluno',
  endereco.numero AS 'Numero do aluno',
  endereco.bairro AS 'Bairro do aluno',
  endereco.estado AS 'Estado do aluno',
  aluno.nome AS 'Nome do aluno',
  aluno.matricula AS 'Matricula do aluno' 
  FROM aluno JOIN endereco 
  ON endereco.fkAluno = aluno.idAluno;
  
  
# 4 . Atualize o endereço de um aluno específico (baseado no id do aluno), alterando o logradouro e o número.
UPDATE endereco SET logradouro = 'Rua da lua', numero=123 WHERE fkAluno = 5;

# 5. Exiba os endereços dos alunos cuja cidade seja "São Paulo".# 

SELECT 
	endereco.logradouro AS 'Logradouro do aluno', 
  endereco.cep AS 'Cep do aluno',
  endereco.numero AS 'Numero do aluno',
  endereco.bairro AS 'Bairro do aluno',
  endereco.estado AS 'Estado do aluno',
  aluno.nome AS 'Nome do aluno',
  aluno.matricula AS 'Matricula do aluno' 
  FROM aluno JOIN endereco 
  ON endereco.fkAluno = aluno.idAluno WHERE endereco.cidade = 'São Paulo';
  
#   6. Exclua os endereços cujo estado seja "Rio de Janeiro".
DELETE FROM endereco WHERE estado = 'Rio de Janeiro';

# 7. Adicione uma nova coluna à tabela de endereço para armazenar o país com
# tamanho máximo de 50 caracteres
ALTER TABLE endereco ADD COLUMN pais VARCHAR(50);


# 8. Exclua os endereços de alunos cujo bairro tenha como segunda letra "a".
DELETE FROM endereco WHERE bairro LIKE '_a%';

# 9. Renomeie a coluna CEP para "codigoPostal" na tabela de endereço e exiba a
# estrutura atualizada da tabela.
ALTER TABLE endereco RENAME COLUMN cep TO codigoPostal;


# 10. Exiba os alunos e seus endereços ordenado pelo nome do aluno em ordem
# crescente.

SELECT 
	endereco.logradouro AS 'Logradouro do aluno', 
  endereco.codigoPostal AS 'Cep do aluno',
  endereco.numero AS 'Numero do aluno',
  endereco.bairro AS 'Bairro do aluno',
  endereco.estado AS 'Estado do aluno',
  aluno.nome AS 'Nome do aluno',
  aluno.matricula AS 'Matricula do aluno' 
  FROM aluno JOIN endereco 
  ON endereco.fkAluno = aluno.idAluno ORDER BY  aluno.nome;
  
#   11. Exiba a lista de todos os alunos que não possuem um endereço associado.
SELECT aluno.* FROM aluno LEFT JOIN endereco 
ON endereco.fkAluno = aluno.idAluno 
WHERE endereco.fkAluno IS NULL;

# 2. Exiba o nome do aluno e o logradouro do endereço, utilizando um alias
# "nomeAluno" para o nome do aluno e "logradouroEndereco" para o
# logradouro.
SELECT endereco.logradouro AS 'Logradouro do aluno', aluno.nome AS 'Nome do aluno'
  FROM aluno JOIN endereco ON endereco.fkAluno = aluno.idAluno;
  
#  13. Exiba os 5 primeiros registros de alunos com base na ordem alfabética dos
# nomes.

SELECT * FROM aluno ORDER BY nome LIMIT 5;

# 14. Exiba os alunos cujo nome não contém a letra "a".
SELECT * FROM aluno WHERE nome NOT LIKE '%a%';

# 15. Remova todos os registros da tabela aluno. Será necessário remover seus
# relacionamentos também.
TRUNCATE aluno;
TRUNCATE endereco;

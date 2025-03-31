USE spritn2;


CREATE DATABASE aula8;
USE aula8;

# Relacionamento forte, chave primaria simples; linha trasejada
# Relacionamento fraco, chave primaria composta; linha cheia

CREATE TABLE funcionario(
	idFunc INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  dtAdmisao DATE,
	# auto relacionamento
  fkSupervisor INT NOT NULL,
  CONSTRAINT fkFuncSupervisor FOREIGN KEY (fkSupervisor)  REFERENCES funcionario(idFunc)
);

INSERT INTO funcionario (nome, dtAdmisao, fkSupervisor) VALUES ('alesandro', '2022-10-01', 1);

INSERT INTO funcionario (nome, dtAdmisao, fkSupervisor) VALUES ('gerson', '2022-10-01', 1);

INSERT INTO funcionario (nome, dtAdmisao, fkSupervisor) VALUES ('brandão', '2022-10-01', 1);


SELECT * FROM funcionario;

SELECT func.nome AS 'Funcionario' 
FROM funcionario AS func JOIN funcionario AS superv 
ON func.fkSupervisor = superv.idFunc;

SELECT funcionario.nome AS 'Nome do Funcionario', supervisor.nome AS 'Nome do Supervisor' 
FROM funcionario JOIN funcionario as supervisor 
ON funcionario.fkSupervisor = supervisor.idFunc;

# ENTIDADE FRACA(DEPENDE DE FUNCIONARIO);
CREATE TABLE dependente(
	idDep INT,
  fkFunc INT,
  CONSTRAINT pkComposta PRIMARY KEY (idDep, fkFunc),
  nome VARCHAR(45),
  parentesco VARCHAR(45),
  CONSTRAINT fkDepFunc FOREIGN KEY (fkFunc) REFERENCES funcionario(idFunc)
);

INSERT INTO dependente VALUES
	(1 ,1 ,'isabela', 'filha'),
  (2 ,1 ,'Ademir', 'filho'),
  (1 ,3 ,'João', 'filho');
  
SELECT funcionario.nome AS 'Funcionario', 
dependente.nome AS 'Dependente', 
dependente.parentesco AS 'Parentesco' 
FROM funcionario JOIN dependente 
ON idFunc = fkFunc;

# utilizar referencias da esquerda(LEFT)

SELECT funcionario.nome AS 'Funcionario',
IFNULL(dependente.nome, 'Não temo dependente') AS 'Dependente',
IFNULL(dependente.parentesco, 'Sem parentesco') AS 'Parentesco'
FROM funcionario LEFT JOIN dependente 
ON idFunc = fkFunc;

SELECT funcionario.nome AS Nome_func,
CASE WHEN dependente.nome IS NULL OR dependente.parentesco IS NULL THEN 'Sem dependente'
ELSE CONCAT(dependente.nome, ' e ', dependente.parentesco) END
FROM funcionario LEFT JOIN dependente
ON idFunc = fkFunc;


SELECT funcionario.nome AS 'Nome do Funcionario', 
supervisor.nome AS 'Nome do Supervisor',
dependente.nome AS 'Nome do Dependente'
FROM funcionario JOIN funcionario as supervisor 
ON funcionario.fkSupervisor = supervisor.idFunc
LEFT JOIN dependente 
ON funcionario.idFunc = dependente.fkFunc;

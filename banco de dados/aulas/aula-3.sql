SHOW DATABASES;
USE sprint1;
SHOW TABLES;

# AULA # - CONTRAINTS='restrição'

DROP TABLE sensor;

CREATE TABLE sensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
	tipo VARCHAR(30) NOT NULL,
  dtManutencao DATETIME , /*YYYY-MM-DD HH:MM:SS*/
  statusSensor VARCHAR(40), /* regra: ativo, inativo e manutençao*/
	CONSTRAINT chkStatus CHECK(statusSensor IN('Ativo', 'Inativo', 'Manutenção'))
);

# -----------------------------CHECK-----------------------------
# check é uma restrição para determinar um intervalo de valores

ALTER TABLE sensor DROP CHECK chkStatus;

INSERT INTO sensor VALUES(DEFAULT , 'DTH11', '2025-02-1 13:40:00', 'Pendente')
## Check constraint 'chkStatus' is violated.

INSERT INTO sensor(tipo, dtManutencao, statusSensor) VALUES 
('DTH11', '2025-02-17 13:40:00', 'Ativo'),
('LM35', '2025-02-16 13:40:00', 'Inativo');

SELECT * FROM sensor;
DESCRIBE sensor;


# CURRENT_TIMESTAMP();
ALTER TABLE sensor MODIFY COLUMN dtManutencao DATETIME DEFAULT CURRENT_TIMESTAMP() /*/data corrent do servidor*/; 

INSERT INTO sensor(tipo,  statusSensor) VALUES 
('DTH11', 'Manutenção');

# EXCLUIR UMA CONTRAINT
ALTER TABLE sensor DROP CONSTRAINT chkStatus;
INSERT INTO sensor VALUES(DEFAULT , 'DTH11', '2025-02-1 13:40:00', 'Pendente');
ALTER TABLE sensor ADD CONSTRAINT chkStatus CHECK (statusSensor IN('Ativo', 'Inativo', 'Manutenção', 'Pendente'));



# -----------------------------ALIAS-----------------------------
# apelido

SELECT idSensor AS id , tipo AS 'Tipo de sensor' , dtManutencao AS 'Data de Manutenção', statusSensor AS statusDoSensor  FROM sensor;

# -----------------------------CASE-----------------------------
# ebibição condicional
SELECT tipo, 
	CASE
	WHEN statusSensor = 'Manutençaõ' THEN 1
  ELSE 0
  END AS 'Caso' FROM sensor;

SELECT tipo, 
	CASE
	WHEN statusSensor = 'Manutençaõ' THEN 1
  WHEN statusSensor = 'Pendente' THEN 'Joga Fora'
  ELSE 0
  END AS 'Caso' FROM sensor;

# -----------------------------IFNULL-----------------------------
# se for nulo exiba outra coisa, mas como coluna ifNUll

SELECT * FROM sensor;
SELECT *, IFNULL(numSerie,'sem numero de serie') AS numeroSerie FROM sensor;





# ----------------------------- UNIQUE -----------------------------
# restrição de campo unico
# ADICIONAR UM CAMPO COM NUMERO DE SERIE DE UM SENSOR
# AUTO INCREMENT só em chave primaria
ALTER TABLE sensor ADD COLUMN numSerie CHAR(3) UNIQUE;

UPDATE sensor SET numSerie = '001' WHERE idSensor = 1;
UPDATE sensor SET numSerie = '002' WHERE idSensor = 2;


# ---------------------------- DEFAULT ----------------------------
# valores padões dentro de uma tabela 

ALTER TABLE sensor ADD COLUMN nome VARCHAR(20) DEFAULT 'sem nome';

INSERT INTO sensor(tipo) VALUES ('LM35');
INSERT INTO sensor(tipo, nome) VALUES ('LM35', 'Sensivel');
SELECT * FROM sensor;

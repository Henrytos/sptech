# funções matematicas
CREATE DATABASE fm3;
USE fm3;


CREATE TABLE registro(
	idRegistro INT PRIMARY KEY AUTO_INCREMENT,
  temperatura DOUBLE NOT NULL,
  dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO registro VALUES
	(DEFAULT, 14.8, DEFAULT),
	(DEFAULT, 14.8, DEFAULT),
  (DEFAULT, 15.7, DEFAULT),
  (DEFAULT, 20.3, DEFAULT),
  (DEFAULT, 21, DEFAULT);
  
SELECT * FROM registro;

# CONTAGEM
SELECT COUNT(temperatura) AS 'quantidade de registro' FROM registro; -- contabiliza quantidade de linhas com valor

# DIFERENTE
SELECT DISTINCT temperatura FROM registro; -- regitros diferente

# CONTAGEM DOS DIFERENTES 
SELECT COUNT(DISTINCT temperatura) AS 'quantidade de registros diferentes' FROM registro;

# TEMPERATURA MAXIMA
SELECT MAX(temperatura) AS 'temperatura maxima' FROM registro;

# TEMPERATURA MINIMA
SELECT MIN(temperatura) AS 'temperatura minima' FROM registro;

# TEMPERATUA MAXIMA E MINIMA
SELECT MAX(temperatura) AS 'temperatura maxima', MIN(temperatura) AS 'temperatura minima' FROM registro;


# SOMA 
SELECT SUM(temperatura) AS 'somas' FROM registro;

# SOMA SOMENTE DIFERENTE
SELECT SUM(DISTINCT temperatura) AS 'somas' FROM registro;

# TEMPERATURA MÈDiA
SELECT AVG(temperatura) AS 'temperatura média' FROM registro;

INSERT INTO registro VALUES
	(DEFAULT, 22.6, DEFAULT),
	(DEFAULT, 22.8, DEFAULT),
  (DEFAULT, 23.1, DEFAULT);
  
# ARRENDODAMENTO
SELECT ROUND(AVG(temperatura), 2) AS 'Média' FROM registro; -- se for 5 , arendodamenta para cima
SELECT ROUND(AVG(temperatura), 3) AS 'Média' FROM registro;

# TRUNCAR TRUNCATE()
SELECT TRUNCATE(AVG(temperatura), 1) FROM registro;

# 
  
UPDATE registro SET temperatura = (SELECT AVG(temperatura) FROM registro) WHERE idRegistro = 1;



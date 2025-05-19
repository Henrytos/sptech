


CREATE DATABASE hashString;
USE hashString;

CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE,
  senha VARCHAR(255) NOT NULL
);

SELECT * FROM users;

INSERT INTO users VALUES (DEFAULT, 'henry@gmail.com', SHA2('Hfra2006', 224));

SELECT * FROM users;
SELECT id FROM users where email = 'henry@gmail.com' and senha = sha2('Hfra2006', 224);
SELECT SHA2(senha,'Hfra2006') FROM users;







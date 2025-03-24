USE sprint2;

DROP TABLE pet;

CREATE TABLE pet(
	idPet INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  raca VARCHAR(45),
	fkMae INT,
  fkPai INT, 
  CONSTRAINT FOREIGN KEY fkPetMae (fkMae) REFERENCES pet(idPet),
  CONSTRAINT FOREIGN KEY fkPetPai (fkPai) REFERENCES pet(idPet)
);


INSERT INTO pet VALUES 
	(DEFAULT, 'Pai scooby doo', 'Vira lata', NULL, NULL),
  (DEFAULT, 'Mãe scooby doo', 'de raça', NULL, NULL),
  (DEFAULT, 'scooby doo', 'Vira lata', 7, 8);
  
 SELECT pai.idPet, filho.nome AS 'Filho', pai.nome AS 'Pai', mae.nome AS 'Mãe' FROM 
 		pet AS filho JOIN pet AS mae 
  	ON filho.fkMae = mae.idPet
 		JOIN pet AS pai 
  	ON filho.fkPAi = pai.idPEt;
 
 
 INSERT INTO pet(nome) VALUES
 		('Scooby doo avô (mãe da mãe)'),
    ('Scooby doo avó (pai do mãe)');
    
 SELECT * FROM pet;
 
-- RECURSIVIDADE , uma tabela que se relaciona consigo mesmo 
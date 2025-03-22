# BANCO DE DADOS
# EXERCÍCIOS – SPRINT I

# --------------------------------------------1 – Loja de Jogos--------------------------------------------
# No MySQL Workbench, crie o banco de dados "game_store".
# A loja de jogos “Game Store” estava passando dificuldades de organização pois o
# dono Mário, um simpático senhor italiano aposentado que trabalhou com
# encanamento durante sua juventude, não tinha controle do seu estoque de jogos.
# Para ajudar Mário a organizar sua loja de jogos, um estudante da SPTech propôs
# criar uma tabela chamada “jogo” que continha o id como número e chave primária
# que se autoincrementa, o nome do jogo com tamanho máximo de 30 caracteres, o
# nome do diretor do jogo com tamanho máximo de 30 caracteres, o gênero com
# tamanho de 30 caracteres, a data de lançamento, a nota do jogo (entre 0-10) e um
# campo para guardar a quantidade de unidades disponíveis.

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo(
  idJogo INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30),
  diretor VARCHAR(30),
  dtLancamento DATE,
  nota INT,
  quantidade INT DEFAULT 0,
  genero VARCHAR(30),
  CONSTRAINT chkQuantidade CHECK( quantidade >= 0 )
);

# 1. Insira pelo menos 5 registros para a tabela.

INSERT INTO jogo VALUES(DEFAULT, 'mario', 'henry', '1985-09-13', 10, 20,'aventura');
INSERT INTO jogo VALUES(DEFAULT, 'mortal konbat', 'matheus', '1997-10-13', 7, 20, 'luta');
INSERT INTO jogo VALUES(DEFAULT, 'gta', 'emilie', '2000-11-01', 8, 20, 'mundo aberto');
INSERT INTO jogo VALUES(DEFAULT, 'metal slug', 'duda', '1999-09-01', 5, 20, 'tiro');
INSERT INTO jogo VALUES(DEFAULT, 'sonic', 'lucas', '1995-10-10', 7, 20, 'corrida');
INSERT INTO jogo VALUES(DEFAULT, 'dark shouls', 'ezquiel', '2025-10-10', 7, 20, 'ação');
 
# 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que
# deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.

ALTER TABLE jogo ADD COLUMN tipoDeMidia VARCHAR(8);
ALTER TABLE jogo ADD CONSTRAINT chkTipoDeMidia CHECK(tipoDeMidia IN ('física', 'digital')); 

# 3. Atualize os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipoDeMidia = 'física' WHERE idJogo = 1;
UPDATE jogo SET tipoDeMidia = 'digital' WHERE idJogo = 2;
UPDATE jogo SET tipoDeMidia = 'física' WHERE idJogo = 3;
UPDATE jogo SET tipoDeMidia = 'digital' WHERE idJogo = 4;
UPDATE jogo SET tipoDeMidia = 'física' WHERE idJogo = 5;
UPDATE jogo SET tipoDeMidia = 'digital' WHERE idJogo = 6;

# 4. Exiba apenas os jogos com data de lançamento a partir de 2015.
SELECT * FROM jogo WHERE dtLancamento >= '2015-01-01';

# 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM jogo WHERE nome LIKE '%a%';

# 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM jogo WHERE diretor NOT LIKE '%e%'; 

# 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor
# não pode ser menor que 0 e nem maior que 10.
ALTER TABLE jogo ADD CONSTRAINT chkNota CHECK(0 <= nota AND nota <= 10);

# 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM jogo WHERE genero = 'ação' AND quantidade > 0;

# 9. Exclua os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE quantidade = 0;

# 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da
# tabela. 
ALTER TABLE jogo RENAME COLUMN diretor TO criador;


# --------------------------------------------2 – Esportes Olímpicos--------------------------------------------
# No MySQL Workbench, crie o banco de dados "olimpiadas".
# Casimiro, um fã apaixonado por esportes, decidiu que queria acompanhar de
# perto as Olimpíadas. Ele pediu ajuda a um amigo para criar uma tabela que
# armazenasse informações sobre os esportes praticados nas Olimpíadas.
# Eles criaram uma tabela chamada "esporte" que continha id como número e chave
# primária que se autoincrementa, nome que armazena o nome do esporte com
# limite de 40 caracteres, a categoria do esporte com limite de 20 caracteres que
# aceita apenas ("Individual" ou "Coletivo"), o número de jogadores que podem
# participar por equipe, estreia que armazena a data de quando o esporte estreou
# nas Olimpíadas e o nome do país de origem do esporte com até 30 caracteres.
CREATE DATABASE olimpiadas;
USE olimpiadas;
DROP TABLE esporte;
CREATE TABLE esporte(
	idEsporte INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  categoria VARCHAR(20),
  qtJogadores INT DEFAULT 0,
  estreia DATE, 
  nomeDoPais VARCHAR(30),
  CONSTRAINT chkCategoria CHECK(categoria IN ('Individual', 'Coletivo'))
);

# 1. Insira pelo menos 5 registros na tabela.
INSERT INTO esporte VALUES(DEFAULT, 'natação', 'Individual', 1, '2024-10-10','Canadá');
INSERT INTO esporte VALUES(DEFAULT, 'futebol', 'Coletivo', 11, '2024-10-10','Brasil');
INSERT INTO esporte VALUES(DEFAULT, 'volei', 'Coletivo', 6, '2024-10-10','Australia');
INSERT INTO esporte VALUES(DEFAULT, 'ping pong', 'Individual', 1, '2024-10-10','China');
INSERT INTO esporte VALUES(DEFAULT, 'skate', 'Individual', 1, '2024-10-10', 'EUA');

# 2. Altere a tabela para adicionar uma coluna popularidade que armazene a
# popularidade do esporte como um valor decimal entre 0 e 10 e exiba como
# ficou a estrutura da tabela.
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(3,1) DEFAULT 0.0;
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade CHECK(0 <= popularidade  AND popularidade <= 10 );

# 3. Atualize os registros para definir a popularidade dos esportes inseridos
# anteriormente.
UPDATE  esporte SET popularidade = 10.0 WHERE idEsporte = 1;
UPDATE  esporte SET popularidade = 9.0 WHERE idEsporte = 2;
UPDATE  esporte SET popularidade = 8.0 WHERE idEsporte = 3;
UPDATE  esporte SET popularidade = 7.0 WHERE idEsporte = 4;
UPDATE  esporte SET popularidade = 5.0 WHERE idEsporte = 5;
UPDATE  esporte SET popularidade = 7.0 WHERE idEsporte = 6;

# 4. Exiba os esportes ordenados por popularidade em ordem crescente.
SELECT * FROM esporte ORDER BY popularidade;

# 5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano
# 2000.
SELECT * FROM esporte WHERE estreia >= '2000-01-01';

# 6. Crie uma checagem para que não possa ser inserido valores dentro de
# estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE esporte ADD CONSTRAINT chkEstreia CHECK(estreia >= '1896-04-06');

# 7. Altere a tabela para excluir a regra de inserção de categoria, assim
# podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE esporte DROP CHECK chkCategoria;

# 8. Exiba apenas os esportes cujo nome do país de origem tenha "a" na
# segunda letra.
SELECT * FROM esporte WHERE nomeDoPais LIKE '_a%';

# 9. Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM esporte WHERE 4 < qtJogadores AND qtJogadores < 11;  

# 10. Remova os registros onde id seja 1, 3 e 5.
DELETE FROM esporte	WHERE idEsporte IN (1, 3, 5);


# --------------------------------------------3 – Desenhos Animados--------------------------------------------
# No MySQL Workbench, crie o banco de dados "desenho".
# Você foi contratado para criar um banco de dados que armazene informações
# detalhadas sobre desenhos animados exibidos na emissora. O objetivo é manter
# um catálogo com as seguintes informações.
# Para atender a essa necessidade, você propôs a criação de uma tabela com os
# seguintes campos: id, um número inteiro chave primária da tabela, este valor
# deverá ser autoincrementado a partir do 10. Título, um campo de texto com
# tamanho de 50 caracteres que armazenará o título do desenho animado. A data de
# lançamento um campo que armazenará a data de lançamento do desenho. O
# nome da emissora original, um campo de texto com tamanho de 50 caracteres.
# Classificação, um campo que armazenará a classificação indicativa do desenho.
# Status, um campo de texto com tamanho de 15 caracteres, que armazenará o
# status do desenho. Nota, um campo que armazenará a avaliação do desenho,
# permitindo valores de 1 a 5.
CREATE DATABASE desenho;
USE desenho;
DROP TABLE desenhoAnimado;
CREATE TABLE desenhoAnimado(
  idDesenhoAnimado INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50),
  dtLancamento DATE,
  nomeEmissora VARCHAR(50),
  textoDesenhoAnimado VARCHAR(50),
  classificacao INT,
  statusDesenho VARCHAR(15),
  nota INT,
  CONSTRAINT chkNota CHECK(nota >= 1 AND nota <= 5)
)AUTO_INCREMENT=10;

INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES 
('Tom e Jerry', '1940-02-10', 'CBS', 'Clássico rivalidade gato e rato', 7, 'exibindo', 5);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Scooby-Doo', '1969-09-13', 'Cartoon Network', 'Mistérios resolvidos por amigos', 7, 'finalizado', 4);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Pica-Pau', '1940-11-25', 'Universal', 'Pássaro travesso e esperto', 6, 'cancelado', 5);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Os Simpsons', '1989-12-17', 'Fox', 'Comédia sobre família disfuncional', 12, 'finalizado', 5);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Rick and Morty', '2013-12-02', 'Adult Swim', 'Viagens interdimensionais', 16, 'exibindo', 5);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Bob Esponja', '1999-05-01', 'Nickelodeon', 'Esponja do mar e amigos', 6, 'cancelado', 4);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Caverna do Dragão', '1983-09-17', 'CBS', 'Jovens presos em outro mundo', 10, 'exibindo', 4);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Hora de Aventura', '2010-04-05', 'Cartoon Network', 'Aventuras em Ooo', 8, 'cancelado', 5);
INSERT INTO desenhoAnimado (titulo, dtLancamento, nomeEmissora, textoDesenhoAnimado, classificacao, statusDesenho, nota)
VALUES('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 'Jornada de um dobrador de ar', 8, 'exibindo', 5);

-- Conferindo os dados
SELECT * FROM desenhoAnimado;

# 1. Exibir todos os dados da tabela
SELECT * FROM desenhoAnimado;

# 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos
SELECT * FROM desenhoAnimado WHERE classificacao <= 14;

# 3. Exibir todos os desenhos de uma mesma emissora original
SELECT * FROM desenhoAnimado WHERE nomeEmissora ='Nickelodeon';

# 4. Modificar o campo status, para que aceite apenas o status 'exibindo',
# 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra
# foi aplicada
ALTER TABLE desenhoAnimado ADD CONSTRAINT chkStatusDesenho CHECK(statusDesenho IN ('exibindo', 'finalizado', 'cancelado'));

# 5. Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE desenhoAnimado SET statusDesenho = 'finalizado' WHERE idDesenhoAnimado = 1;
UPDATE desenhoAnimado SET statusDesenho = 'finalizado' WHERE idDesenhoAnimado = 2;

# 6. Deletar a linha do desenho de ID 12
DELETE FROM desenhoAnimado WHERE idDesenhoAnimado = 12;

# 7. Exibir apenas os desenhos que comecem com uma determinada letra
SELECT * FROM desenhoAnimado WHERE titulo LIKE 'A%';

# 8. Renomear a coluna classificacao para classificacaoIndicativa
ALTER TABLE desenhoAnimado RENAME COLUMN classificacao TO classificacaoIndicativa;

# 9. Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE desenhoAnimado SET nota = 5,  dtLancamento = '2025-10-10' WHERE idDesenhoAnimado = 11;
SELECT * FROM desenhoAnimado;
# 10. Limpe todos os dados da tabela
TRUNCATE desenhoAnimado;

# 11. Remover a regra do status do desenho
ALTER TABLE desenhoAnimado DROP CHECK chkStatusDesenho;

# --------------------------------------------4 – Despensa do Scooby-Doo--------------------------------------------
# No MySQL Workbench, crie o banco de dados "estoque".
# A turma do Scooby Doo percebeu que os alimentos guardados no armário estavam
# sumindo de forma muito rápida. Para ter um melhor controle, Fred propôs criar
# um banco de dados que registrasse os dados de entrada e saída dos alimentos do
# armário.
# Ele criou uma tabela chamada "MisteriosSA", que possui os campos id um número
# inteiro chave primária, nome um campo de texto para armazenar o nome do
# produto, data da compra para armazenar a data na qual o produto foi comprado,
# preço valor numérico com casas decimais, peso um valor numérico que armazena
# o peso em gramas e data de retirada para armazenar a data em que o produto foi
# consumido.
CREATE DATABASE estoque;
USE estoque;
CREATE TABLE MisteriosSA(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  dataDaCompra DATE,
  preco DECIMAL(6,2),
  pesoEmGramas INT,
  dataDaRetirada DATE 
);

# 1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes.
# Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('saunduiche de presunto', '2025-02-16', 25.20, 250);
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('saunduiche de atum', '2025-02-17', 23.20, 250);
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('salgadinho', '2025-02-16', 3.50, 175);
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('pizza', '2025-02-16', 1000, 1200);
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('hambuguers', '2025-02-16', 49.99, 800);
INSERT INTO MisteriosSA(nome, dataDaCompra, preco, pesoEmGramas) VALUES('Biscoitos Scooby', '2025-02-01', 10.00, 800);

# 2. Verifique se os valores foram inseridos corretamente.
SELECT * FROM MisteriosSA;

# 3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos
# ordenados a partir da data de compra mais antiga.
SELECT nome, dataDaCompra, id FROM MisteriosSA ORDER BY dataDaCompra;

# 4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa
# de “Biscoitos Scooby” que foi comprada a mais tempo.
SELECT * FROM MisteriosSA WHERE nome = 'Biscoitos Scooby' ORDER BY dataDaCompra  LIMIT 1;

UPDATE MisteriosSA SET dataDaRetirada = CURDATE() WHERE nome = 'Biscoitos Scooby' ORDER BY dataDaCompra LIMIT 1;
# 5. Altere o nome da coluna id para idComida.
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

# 6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos
# Scooby” ou “Cachorro-quente”.
ALTER TABLE MisteriosSA ADD CONSTRAINT chkNome CHECK (nome IN ('Biscoitos Scooby', 'Cachorro-quente'));

# 7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o
# nome das colunas dataCompra apareça como "data da compra" e
# dataRetirada apareça como "data da retirada".
SELECT nome, preco, dataDaCompra AS 'data da compra', dataDaRetirada AS 'data da retirada'  FROM MisteriosSA WHERE nome = 'Biscoitos Scooby';

# 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT * FROM MisteriosSA WHERE dataDaCompra < '2024-07-25';

# 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50.
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

# 10. Limpe a tabela.
TRUNCATE MisteriosSA;

# --------------------------------------------5 – Heróis--------------------------------------------
# No MySQL Workbench, crie o banco de dados “vingadores”.
# Crie uma tabela chamada “heroi”, onde terá um campo de nome contendo até 45
# caracteres. O seu herói poderá ter uma versao, onde será armazenado o filme de
# sua escolha, esse campo aceitará até 45 caracteres. Todo herói, tem uma
# habilidade que se destaca entre os outros super-heróis. Todo herói tem uma
# altura, esse campo aceitará valores inteiros representando centímetros. O id
# deverá se autoincrementar.
CREATE DATABASE vingadores;
USE vingadores;

DROP TABLE heroi;

CREATE TABLE heroi(
	id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  versao VARCHAR(45),
  habilidade VARCHAR(40),
  alturaEmCentimetros INT
);


# Insira 5 heróis para derrotar o vilão Doutor Destino.
INSERT INTO heroi(nome, versao, habilidade, alturaEmCentimetros) VALUES('Coisa', 'Quarteto Fantástico e o Surfista Prateado', 'Super força', 183);
INSERT INTO heroi(nome, versao, habilidade, alturaEmCentimetros) VALUES('Tocha humana', 'Quarteto Fantástico e o Surfista Prateado', 'Controle do fogo', 178);
INSERT INTO heroi(nome, versao, habilidade, alturaEmCentimetros) VALUES('Mulher invisivel', 'Quarteto Fantástico e o Surfista Prateado', 'invisibilidade', 179);
INSERT INTO heroi(nome, versao, habilidade, alturaEmCentimetros) VALUES('Homen elastico', 'Quarteto Fantástico e o Surfista Prateado', 'propiedades de elastico', 185);
INSERT INTO heroi(nome, versao, habilidade, alturaEmCentimetros) VALUES('Arlequina', 'Esquadrão suicida', 'Loucura', 157);

# 1. Exiba os dados inseridos na tabela
SELECT * FROM heroi;

# 2. Adicione um campo de regeneração, onde ele aceitará apenas os valores
# booleanos de TRUE ou FALSE.
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE heroi ADD CONSTRAINT chkRegeneracao CHECK(regeneracao = TRUE OR regeneracao = FALSE);

# 3. Modifique o campo versão para aceitar até 100 caracteres.
ALTER TABLE heroi MODIFY COLUMN  versao VARCHAR(100);

# 4. Remova o herói de id 3 pois ele se morreu em batalha.
DELETE FROM heroi WHERE id = 3;

# 5. Chegou reforços, insira um novo herói para a equipe.
INSERT INTO heroi(nome, versao, habilidade, alturaEmcentimetros, regeneracao) VALUES('hulk', 'vingadores ultimato', 'super força', 300 ,TRUE);

# 6. Exiba todos os dados inseridos na tabela onde o nome do herói começa
# com “C” ou “H”.
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';

# 7. Exiba todos os dados inseridos na tabela onde o nome do herói não contém
# a letra “A” no campo nome.
SELECT * FROM heroi WHERE nome NOT LIKE '%A%';

# 8. Exiba apenas o nome do herói onde a altura for maior que 190.
SELECT nome FROM heroi WHERE alturaEmCentimetros > 190;

# 9. Exiba todos os dados da tabela de forma decrescente pelo nome onde a
# altura do herói for maior que 180.
SELECT * FROM heroi WHERE  alturaEmCentimetros > 180 ORDER BY nome; 

# 10. Limpe os dados da tabela.
TRUNCATE heroi;


# a) Criar um banco de dados chamado Venda.
CREATE DATABASE Venda;
# b) Selecionar esse banco de dados.
USE Venda;

# c) Criar as tabelas correspondentes à sua modelagem.
CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  clienteIndicador INT, 
  CONSTRAINT fkClienteIndicador FOREIGN KEY (clienteIndicador) REFERENCES cliente(idCliente)
);


CREATE TABLE endereco(
	idEndereco INT,
	cep VARCHAR(8) NOT NULL,
  rua VARCHAR(45) NOT NULL,
  numero VARCHAR(5) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  estado VARCHAR(5) NOT NULL,
  fkCliente INT,
  CONSTRAINT pkComposta PRIMARY KEY(idEndereco, fkCliente) 
);

CREATE TABLE produto(
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  preco DECIMAL(6,2) NOT NULL
);

CREATE TABLE venda (
	idVenda INT,
  fkCliente INT,
  fkProduto INT,
  dtVenda DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  quantidade INT NOT NULL,
	desconto DECIMAL(10,2) NOT NULL,
  CONSTRAINT pkTripa PRIMARY KEY(idVenda, fkCliente, fkProduto)
);


# d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada
# cliente, e mais de um cliente sendo indicado por outro cliente.
-- Clientes
INSERT INTO cliente (nome, email, clienteIndicador) VALUES
('Alice', 'alice@email.com', NULL),       -- ID 1
('Bruno', 'bruno@email.com', 1),          -- ID 2 (indicado por Alice)
('Clara', 'clara@email.com', 1),          -- ID 3 (indicado por Alice)
('Diego', 'diego@email.com', 2),          -- ID 4 (indicado por Bruno)
('Eva', 'eva@email.com', 3);              -- ID 5 (indicado por Clara)

-- Endereços
INSERT INTO endereco (idEndereco, cep, rua, numero, bairro, cidade, estado, fkCliente) VALUES
(1, '01001000', 'Rua A', '10', 'Centro', 'São Paulo', 'SP', 1),
(2, '02002000', 'Rua B', '20', 'Jardins', 'São Paulo', 'SP', 2),
(3, '03003000', 'Rua C', '30', 'Aclimação', 'São Paulo', 'SP', 3),
(4, '04004000', 'Rua D', '40', 'Moema', 'São Paulo', 'SP', 4),
(5, '05005000', 'Rua E', '50', 'Bela Vista', 'São Paulo', 'SP', 5);

-- Produtos
INSERT INTO produto (nome, descricao, preco) VALUES
('Mouse', 'Mouse óptico USB', 49.90),
('Teclado', 'Teclado mecânico', 129.90),
('Monitor', 'Monitor 24 polegadas', 799.00),
('Notebook', 'Notebook i5, 8GB RAM', 3499.00),
('Cadeira Gamer', 'Cadeira confortável', 899.00),
('Webcam', 'Webcam Full HD', 199.90),
('Headset', 'Headset com microfone', 159.90),
('HD Externo', 'HD 1TB USB 3.0', 299.90),
('Impressora', 'Impressora multifuncional', 449.00),
('Pen Drive', 'Pen drive 64GB', 49.90);

-- Vendas
INSERT INTO venda (idVenda, fkCliente, fkProduto, dtVenda, total, quantidade, desconto) VALUES
(1, 1, 1, '2024-01-10', 49.90, 1, 0.00),
(2, 1, 2, '2024-02-12', 129.90, 1, 10.00),
(3, 2, 3, '2024-02-15', 799.00, 1, 0.00),
(4, 2, 4, '2024-03-10', 3499.00, 1, 200.00),
(5, 3, 5, '2024-03-12', 899.00, 1, 50.00),
(6, 3, 6, '2024-03-15', 199.90, 1, 0.00),
(7, 4, 7, '2024-03-17', 159.90, 1, 0.00),
(8, 4, 8, '2024-03-18', 299.90, 1, 20.00),
(9, 5, 9, '2024-03-19', 449.00, 1, 0.00),
(10, 5, 10, '2024-03-20', 49.90, 1, 0.00),
(11, 5, 1, '2024-03-21', 49.90, 1, 5.00),
(12, 1, 3, '2024-03-22', 799.00, 1, 100.00);

# e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM cliente;
SELECT * FROM endereco;
SELECT * FROM venda;
SELECT * FROM produto;

# f) Fazer os acertos da chave estrangeira, caso não tenha feito no momento da criação
# das tabelas.

# g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
SELECT 
	cliente.nome AS 'Nome Do cliente',
  CONCAT('R$',venda.total) AS 'Total da venda',
  venda.dtVenda AS 'Data da Venda',
  produto.nome AS 'Nome do produto'
  FROM cliente JOIN venda ON cliente.idCliente = venda.fkCliente 
  JOIN produto ON produto.idProduto = venda.fkProduto;

# h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
# e os dados de suas respectivas vendas.
SELECT 
	cliente.nome AS 'Nome Do cliente',
  CONCAT('R$',venda.total) AS 'Total da venda',
  venda.dtVenda AS 'Data da Venda',
  produto.nome AS 'Nome do produto'
  FROM cliente JOIN venda ON cliente.idCliente = venda.fkCliente 
  JOIN produto ON produto.idProduto = venda.fkProduto WHERE cliente.nome = 'Alice';
  
# i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT 
	cIndicado.nome AS 'Cliente indicado', 
  IFNULL(cIndicador.nome, 'Não tem alguem que indicou') AS 'Cliente indicador' 
  FROM cliente AS cIndicado 
  LEFT JOIN cliente AS cIndicador 
  ON cIndicado.clienteIndicador = cIndicador.idCliente ;

# j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
# indicadores, porém somente de um determinado cliente indicador (informar o nome
# do cliente que indicou na consulta).
SELECT 
	cIndicado.nome AS 'Cliente indicado', 
  IFNULL(cIndicador.nome, 'Não tem alguem que indicou') AS 'Cliente indicador' 
  FROM cliente AS cIndicado 
  LEFT JOIN cliente AS cIndicador 
  ON cIndicado.clienteIndicador = cIndicador.idCliente 
  WHERE cIndicador.nome = 'Alice';

# l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
# dados das respectivas vendas e dos produtos.
SELECT 
	cIndicado.nome AS 'Cliente indicado', 
  IFNULL(cIndicador.nome, 'Não tem alguem que indicou') AS 'Cliente indicador',
  venda.dtVenda AS 'Data da Venda',
  produto.nome AS 'Nome do produto'
  FROM cliente AS cIndicado 
  LEFT JOIN cliente AS cIndicador 
  ON cIndicado.clienteIndicador = cIndicador.idCliente 
  JOIN venda ON cIndicado.idCliente = venda.fkCliente
  JOIN produto ON produto.idProduto = venda.fkProduto;

# m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
# numa determinada venda.
SELECT dtVenda AS 'Data da venda', produto.nome AS 'Nome do produto', venda.quantidade FROM venda JOIN produto ON produto.idProduto = venda.fkProduto; 

# n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
# produtos vendidos agrupados pelo nome do produto.
# GROUP BY agrupar ocorrencias por um determinado argumento , por padrão sçao todos os registros
SELECT 
	produto.idProduto,
  produto.nome AS 'Nome do produto',  
  produto.preco AS 'Preço do produto',
  SUM(venda.quantidade) AS 'Quantidade de venda'
FROM produto JOIN venda ON produto.idProduto = venda.fkProduto
GROUP BY produto.idProduto;


# o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
# vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO cliente (nome, email, clienteIndicador) VALUES
('Henry', 'henry@email.com', NULL);

SELECT 
	cliente.nome AS 'Nome do cliente',
  IFNULL(venda.dtVenda, 'Não fez venda') AS 'Data da venda',
  IFNULL(produto.nome, 'Não tem produto') AS 'Nome do Produto'FROM cliente 
LEFT JOIN venda 
ON cliente.idCliente = venda.fkCliente 
LEFT JOIN produto 
ON produto.idProduto = venda.fkProduto;

# p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;

SELECT 
  MIN(produto.preco) AS 'Valor Maximo',
  MAX(produto.preco) AS 'Valor minimo' 
  FROM produto;


# q) Exibir a soma e a média dos preços dos produtos;
SELECT 
  SUM(produto.preco) AS 'Soma dos produtos',
  AVG(produto.preco) AS 'Média dos preços'
  FROM produto;

# r) Exibir a quantidade de preços acima da média entre todos os produtos;
# subqueries , podemos usa para executar querys dentro de uma query maior
SELECT COUNT(produto.idProduto) AS 'acima de média' FROM produto WHERE produto.preco > (SELECT AVG(produto.preco) FROM produto);

# s) Exibir a soma dos preços distintos dos produtos; 
# DISTINCT só seleciona os registros distintos e ignorando os iguais
SELECT SUM(DISTINCT produto.preco) AS 'soma dos preços' FROM produto;

# t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT produto.nome AS 'Nome do produto',SUM(produto.preco) AS 'Soma os preços' FROM produto JOIN venda ON produto.idProduto = venda.fkProduto GROUP BY venda.fkProduto;


# SUM() soma 
# AVG() media de uma valor
# MIN() valor minimo de um grupo de ocorrencias
# MAx() valor maximo de um grupo de ocorrencias
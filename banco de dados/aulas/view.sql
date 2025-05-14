CREATE DATABASE view_in_mysql;
DROP DATABASE view_in_mysql;
USE view_in_mysql;

CREATE TABLE Clientes(
	cliente_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(255) UNIQUE
);

CREATE TABLE Itens(
	item_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
	preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Pedidos(
  pedido_id INT ,
	cliente_id INT,
	data_pedido DATE,
  CONSTRAINT pk_composta PRIMARY KEY(pedido_id, cliente_id),
  CONSTRAINT fk_pedidos_cliente FOREIGN KEY (cliente_id) REFERENCES Clientes (cliente_id)
);

CREATE TABLE Itens_Pedido(
	pedido_id INT,
	item_id INT,
	quantidade INT NOT NULL,
  CONSTRAINT pk_composta PRIMARY KEY(pedido_id, item_id),
  CONSTRAINT fk_itens_pedido_item FOREIGN KEY (item_id) REFERENCES Itens (item_id)
);

CREATE TABLE Pagamento(
	pagamento_id INT, 
	pedido_id INT,
	valor_pago DECIMAL(10,2),
	data_pagamento DATE,
  CONSTRAINT pk_composta PRIMARY KEY(pagamento_id, pedido_id),
  CONSTRAINT fk_pagamento_pedido FOREIGN KEY (pedido_id) REFERENCES Pedidos (pedido_id)
);


-- Inserindo clientes do restaurante
INSERT INTO Clientes (nome, email) VALUES
('Ana Oliveira', 'ana.oliveira@gmail.com'),
('Bruno Silva', 'bruno.silva@hotmail.com'),
('Camila Santos', 'camila.santos@yahoo.com');

-- Inserindo itens do cardápio
INSERT INTO Itens (nome, preco) VALUES
('Filé à Parmegiana', 49.90),
('Lasanha Bolonhesa', 39.90),
('Coca-Cola 350ml', 6.00),
('Suco de Laranja Natural', 8.00),
('Torta de Limão', 12.50),
('Salada Caesar', 25.00);

-- Inserindo pedidos realizados pelos clientes
INSERT INTO Pedidos (pedido_id, cliente_id, data_pedido) VALUES
(101, 1, '2025-05-10'),
(102, 2, '2025-05-11'),
(103, 3, '2025-05-12');

-- Inserindo os itens que foram pedidos em cada pedido
INSERT INTO Itens_Pedido (pedido_id, item_id, quantidade) VALUES
(101, 1, 1), -- Ana pediu 1 Filé à Parmegiana
(101, 3, 2), -- Ana pediu 2 Coca-Colas
(102, 2, 1), -- Bruno pediu 1 Lasanha
(102, 4, 1), -- Bruno pediu 1 Suco de Laranja
(102, 5, 1), -- Bruno pediu 1 Torta de Limão
(103, 6, 2), -- Camila pediu 2 Saladas Caesar
(103, 4, 2); -- Camila pediu 2 Sucos de Laranja

-- Inserindo os pagamentos realizados
INSERT INTO Pagamento (pagamento_id, pedido_id, valor_pago, data_pagamento) VALUES
(1, 101, 61.90, '2025-05-10'),
(2, 102, 65.40, '2025-05-11'),
(3, 103, 66.00, '2025-05-12');
# precisa obter informações sobre os pedidos feitos pelos clientes, os itens consumidos,
# a quantidade de cada item, o total gasto e o pagamento realizado para cada pedido.

SELECT 
	c.nome AS 'CLiente:', 
	p.data_pedido AS 'Data do pedido:',
    p.pedido_id AS 'Código do pedido:',
    i.nome AS 'Pedido:',
    ip.quantidade AS 'Quantidade',
    CONCAT('R$ ',i.preco) AS 'Preço',
    i.preco * ip.quantidade AS 'Total:',
    pg.valor_pago AS 'Pagamento:',
    pg.data_pagamento AS 'Data do pagamento:'
FROM Pedidos AS p 
    JOIN Itens_Pedido AS ip 
    ON p.pedido_id = ip.pedido_id 
    JOIN Clientes AS c 
    ON c.cliente_id = p.cliente_id 
    JOIN Itens AS i 
    ON i.item_id = ip.item_id
    JOIN Pagamento AS pg
    ON pg.pedido_id = p.pedido_id; 
    
    
# Nome do cliente.

#     Nome do item consumido.

#     Quantidade consumida.

#     Preço unitário do item.

#     Total gasto por item (quantidade * preço).

#     Valor total do pedido (somatório dos totais dos itens do pedido).

#     Valor pago no pedido.

#     Data do pagamento.
SELECT 
	c.nome AS 'CLiente', 
    i.nome AS 'Pedido',
    ip.quantidade AS 'Quantidade',
    CONCAT('R$ ',FORMAT(i.preco,2)) AS 'Preço',
    i.preco * ip.quantidade AS 'Total',
    SUM(i.preco * ip.quantidade) AS 'Valor total do pedido',
    pg.valor_pago AS 'Pagamento',
    pg.data_pagamento AS 'Data do pagamento'
FROM Pedidos AS p 
    JOIN Itens_Pedido AS ip 
    ON p.pedido_id = ip.pedido_id 
    JOIN Clientes AS c 
    ON c.cliente_id = p.cliente_id 
    JOIN Itens AS i 
    ON i.item_id = ip.item_id
    JOIN Pagamento AS pg
    ON pg.pedido_id = p.pedido_id 
    GROUP BY c.nome, p.pedido_id, pg.valor_pago, pg.data_pagamento, ip.quantidade, i.preco, i.nome;

SELECT 
	c.nome AS 'CLiente', 
    i.nome AS 'Pedido',
    ip.quantidade AS 'Quantidade',
    CONCAT('R$ ',FORMAT(i.preco,2)) AS 'Preço',
    i.preco * ip.quantidade AS 'Total',
		(
  	SELECT SUM(i2.preco * ip2.quantidade)
  		FROM Itens_Pedido ip2
  		JOIN Itens i2 ON i2.item_id = ip2.item_id
  	WHERE ip2.pedido_id = p.pedido_id
		) AS 'Valor total do pedido',
    pg.valor_pago AS 'Pagamento',
    pg.data_pagamento AS 'Data do pagamento'
FROM Pedidos AS p 
    JOIN Itens_Pedido AS ip 
    ON p.pedido_id = ip.pedido_id 
    JOIN Clientes AS c 
    ON c.cliente_id = p.cliente_id 
    JOIN Itens AS i 
    ON i.item_id = ip.item_id
    JOIN Pagamento AS pg
    ON pg.pedido_id = p.pedido_id 
    GROUP BY c.nome, p.pedido_id, pg.valor_pago, pg.data_pagamento, ip.quantidade, i.preco, i.nome;


CREATE VIEW vw_detalhes_pedido AS SELECT 
		c.nome AS 'CLiente', 
    i.nome AS 'Pedido',
    ip.quantidade AS 'Quantidade',
    CONCAT('R$ ',FORMAT(i.preco,2)) AS 'Preço',
    i.preco * ip.quantidade AS 'Total',
		(
  	SELECT SUM(i2.preco * ip2.quantidade)
  		FROM Itens_Pedido ip2
  		JOIN Itens i2 ON i2.item_id = ip2.item_id
  	WHERE ip2.pedido_id = p.pedido_id
		) AS 'Valor total do pedido',
    pg.valor_pago AS 'Pagamento',
    pg.data_pagamento
    FROM Pedidos AS p 
    JOIN Itens_Pedido AS ip 
    ON p.pedido_id = ip.pedido_id 
    JOIN Clientes AS c 
    ON c.cliente_id = p.cliente_id 
    JOIN Itens AS i 
    ON i.item_id = ip.item_id
    JOIN Pagamento AS pg
    ON pg.pedido_id = p.pedido_id 
    GROUP BY c.nome, p.pedido_id, pg.valor_pago, pg.data_pagamento, ip.quantidade, i.preco, i.nome;
  
ALTER VIEW vw_detalhes_pedido AS SELECT 
		c.nome AS 'CLiente', 
    i.nome AS 'Pedido',
    ip.quantidade AS 'Quantidade',
    CONCAT('R$ ',FORMAT(i.preco,2)) AS 'Preço',
    i.preco * ip.quantidade AS 'Total',
		(
		SELECT SUM(i2.preco * ip2.quantidade)
			FROM Itens_Pedido ip2
			JOIN Itens i2 ON i2.item_id = ip2.item_id
		WHERE ip2.pedido_id = p.pedido_id /*somando todas ocorrencias dos itens do pedido, 1,2,3...*/
		) AS 'Valor total do pedido',
    pg.valor_pago AS 'Pagamento',
    pg.data_pagamento
FROM Pedidos AS p 
    JOIN Itens_Pedido AS ip 
    ON p.pedido_id = ip.pedido_id 
    JOIN Clientes AS c 
    ON c.cliente_id = p.cliente_id 
    JOIN Itens AS i 
    ON i.item_id = ip.item_id
    JOIN Pagamento AS pg
    ON pg.pedido_id = p.pedido_id 
    GROUP BY c.nome, p.pedido_id, pg.valor_pago, pg.data_pagamento, ip.quantidade, i.preco, i.nome;
    
 SELECT * FROM vw_detalhes_pedido ORDER BY data_pagamento DESC;
 
 /*
	CREATE VIEW name_view AS query_select
    ALTER VIEW name_view AS query_select
    DROP VIEW name_view
    documentation: https://www.w3schools.com/sql/sql_view.asp
 */

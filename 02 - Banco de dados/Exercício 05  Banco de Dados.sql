CREATE TABLE marcas(
	codigo_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(20)
);

CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(50),
    valor_produto INT,
    estoque INT,
    codigo_marca INT,
    FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca)
);

INSERT INTO marcas VALUES
(1, "Nike"),
(2, "Adidas"),
(3, "Colcci"),
(4, "Tommy Hilfiger"),
(5, "Hering"),
(6, "Vans"),
(7, "Vizzano"),
(8, "Aramis"),
(9, "Reserva");


INSERT INTO produtos VALUES
(1, "Tênis Adidas Performance",  345.00, 765, 2),
(2, "Tênis Nike Revolution", 769.00, 1235, 1),
(3, "Blusa feminina rosa", 99.00, 754, 6),
(4, "Camisa social branca", 180.99, 235, 8),
(5, "Bota Chelsea Lacey", 322.00, 98, 3),
(6, "Blusa moletom Romance", 150.76, 324, 3),
(7, "Camiseta preta base", 79.00, 1235, 4),
(8, "Bolsa Colcci Lisa", 249.00, 112, 3),
(9, "Camisa Adidas Originals", 346.00, 344, 2),
(10, "Tênis WM preto", 988.00, 2341, 6),
(11, "Bota Colcci azul", 1540.00, 143, 3),
(12, "Scarpin feminino salto", 877.00, 673, 7),
(13, "Camiseta Nike Dri-FIT", 124.00, 228, 1),
(14, "Camisa polo azul", 233.00, 549, 8),
(15, "Camisa Polo Tommy Hilfiger", 499.00, 794, 4),
(16, "Sandália Vizzano", 1540.00, 83, 7),
(17, "Tênis Adidas Superstar", 769.00, 326, 2),
(18, "Camiseta algodão verde", 76.99, 1214, 9),
(19, "Short Nike Nk", 298.00, 683, 1),
(20, "Camisa Aramis geométrica", 355.00, 1033, 8),
(21, "Bolsa Nike Unissex", 265.29, 596, 1),
(22, "Camiseta Aramis vermelha", 199.00, 457, 8),
(23, "Boné Tommy Jeans", 204.64, 68, 4),
(24, "Jaqueta Adidas ECO", 609.98, 116, 2);


SELECT
	produtos.nome_produto,
    marcas.nome_marca,
    produtos.valor_produto
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;

SELECT
	marcas.nome_marca,
    produtos.estoque
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY marcas.nome_marca;

SELECT
	nome_produto,
    valor_produto
FROM produtos
ORDER BY valor_produto DESC;

SELECT
	marcas.nome_marca,
    avg(produtos.valor_produto)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY marcas.nome_marca;

SELECT
	produtos.nome_produto,
    produtos.valor_produto,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
WHERE produtos.valor_produto = (SELECT MAX(produtos.valor_produto) FROM produtos);

SELECT
	produtos.codigo_produto,
    produtos.nome_produto,
    produtos.valor_produto,
    produtos.estoque,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
WHERE produtos.estoque >= 500 AND produtos.estoque <= 1000;

SELECT
	nome_produto,
    valor_produto,
    estoque
FROM produtos
WHERE nome_produto LIKE "%Blusa%" OR nome_produto LIKE "%camiseta%" OR nome_produto LIKE "%camisa%";

SELECT
	marcas.nome_marca,
    SUM(produtos.valor_produto)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

SELECT
	marcas.nome_marca,
    MAX(produtos.valor_produto)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;

SELECT
	nome_produto,
    estoque
FROM produtos
WHERE estoque >= (SELECT AVG(estoque) FROM produtos);

DROP TABLE produtos;
DROP TABLE marcas;
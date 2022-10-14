CREATE TABLE filiais(
	codigo_filial INT PRIMARY KEY AUTO_INCREMENT,
    nome_filial VARCHAR(30),
    endereco_filial VARCHAR(60)
);

CREATE TABLE vendedores(
	codigo_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor VARCHAR(30),
    nascimento_vendedor DATE,
    inicio_contrato DATE,
    codigo_filial INT,
    FOREIGN KEY(codigo_filial) REFERENCES filiais(codigo_filial)
);

CREATE TABLE clientes(
	codigo_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(30),
    nascimento_cliente DATE,
    codigo_filial INT,
    FOREIGN KEY(codigo_filial) REFERENCES filiais(codigo_filial)
);

CREATE TABLE categorias(
	codigo_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(20)
);

CREATE TABLE marcas(
	codigo_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(20)
);

CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(40),
    valor_produto DOUBLE,
    estoque_produto INT,
    codigo_marca INT,
    FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca),
    codigo_categoria INT,
    FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo_categoria)
);

CREATE TABLE vendas(
	codigo_venda INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cliente INT,
    FOREIGN KEY(codigo_cliente) REFERENCES clientes(codigo_cliente),
    codigo_produto INT,
    FOREIGN KEY(codigo_produto) REFERENCES produtos(codigo_produto),
    codigo_filial INT,
    FOREIGN KEY(codigo_filial) REFERENCES filiais(codigo_filial),
    codigo_vendedor INT,
    FOREIGN KEY(codigo_vendedor) REFERENCES vendedores(codigo_vendedor)
);

INSERT INTO filiais VALUES
(1, "Matriz - Blumenau", "Rua XV de Novembro, 1112 - Centro - Blumenau/SC"),
(2, "São Paulo", "Rua 7 de Setembro, 1234, Centro - São Paulo/SP"),
(3, "Brusque", "Rua Jaraguá, 4321, Centro - Brusque/SC");

INSERT INTO vendedores VALUES
(1, "Leonardo", "1984-12-11", "2000-01-01", 1),
(2, "Roger", "1990-01-01", "1999-01-01", 1),
(3, "Aline", "1991-01-01", "2015-01-01", 2);

INSERT INTO clientes VALUES
(1, "Alice", "2000-02-02", 1),
(2, "Marcos", "1990-03-03", 2),
(3, "Caroline", "1984-02-29", 1);

INSERT INTO categorias VALUES
(1, "Celular"),
(2, "Notebook"),
(3, "Carregador"),
(4, "Monitor"),
(5, "Mouse"),
(6, "Teclado");

INSERT INTO marcas VALUES
(1, "Apple"),
(2, "Samsung"),
(3, "Xiaomi"),
(4, "Toshiba"),
(5, "Microsoft"),
(6, "Dell"),
(7, "Logitech");

INSERT INTO produtos VALUES
(1, "Iphone 13", 9000, 200, 1, 1),
(2, "Galaxy S20", 3000, 300, 2, 1),
(3, "Alienware", 10000, 20, 6, 2),
(4, "Iphone", 200, 200, 1, 3),
(5, "Tela 20 pol", 1000, 30, 4, 4),
(6, "MX-310", 250, 110, 7, 5),
(7, "Confort", 300, 200, 5, 5);

INSERT INTO vendas VALUES
(1, 3, 1, 1, 1),
(2, 2, 3, 2, 3),
(3, 1, 2, 2, 3),
(4, 3, 7, 1, 1),
(5, 2, 6, 1, 2),
(6, 2, 5, 1, 2),
(7, 1, 2, 1, 1);

CREATE VIEW selecionar_clientes_produtos AS
SELECT
	clientes.nome_cliente,
    produtos.nome_produto
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto;

CREATE VIEW selecionar_vendedores_vendas AS
SELECT
	vendas.codigo_venda,
    vendedores.nome_vendedor
FROM vendas
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor;

SELECT * FROM selecionar_clientes_produtos;
SELECT * FROM selecionar_vendedores_vendas;

CREATE VIEW selecionar_codigo_venda_cliente_produto AS
SELECT
	vendas.codigo_venda,
    clientes.nome_cliente,
    produtos.nome_produto
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
ORDER BY vendas.codigo_venda;

CREATE VIEW selecionar_vendas_por_filial AS
SELECT
	filiais.nome_filial,
    SUM(produtos.valor_produto)
FROM vendas
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
GROUP BY filiais.nome_filial;

CREATE VIEW selecionar_vendas_por_vendedor AS
SELECT
	vendedores.nome_vendedor,
    SUM(produtos.valor_produto)
FROM vendas
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
GROUP BY vendedores.nome_vendedor;

SELECT * FROM selecionar_codigo_venda_cliente_produto;
SELECT * FROM selecionar_vendas_por_filial;
SELECT * FROM selecionar_vendas_por_vendedor;

CREATE VIEW selecionar_dados_produto_vendido AS
SELECT
	vendas.codigo_venda,
    clientes.nome_cliente,
    produtos.nome_produto,
    produtos.valor_produto,
    categorias.nome_categoria,
    marcas.nome_marca
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;

CREATE VIEW selecionar_detalhes_vendas_filial AS
SELECT
	filiais.nome_filial,
    categorias.nome_categoria,
    marcas.nome_marca,
    produtos.nome_produto,
    produtos.valor_produto
FROM vendas
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
ORDER BY filiais.nome_filial;

SELECT * FROM selecionar_dados_produto_vendido;
SELECT * FROM selecionar_detalhes_vendas_filial;

CREATE VIEW selecionar_dados_venda AS
SELECT
	vendas.codigo_venda,
	filiais.nome_filial,
    clientes.nome_cliente,
    categorias.nome_categoria,
    marcas.nome_marca,
    produtos.nome_produto,
    vendedores.nome_vendedor
FROM vendas
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
ORDER BY vendas.codigo_venda;

CREATE VIEW selecionar_vendas_termo_matriz AS
SELECT
	vendas.codigo_venda,
	filiais.nome_filial,
    clientes.nome_cliente,
    categorias.nome_categoria,
    marcas.nome_marca,
    produtos.nome_produto,
    vendedores.nome_vendedor
FROM vendas
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
WHERE filiais.nome_filial LIKE "%Matriz%";

CREATE VIEW selecionar_vendas_vendedor_leonardo AS
SELECT
	vendas.codigo_venda,
	filiais.nome_filial,
    clientes.nome_cliente,
    categorias.nome_categoria,
    marcas.nome_marca,
    produtos.nome_produto,
    vendedores.nome_vendedor
FROM vendas
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
WHERE vendedores.nome_vendedor LIKE "%Leonardo%";

SELECT * FROM selecionar_vendas_termo_matriz;
SELECT * FROM selecionar_vendas_vendedor_leonardo;

DROP TABLE vendas;
DROP TABLE produtos;
DROP TABLE marcas;
DROP TABLE categorias;
DROP TABLE clientes;
DROP TABLE vendedores;
DROP TABLE filiais;
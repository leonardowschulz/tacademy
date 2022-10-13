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


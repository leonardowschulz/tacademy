CREATE TABLE filiais(
	codigo_filial INT PRIMARY KEY AUTO_INCREMENT,
    nome_filial VARCHAR(30),
    endereco_filial VARCHAR(80)
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

CREATE TABLE comissaoVendedores(
	codigo_comissao INT PRIMARY KEY AUTO_INCREMENT,
	codigo_vendedor INT,
    FOREIGN KEY(codigo_vendedor) REFERENCES vendedores(codigo_vendedor),
    codigo_venda INT,
    FOREIGN KEY(codigo_venda) REFERENCES vendas(codigo_venda),
    codigo_produto INT,
    FOREIGN KEY(codigo_produto) REFERENCES produtos(codigo_produto),
    valor_comissao DOUBLE
);

INSERT INTO filiais VALUES
(1, "Matriz - Blumenau", "Rua XV de Novembro, 1112 - Centro - Blumenau/SC"),
(2, "São Paulo", "Rua 7 de Setembro, 1234, Centro - São Paulo/SP"),
(3, "Brusque", "Rua Jaraguá, 4321, Centro - Brusque/SC"),
(4, "Shopping H", "Rua XV de Novembro, 759 - Centro - Blumenau/SC"),
(5, "Norte Shopping", "BR-470, 3000 - Salto Norte - Blumenau/SC"),
(6, "Jaraguá", "Rua Ricardo Hass, 106 - Nova Brasília - Jaraguá do SUl/SC"),
(7, "Atlântico Shopping", "Av. Brasil, 1271 - Centro, Balneário Camboriú/SC"),
(8, "Russi Russi", "Av. Nereu Ramos, 3977 - Meia Praia, Itapema/SC"),
(9, "Filial Furb", "Rua G. Arthur Koehler, 145 - Vila Nova, Blumenau/SC"),
(10, "Itoupava Central", "Rua D. Pedro Zimmermann, 1500 - Itoupava Central, Blumenau/SC");

INSERT INTO vendedores VALUES
(1, "Leonardo", "1984-12-11", "2000-01-01", 1),
(2, "Roger", "1990-01-01", "1999-01-01", 1),
(3, "Aline", "1991-01-01", "2015-01-01", 2),
(4, "Priscila", "1987-03-05", "2020-03-08", 3),
(5, "Felipe", "1991-03-16", "2010-12-01", 4),
(6, "Alfredo", "1954-03-22", "2020-12-17", 8),
(7, "Nilma", "1955-04-27", "2022-10-14",7),
(8, "Ronan", "1987-03-20", "2010-05-01",6),
(9, "Paulo", "1985-09-05", "2009-08-08", 9),
(10, "Michel", "1985-01-09", "2011-05-07", 10);




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

DROP TABLE comissaoVendedores;
DROP TABLE vendas;
DROP TABLE produtos;
DROP TABLE marcas;
DROP TABLE categorias;
DROP TABLE clientes;
DROP TABLE vendedores;
DROP TABLE filiais;

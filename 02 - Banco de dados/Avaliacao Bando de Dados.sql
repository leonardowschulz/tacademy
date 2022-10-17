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
    nome_categoria VARCHAR(20),
    imposto DOUBLE
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
    FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo_categoria),
    imposto DOUBLE
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

DELIMITER $$
CREATE PROCEDURE cadastrarFilial(IN nome VARCHAR(30), IN endereco VARCHAR(80), OUT mensagem VARCHAR(100))
BEGIN
	DECLARE qtd INT DEFAULT 0;
    
    SELECT COUNT(nome_filial) INTO qtd FROM filiais WHERE nome_filial = nome;

	IF qtd = 0 AND LENGTH(nome) > 3 then
		INSERT INTO filiais VALUES (null, nome, endereco);
		SET mensagem = "Filial cadastrada";
	ELSE
		SET mensagem = "A filial não pode ter sido cadastrada e deve conter mais de 3 letras";
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE atualizarNomeFilial(IN codigo INT, IN nome VARCHAR(30), OUT mensagem VARCHAR(100))
BEGIN
	DECLARE qtd INT DEFAULT 0;
    
    SELECT COUNT(nome_filial) INTO qtd FROM filiais WHERE nome_filial = nome;

	IF qtd = 0 AND LENGTH(nome) > 3 then
		UPDATE filiais SET nome_filial = nome WHERE codigo_filial = codigo;
		SET mensagem = "Filial atualizada";
	ELSE
		SET mensagem = "A filial não pode já estar cadastrada e deve conter mais de 3 letras";
    END IF;
END $$
DELIMITER ;



CALL cadastrarFIlial("Matriz - Blumenau", "Rua XV de Novembro, 1112 - Centro - Blumenau/SC", @mensagem);
CALL cadastrarFIlial("São Paulo", "Rua 7 de Setembro, 1234, Centro - São Paulo/SP", @mensagem);
CALL cadastrarFIlial("Brusque", "Rua Jaraguá, 4321, Centro - Brusque/SC", @mensagem);
CALL cadastrarFIlial("Shopping H", "Rua XV de Novembro, 759 - Centro - Blumenau/SC", @mensagem);
CALL cadastrarFIlial("Norte Shopping", "BR-470, 3000 - Salto Norte - Blumenau/SC", @mensagem);
CALL cadastrarFIlial("Jaraguá", "Rua Ricardo Hass, 106 - Nova Brasília - Jaraguá do SUl/SC", @mensagem);
CALL cadastrarFIlial("Atlântico Shopping", "Av. Brasil, 1271 - Centro, Balneário Camboriú/SC", @mensagem);
CALL cadastrarFIlial("Russi Russi", "Av. Nereu Ramos, 3977 - Meia Praia, Itapema/SC", @mensagem);
CALL cadastrarFIlial("Filial Furb", "Rua G. Arthur Koehler, 145 - Vila Nova, Blumenau/SC", @mensagem);
CALL cadastrarFIlial("Itoupava Central", "Rua D. Pedro Zimmermann, 1500 - Itoupava Central, Blumenau/SC", @mensagem);


DELIMITER $$
CREATE PROCEDURE cadastrarVendedores(IN nome VARCHAR(30), IN nascimento DATE, IN contrato DATE, IN filial INT)
BEGIN
	INSERT INTO vendedores VALUES (null, nome, nascimento, contrato, filial);
END $$
DELIMITER ;

CALL cadastrarVendedores("Leonardo", "1984-12-11", "2000-01-01", 1);
CALL cadastrarVendedores("Roger", "1990-01-01", "1999-01-01", 1);
CALL cadastrarVendedores("Aline", "1991-01-01", "2015-01-01", 2);
CALL cadastrarVendedores("Priscila", "1987-03-05", "2020-03-08", 3);
CALL cadastrarVendedores("Felipe", "1991-03-16", "2010-12-01", 4);
CALL cadastrarVendedores("Alfredo", "1954-03-22", "2020-12-17", 8);
CALL cadastrarVendedores("Nilma", "1955-04-27", "2022-10-14",7);
CALL cadastrarVendedores("Ronan", "1987-03-20", "2010-05-01",6);
CALL cadastrarVendedores("Paulo", "1985-09-05", "2009-08-08", 9);
CALL cadastrarVendedores("Michel", "1985-01-09", "2011-05-07", 10);


DELIMITER $$
CREATE PROCEDURE cadastrarClientes(IN nome VARCHAR(30), IN nascimento DATE, IN filial INT)
BEGIN
	INSERT INTO clientes VALUES (null, nome, nascimento, filial);
END $$
DELIMITER ;

CALL cadastrarClientes("Alice", "2000-02-02", 1);
CALL cadastrarClientes("Marcos", "1990-03-03", 2);
CALL cadastrarClientes("Caroline", "1984-02-29", 1);
CALL cadastrarClientes("Joao", "1990-01-05", 3);
CALL cadastrarClientes("Maria", "1995-05-08", 4);
CALL cadastrarClientes("Francisco", "1998-08-09", 5);
CALL cadastrarClientes("Jorge", "1992-05-05", 6);
CALL cadastrarClientes("Arthur", "1988-06-08", 7);
CALL cadastrarClientes("Marcelo", "1988-04-01", 8);
CALL cadastrarClientes("Yara", "1977-10-02", 9);

DELIMITER $$
CREATE PROCEDURE cadastrarCategorias(IN nome VARCHAR(30), imposto DOUBLE)
BEGIN
	INSERT INTO categorias VALUES (null, nome, imposto);
END $$
DELIMITER ;

CALL cadastrarCategorias("Celular", 8);
CALL cadastrarCategorias("Notebook", 10);
CALL cadastrarCategorias("Carregador", 5);
CALL cadastrarCategorias("Monitor", 6);
CALL cadastrarCategorias("Mouse", 6);
CALL cadastrarCategorias("Teclado", 6);
CALL cadastrarCategorias("Fone de ouvido", 6);
CALL cadastrarCategorias("Mouse Pad", 5);
CALL cadastrarCategorias("Suporte notebook", 6);
CALL cadastrarCategorias("Cabo HDMI", 4);


INSERT INTO marcas VALUES
(1, "Apple"),
(2, "Samsung"),
(3, "Xiaomi"),
(4, "Toshiba"),
(5, "Microsoft"),
(6, "Dell"),
(7, "Logitech"),
(8, "LG"),
(9, "Motorola"),
(10, "Google");

CREATE TRIGGER gerar_imposto
BEFORE INSERT ON produtos
FOR EACH ROW
SET NEW.imposto = ((SELECT imposto FROM categorias WHERE NEW.codigo_categoria = codigo_categoria) * NEW.valor_produto / 100);



INSERT INTO produtos VALUES
(1, "Iphone 13", 9000, 200, 1, 1, null),
(2, "Galaxy S20", 3000, 300, 2, 1, null),
(3, "Alienware", 10000, 20, 6, 2, null),
(4, "Iphone", 200, 200, 1, 3, null),
(5, "Monitor 20 pol", 1000, 30, 4, 4, null),
(6, "MX-310", 250, 110, 7, 5, null),
(7, "Confort", 300, 200, 5, 5, null),
(8, "Pixel", 8000, 100, 10, 1, null),
(9, "Moto G62", 5000, 120, 9, 1, null),
(10, "Monitor 24 pol", 950, 50, 8, 4, null);


DELIMITER $$
CREATE PROCEDURE atualizarValorProduto(IN codigo INT, IN valor INT, out mensagem VARCHAR(100))
BEGIN
	DECLARE codProd INT DEFAULT 0;
    SELECT COUNT(codigo_produto) INTO codProd FROM produtos WHERE produtos.codigo_produto = codigo;
    IF codProd = 1 then
		UPDATE comissaoVendedores, produtos SET valor_produto = valor WHERE produtos.codigo_produto = codigo;
        UPDATE produtos, categorias SET produtos.imposto = ((SELECT categorias.imposto FROM categorias WHERE produtos.codigo_categoria = categorias.codigo_categoria) * valor / 100) WHERE produtos.codigo_produto = codigo;
		SET mensagem = "Valor do prudoto atualizado";
    ELSE
		SET mensagem = "Codigo do produto não encontrado";
	END IF;
END $$
DELIMITER ;


INSERT INTO vendas VALUES
(1, 3, 1, 1, 1),
(2, 2, 3, 2, 4),
(3, 1, 2, 2, 3),
(4, 4, 7, 1, 6),
(5, 3, 6, 4, 7),
(6, 5, 5, 7, 8),
(7, 6, 2, 10, 3),
(8, 7, 8, 7, 2),
(9, 5, 4, 6, 1),
(10, 10, 1, 9, 3);




CREATE TRIGGER gerar_comissao
BEFORE INSERT ON comissaoVendedores
FOR EACH ROW
SET NEW.valor_comissao = ((SELECT valor_produto FROM produtos WHERE NEW.codigo_produto = codigo_produto) * 0.1);

SELECT * FROM comissaoVendedores;

INSERT INTO comissaoVendedores VALUES
(1, 1, 1, 1, null),
(2, 4, 2, 3, null),
(3, 3, 3, 2, null),
(4, 6, 4, 7, null),
(5, 7, 5, 6, null),
(6, 8, 6, 5, null),
(7, 3, 7, 2, null),
(8, 2, 8, 8, null),
(9, 1, 9, 4, null),
(10, 3, 10, 1, null);

DELIMITER $$
CREATE PROCEDURE atualizarTaxaComissao(IN codigo INT, IN taxa INT, OUT mensagem VARCHAR(100))
BEGIN
	DECLARE codVenda INT DEFAULT 0;
    
    SELECT COUNT(codigo_venda) INTO codVenda FROM comissaoVendedores WHERE codigo_venda = codigo;

	IF codVenda = 1 then
		UPDATE comissaoVendedores, produtos
        SET valor_comissao = ((SELECT valor_produto FROM produtos WHERE produtos.codigo_produto = codigo_produto LIMIT 1) * taxa / 100 ) WHERE codigo_venda = codigo;
		SET mensagem = "Comissao Atualizada";
	ELSE
		SET mensagem = "Codigo de comissão não encontrada";
    END IF;
END $$
DELIMITER ;



CREATE VIEW selecionar_codigo_venda_e_nome_cliente AS
SELECT
vendas.codigo_venda,
    clientes.nome_cliente
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente;

CREATE VIEW selecionar_codigo_venda_e_nome_vendedor AS
SELECT
vendas.codigo_venda,
    vendedores.nome_vendedor
FROM vendas
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor;

CREATE VIEW selecionar_codigo_venda_cliente_produto AS
SELECT
vendas.codigo_venda,
    clientes.nome_cliente,
    produtos.nome_produto
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto;

CREATE VIEW selecionar_codigo_venda_vendedor_filial AS
SELECT
vendas.codigo_venda,
    vendedores.nome_vendedor,
    filiais.nome_filial
FROM vendas
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial;

CREATE VIEW selec_codigo_venda_clie AS
SELECT
vendas.codigo_venda,
    clientes.nome_cliente,
    categorias.nome_categoria,
    marcas.nome_marca,
    produtos.nome_produto,
    produtos.valor_produto,
    vendedores.nome_vendedor,
    filiais.nome_filial,
    NOW()
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
INNER JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
INNER JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
INNER JOIN filiais
ON vendas.codigo_filial = filiais.codigo_filial
ORDER BY vendas.codigo_venda;


CREATE VIEW selecionar_clientes_compr_iphone AS
SELECT
	produtos.nome_produto,
    COUNT(clientes.codigo_cliente)
FROM vendas
INNER JOIN clientes
ON vendas.codigo_cliente = clientes.codigo_cliente
LEFT JOIN produtos
ON vendas.codigo_produto = produtos.codigo_produto
INNER JOIN categorias
ON produtos.codigo_categoria = categorias.codigo_categoria
WHERE produtos.nome_produto LIKE "%Iphone%" AND categorias.nome_categoria LIKE "%celular%";

CREATE VIEW selecionar_todos_vendedores_e_vendas AS
SELECT
	COUNT(vendas.codigo_vendedor),
	vendedores.nome_vendedor
FROM vendas
RIGHT JOIN vendedores
ON vendas.codigo_vendedor = vendedores.codigo_vendedor
GROUP BY vendedores.nome_vendedor;

SELECT * FROM comissaoVendedores;

DELIMITER $$
CREATE PROCEDURE apagarComissaoPorCodigo(IN codigo INT, OUT mensagem VARCHAR(100))
BEGIN
	DECLARE codComissao INT DEFAULT 0;
    
    SELECT COUNT(codigo_venda) INTO codComissao FROM comissaoVendedores WHERE codigo_venda = codigo;

	IF codComissao = 1 then
		DELETE FROM comissaoVendedores WHERE codigo_venda = codigo;
		SET mensagem = "Comissao apagada";
	ELSE
		SET mensagem = "Codigo de comissão não encontrada";
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE apagarComissaoPorVendedor(IN vendedor VARCHAR(30), OUT mensagem VARCHAR(100))
BEGIN

    DECLARE codVendedor INT DEFAULT 0;
    
    SELECT codigo_vendedor FROM vendedores WHERE nome_vendedor = vendedor INTO codVendedor;
    
	IF codVendedor > 0 then
		DELETE FROM comissaoVendedores WHERE codigo_vendedor = codVendedor;
		SET mensagem = "Comissao apagada";
	ELSE
		SET mensagem = "Codigo de comissão não encontrada";
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE apagarComissaoPorProduto(IN produto VARCHAR(30), OUT mensagem VARCHAR(100))
BEGIN

    DECLARE codProduto INT DEFAULT 0;
    
    SELECT codigo_produto FROM produtos WHERE nome_produto = produto INTO codProduto;
    
	IF codProduto > 0 then
		DELETE FROM comissaoVendedores WHERE codigo_produto = codProduto;
		SET mensagem = "Comissao apagada";
	ELSE
		SET mensagem = "Codigo de comissão não encontrada";
    END IF;
END $$
DELIMITER ;

CREATE VIEW selecionar_vendedores_com_mais_de_40 AS
SELECT
	nome_vendedor
FROM vendedores
WHERE (2022 - DATE_FORMAT(nascimento_vendedor, "%YY")) > 40;

CREATE VIEW selecionar_produto_mais_caro AS
SELECT
	nome_produto,
    MAX(valor_produto)
FROM produtos;

CREATE VIEW selecionar_produto_mais_barato AS
SELECT
	nome_produto,
    MIN(valor_produto)
FROM produtos;

CREATE VIEW selecionar_valor_prduto_entre_300_e_1000 AS
SELECT
	nome_produto,
    valor_produto
FROM produtos
WHERE valor_produto between 300 AND 1000;

CREATE VIEW selecionar_samsung_appla AS
SELECT
	nome_produto,
    nome_marca
FROM produtos
RIGHT JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
HAVING nome_marca LIKE "Samsung" OR nome_marca LIKE "Apple";

SELECT
	nome_produto,
    valor_produto,
CASE 
	WHEN valor_produto > (SELECT AVG(valor_produto) FROM produtos) then 'Produto maior que a media dos valores'
	WHEN valor_produto < (SELECT AVG(valor_produto) FROM produtos) then 'Produto menor que a media dos valores'
END AS 'Mais Caro e Mais Barato'
FROM produtos;


SELECT * FROM selecionar_codigo_venda_e_nome_cliente;
SELECT * FROM selecionar_codigo_venda_e_nome_vendedor;
SELECT * FROM selecionar_codigo_venda_cliente_produto;
SELECT * FROM selecionar_codigo_venda_vendedor_filial;
SELECT * FROM selec_codigo_venda_clie;
SELECT * FROM selecionar_clientes_compr_iphone;
SELECT * FROM selecionar_todos_vendedores_e_vendas;
SELECT * FROM comissaoVendedores;
SELECT * FROM produtos;
SELECT * FROM selecionar_vendedores_com_mais_de_40;
SELECT * FROM selecionar_produto_mais_caro;
SELECT * FROM selecionar_produto_mais_barato;
SELECT * FROM selecionar_valor_prduto_entre_300_e_1000;
SELECT * FROM selecionar_samsung_appla;


#DROP TRIGGER gerar_comissao;
#DROP TRIGGER gerar_imposto;

#DROP PROCEDURE atualizarTaxaComissao;
#DROP PROCEDURE cadastrarFilial;
#DROP PROCEDURE cadastrarVendedores;
#DROP PROCEDURE cadastrarClientes;
#DROP PROCEDURE cadastrarCategorias;
#DROP PROCEDURE atualizarNomeFilial;
#DROP PROCEDURE atualizarValorProduto;
#DROP PROCEDURE apagarComissaoPorVendedor;
#DROP PROCEDURE apagarComissaoPorCodigo;
#DROP PROCEDURE apagarComissaoPorProduto;
#DROP VIEW selecionar_clientes_compr_iphone;
#DROP VIEW selecionar_codigo_venda_e_nome_cliente;
#DROP VIEW selecionar_codigo_venda_e_nome_vendedor;
#DROP VIEW selecionar_codigo_venda_cliente_produto;
#DROP VIEW selecionar_codigo_venda_vendedor_filial;
#DROP VIEW selec_codigo_venda_clie;
#DROP VIEW selecionar_todos_vendedores_e_vendas;
#DROP TABLE comissaoVendedores;
#DROP TABLE vendas;
#DROP TABLE produtos;
#DROP TABLE marcas;
#DROP TABLE categorias;
#DROP TABLE clientes;
#DROP TABLE vendedores;
#DROP TABLE filiais;
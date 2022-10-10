# Criar a base de dados
#CREATE DATABASE base;

# Selecionar base de dados
USE base;

#Criar tabela de produtos
CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    marca VARCHAR(20),
    valor DOUBLE,
    dataCadastro DATE
);

# Cadastrar produtos #1
INSERT INTO produtos VALUEcodigomarcaS(null, "Notebook Inspiron", "DELL", 4599, "2022-10-10");

# Selecionar todos os produtos
SELECT * FROM produtos;

# Cadastrar produtos 2
INSERT INTO produtos (nome, marca, valor) VALUES("Notebook Dell", "Dell", 2900);

# Selecionar todos os produtos
SELECT * FROM produtos;

# Cadastrar produtos 3
INSERT INTO produtos VALUES
(null, "iPhone 13", "Apple", 7000, "2022-08-07"),
(null, "Monitor Predator", "Acer", 1950, "2022-10-07"),
(null, "Notebook Vostro", "Dell", 3800, "2022-03-16");

# Selecionar todos os produtos
SELECT * FROM produtos;

# Selecionar as colunas nome e valor
SELECT nome, valor FROM produtos;

# Selecionar produtos com valor inferior a R$ 3.000,00
SELECT * FROM produtos WHERE valor < 3000;

# Selecionar informações com atributos nulos
SELECT * FROM produtos WHERE dataCadastro IS NULL;

# Agrupar informações
SELECT MAX(valor) AS "Maior Valor" FROM produtos;
SELECT MIN(valor) AS "Maior Valor" FROM produtos;
SELECT AVG(valor) AS "Maior Valor" FROM produtos;
SELECT COUNT(*) AS "Registros" FROM produtos;

# Condicional
SELECT
	nome,
    valor,
    IF(valor >= 3000, valor*0.9, valor*0.95) AS "Pagamento a vista"
FROM produtos;

# Escolha
SELECT
	nome,
    valor,
    CASE 
		WHEN valor <= 1000 THEN ROUND(valor * 0.95)
        WHEN valor <= 2000 THEN ROUND(valor * 0.90)
        WHEN valor <= 4000 THEN ROUND(valor * 0.85)
        ELSE ROUND(valor * 0.80)
	END AS "Descontos"
FROM produtos;
        
# Operadores lógicos (AND OR)
SELECT * FROM produtos WHERE marca = "Dell" AND valor >= 3000;

# Ordenar dados
SELECT nome FROM produtos ORDER BY nome DESC;

# Agrupar
SELECT marca FROM produtos GROUP BY marca;

# Contêm (like)
SELECT nome FROM produtos WHERE nome LIKE "N%";
SELECT nome FROM produtos WHERE nome LIKE "%o";
SELECT nome FROM produtos WHERE nome LIKE "%p%";

# UPDATE - alterar dados
UPDATE produtos SET valor = 7000 WHERE codigo = 1;

# Sub-query
SELECT * FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

# Remover dados - delete
DELETE FROM produtos WHERE nome LIKE "Notebook%";
DELETE FROM produtos;

# Limpar a tabela e reiniciar o auto incremento
TRUNCATE TABLE produtos;

# Listar as colunas da tabela;
DESCRIBE produtos;

# Criar coluna
ALTER TABLE produtos ADD COLUMN estoque INT;

# Remover coluna
ALTER TABLE pr#odutos DROP COLUMN estoque;

# Alterar características das colunas
ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(50);

#Renomear coluna
ALTER TABLE produtos RENAME COLUMN nome to produto;

# Excluir tabela
DROP TABLE produtos;

# Excluir base de dados
DROP DATABASE base;

# Base de dados
CREATE DATABASE projeto;

# Selecionar base de dados
USE projeto;

# Tabela de marcas
CREATE TABLE marcas(
	codigo_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(30) NOT NULL
);

INSERT INTO marcas (nome_marca) VALUES
("Apple"),
("Samsung"),
("Xiaomi");

# Tabela de produtos
CREATE TABLE produtos(
	codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(40) NOT NULL,
    codigo_marca INT,
    FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca)
);

# Inserir produtos
INSERT INTO produtos (nome_produto, codigo_marca) VALUES
("iPhone 13", 1),
("Samsung Galaxy S20", 2),
("iPhone 12", 1);

SELECT * FROM produtos;

# Inner Join
SELECT
	produtos.nome_produto,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;


TRUNCATE TABLE produtos;

SELECT
	marcas.nome_marca,
    COUNT(produtos.codigo_marca)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

SELECT
	marcas.nome_marca,
    COUNT(produtos.codigo_marca)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

SELECT
	marcas.nome_marca,
    COUNT(produtos.codigo_marca)
FROM marcas
LEFT JOIN produtos
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

SELECT *, NOW() FROM produtos LIMIT 1;

SELECT
	*,
    DATE_FORMAT(NOW(), "%d/%m/%Y"),
	DATE_FORMAT(NOW(), "%H:%i")	
FROM produtos LIMIT 1;

/*
  > maior
  < menor
  >= maior igual
  <= menor igual
  = igual
  <> diferente
*/


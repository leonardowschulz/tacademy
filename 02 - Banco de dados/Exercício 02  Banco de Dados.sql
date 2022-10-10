CREATE TABLE produtos(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    marca VARCHAR(25),
    valor DOUBLE,
    estoque INT
);

INSERT INTO produtos VALUES
(null, "Teclado", "Microsoft", 220.00,60),
(null, "Monitor 32", "Samsung", 3700.00, 20),
(null, "Mouse", "Logitech", 129.90, 45),
(null, "Impressora", "Epson", 430.00, 15),
(null, "Mouse", "Microsoft", 199.90, 50),
(null, "Monitor 27", "LG", 1990.80, 30),
(null, "Cadeira Gamer", "Multilaser", 1170.00, 20),
(null, "Teclado", "Dell", 110.00, 50),
(null, "Mouse", "HP", 80.00, 70),
(null, "Placa de vídeo - GeForce GTX 1660", "ASUS", 2800.00, 10),
(null, "SSD de 256GB", "Kingston", 400.00, 15),
(null, "Processador Core i5 - 10º geração", "Intel", 1800.00, 10),
(null, "Mouse", "Multilaser", 44.90, 70),
(null, "Monitor 23", "Dell", 1080.00, 40),
(null, "Teclado", "HP", 119.90, 25);

SELECT * FROM produtos;

SELECT marca, COUNT(nome) FROM produtos GROUP BY marca;

SELECT AVG(valor) FROM produtos;

SELECT marca, SUM(valor) FROM produtos GROUP BY marca;

SELECT nome, valor FROM produtos ORDER BY valor DESC;

SELECT nome, valor FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

SELECT nome FROM produtos WHERE valor >= (SELECT AVG(valor) FROM produtos);

SELECT nome, marca, valor, estoque FROM produtos WHERE estoque = (SELECT MAX(estoque) FROM produtos);

SELECT nome, marca, valor FROM produtos WHERE valor >= 100 AND valor <= 500;

SELECT nome, marca, valor FROM produtos WHERE nome LIKE "%mouse%" GROUP BY valor;

SELECT nome, char_length(nome) FROM produtos;

UPDATE produtos SET marca = "Alienware" WHERE marca = "Dell";

DROP TABLE produtos;
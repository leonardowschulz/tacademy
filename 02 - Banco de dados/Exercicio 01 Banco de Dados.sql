
CREATE DATABASE base;

USE base;

CREATE TABLE clientes(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    cidade VARCHAR(20),
    idade INT
);

INSERT INTO clientes VALUES
(null, "Érica", "Curitiba", 28),
(null, "Lucas", "Blumenau", 16),
(null, "Larissa", "Florianópolis", 36),
(null, "Murilo", "Joinville", 23),
(null, "Cristiane", "Blumenau", 31),
(null, "Robson", "Joinville", 42),
(null, "Mariana", null, 37),
(null, "Jean", "Blumenau", 43),
(null, "Luana", "Pomerode", 19),
(null, "Cleber", "Brusque", 34),
(null, "Hellen", "Blumenau", 28),
(null, "Paulo", "Joinville", 44),
(null, "Alessandra", "São Paulo", 28),
(null, "Dênis", "Blumenau", 37),
(null, "Bianca", "Campinas", 23),
(null, "Gabriel", "São Paulo", 26);

SELECT * FROM clientes;

SELECT COUNT(*) AS "Registros" FROM clientes;

SELECT * FROM clientes WHERE idade = (SELECT MAX(idade) FROM clientes);

SELECT cidade FROM clientes GROUP BY cidade;

SELECT COUNT(*), cidade FROM clientes GROUP BY cidade;

SELECT nome, idade FROM clientes WHERE cidade IS NULL;

SELECT AVG(idade) AS "MEDIA IDADE" FROM clientes;

SELECT nome, idade FROM clientes WHERE idade = (SELECT MIN(idade) FROM clientes);

SELECT nome, idade FROM clientes WHERE idade >= (SELECT AVG(idade) FROM clientes);

SELECT nome, idade, cidade FROM clientes WHERE idade >= 20 AND idade <= 30;

SELECT nome, idade, cidade FROM clientes WHERE cidade = "Blumenau" AND idade >= 30;

SELECT nome, cidade FROM clientes WHERE cidade = "Florianópolis" OR cidade = "Curitiba";

SELECT nome FROM clientes WHERE nome LIKE "%L%";

SELECT nome FROM clientes ORDER BY nome;

UPDATE clientes SET cidade = "Blumenau" WHERE cidade IS NULL;

DELETE FROM clientes WHERE cidade <> "Blumenau";

DROP TABLE clientes;
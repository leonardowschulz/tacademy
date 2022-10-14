CREATE TABLE alunos(
	codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(30) NOT NULL,
    nota1_aluno DOUBLE NOT NULL,
    nota2_aluno DOUBLE NOT NULL,
    media_aluno DOUBLE,
    situacao_aluno VARCHAR(15)
);

CREATE TRIGGER gerar_media
BEFORE INSERT ON alunos
FOR EACH ROW
SET NEW.media_aluno = ((NEW.nota1_aluno + NEW.nota2_aluno) / 2);

CREATE FUNCTION IncomeLevel ( monthly_value INT )
RETURNS varchar(20)

DELIMITER //
BEGIN
   DECLARE situacao_aluno VARCHAR(15);
   IF media_aluno >= 7 THEN
      SET situacao_aluno = 'Aprovado(a)';
   ELSEIF media_aluno < 7 THEN
      SET situacao_aluno = 'Reprovado(a)';
   END IF;
   RETURN situacao_aluno;
END;
DELIMITER ;

DROP TRIGGER gerar_media;
DROP TABLE alunos;



CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    valor_produto DOUBLE NOT NULL,
    valor_promocional DOUBLE
);

CREATE TRIGGER gerar_desconto
BEFORE INSERT ON produtos
FOR EACH ROW
SET NEW.valor_promocional = (NEW.valor_produto * 0.9);

INSERT INTO produtos VALUES
(1, "Teste", 300, null);

SELECT * FROM produtos;

DROP TRIGGER gerar_desconto;
DROP TABLE produtos;


CREATE TABLE produtos(
	codigo_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30),
    segmento_produto VARCHAR(20)
);

CREATE TABLE qtd_segmentos(
	nome_segmento VARCHAR(30),
    quantidade_segmento INT
);

INSERT INTO qtd_segmentos VALUES
("Segmento1", 0),
("Segmento2", 0),
("Segmento3", 0);



DELIMITER $$

CREATE TRIGGER adicionaSegmento
AFTER INSERT ON produtos
FOR EACH ROW BEGIN
UPDATE qtd_segmentos, produtos SET qtd_segmentos.quantidade_segmento = qtd_segmentos.quantidade_segmento + 1 WHERE qtd_segmentos.nome_segmento = produtos.segmento_produto;
END $$

DELIMITER ;



INSERT INTO produtos VALUES
(1, "Teste", "Segmento1");
SELECT * FROM produtos;
SELECT * FROM qtd_segmentos;

DROP TRIGGER adicionaSegmento;
DROP TABLE qtd_segmentos;
DROP TABLE produtos;
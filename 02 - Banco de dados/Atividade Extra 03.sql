CREATE TABLE clientes(
	codigo_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(30),
    email_cliente VARCHAR(50)
);

DELIMITER $$
CREATE PROCEDURE cadastrar(IN nome VARCHAR(30), IN email VARCHAR(50))
BEGIN
	INSERT INTO clientes VALUES (null, nome, email);
END $$
DELIMITER ;

CALL cadastrar("Leo", "leonardows@gmail.com", @mensagem);

SELECT * FROM clientes;

DROP PROCEDURE cadastrar;

DELIMITER $$
CREATE PROCEDURE cadastrar(IN nome VARCHAR(30), IN email VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
	DECLARE tamanhonome INT DEFAULT 0;
    DECLARE arroba INT DEFAULT 0;
    DECLARE x INT DEFAULT 0;

	SELECT COUNT(*)
	INTO tamanhonome
	FROM clientes
	WHERE nome_cliente = nome LIMIT 1;

	IF LENGTH(nome) >= 3 AND LENGTH(nome) <= 30 then
		IF LENGTH(email) >= 10 then
			loop_label: LOOP
				IF x <= LENGTH(email) then
					LEAVE loop_label;
				END IF;
				IF SUBSTR(email, x, 1) = "@" then
					set arroba = arroba + 1;
				END IF;
			END LOOP;
			IF arroba < 2 then
				IF (SELECT COUNT(email_cliente) FROM clientes WHERE email_cliente = email ) < 1 then
					INSERT INTO clientes VALUES (null, nome, email);
					SET mensagem = "Cliente cadastrado";
				ELSE
					SET mensagem = "E-mail já cadastrado";
			END IF;
			ELSE
				SET mensagem = "E-mail possui mais de 1 @";
		END IF;
		ELSE
			SET mensagem = "E-mail com menos de 10 caracteres";
	END IF;
	ELSE
		SET mensagem = "O nome deve ter entre 3 e 30 caracteres";
END IF;
                
END $$
DELIMITER ;

SELECT @mensagem;
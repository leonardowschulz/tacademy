CREATE TABLE cargos(
codigo_cargo INT PRIMARY KEY AUTO_INCREMENT,
nome_cargo VARCHAR(20),
salario_cargo DOUBLE
);

CREATE TABLE colaboradores(
codigo_colaborador INT PRIMARY KEY AUTO_INCREMENT,
nome_colaborador VARCHAR(40),
nascimento_colaborador DATE,
codigo_cargo INT,
FOREIGN KEY(codigo_cargo) REFERENCES cargos(codigo_cargo),
estado_trabalho VARCHAR(2),
cidade_trabalho VARCHAR(20),
genero_colaborador VARCHAR(10)
);

ALTER TABLE cargos MODIFY COLUMN nome_cargo varchar(50);

describe cargos;

INSERT INTO cargos VALUES
(null, "Desenvolvedor", 3000.00),
(null, "Analista", 4500.00),
(null, "Arquiteto de Software", 6200.00),
(null, "Administrador de Banco de Dados", 7700.00),
(null, "Gerente de Projetos", 9000.00);


INSERT INTO colaboradores VALUES
(1, "Jefferson", "1973-05-19", 1, "SC", "Blumenau", "Masculino"),
(2, "Larissa", "1991-01-22", 5, "SC", "Joinville", "Feminino"),
(3, "Cleber", "1987-03-18", 2, "PR", "Curitiba", "Masculino"),
(4, "Luciano", "1995-08-09", 1, "SC", "Blumenau", "Masculino"),
(5, "Jéssica", "1988-08-22", 4, "SC", "Florianópolis", "Feminino"),
(6, "Guilherme", "1982-11-16", 2, "SC", "Blumenau", "Masculino"),
(7, "Marcelo", "1993-04-15" , 2, "PR", "Londrina", "Masculino"),
(8, "Brenda", "1992-02-17", 1, "SC", "Joinville", "Feminino"),
(9, "Rebeca", "1984-06-26", 4, "SC", "Blumenau", "Feminino"),
(10, "Cristiano", "1983-07-02", 1, "SC", "Florianópolis", "Masculino"),
(11, "Éder", "1991-11-10", 1, "SC", "Blumenau", "Masculino"),
(12, "William", "1992-12-17", 2, "PR", "Curitiba", "Masculino"),
(13, "Vanessa", "1996-09-29", 1, "SC", "Blumenau", "Feminino"),
(14, "Robson", "1984-05-30", 1, "PR", "Londrina", "Masculino"),
(15, "Tatiana", "1990-02-03", 5, "PR", "Curitiba", "Feminino"),
(16, "Henrique", "1999-10-07", 1, "SC", "Blumenau", "Masculino"),
(17, "Lorena", "1996-04-20", 1, "SC", "Joinville", "Feminino"),
(18, "Carla", "1988-09-28", 4, "PR", "Curitiba", "Feminino"),
(19, "Alexandre", "1982-07-17", 2, "SC", "Blumenau", "Masculino");

SELECT
	colaboradores.nome_colaborador,
    cargos.nome_cargo,
    cargos.salario_cargo
FROM colaboradores
INNER JOIN cargos
ON colaboradores.codigo_cargo = cargos.codigo_cargo;
    
SELECT
	cargos.nome_cargo,
    COUNT(colaboradores.codigo_cargo)
FROM colaboradores
LEFT JOIN cargos
ON colaboradores.codigo_cargo = cargos.codigo_cargo
GROUP BY nome_cargo;


SELECT
	colaboradores.genero_colaborador,
    AVG(cargos.salario_cargo)
    FROM colaboradores
    LEFT JOIN cargos
    ON colaboradores.codigo_cargo = cargos.codigo_cargo
    GROUP BY colaboradores.genero_colaborador;
    
SELECT
	nome_colaborador,
    nascimento_colaborador
FROM colaboradores
WHERE (2022 - DATE_FORMAT(nascimento_colaborador, "%YYYY")) >= 20 AND (2022 - DATE_FORMAT(nascimento_colaborador, "%YYYY")) <= 30;

SELECT
	estado_trabalho,
    COUNT(estado_trabalho)
FROM colaboradores
GROUP BY estado_trabalho;

SELECT
	cidade_trabalho,
    COUNT(cidade_trabalho)
FROM colaboradores
GROUP BY cidade_trabalho;

SELECT
	genero_colaborador,
    COUNT(genero_colaborador)
FROM colaboradores
WHERE (2022 - DATE_FORMAT(nascimento_colaborador, "%YYYY")) > 30 AND estado_trabalho = "PR" AND genero_colaborador = "Feminino";

SELECT
	colaboradores.cidade_trabalho,
    AVG(cargos.salario_cargo)
FROM colaboradores
LEFT JOIN cargos
ON colaboradores.codigo_cargo = cargos.codigo_cargo
GROUP BY colaboradores.cidade_trabalho;

SELECT
	AVG(cargos.salario_cargo)
FROM colaboradores
LEFT JOIN cargos
ON colaboradores.codigo_cargo = cargos.codigo_cargo;

SELECT
	colaboradores.nome_colaborador,
    colaboradores.nascimento_colaborador,
    cargos.nome_cargo,
    cargos.salario_cargo,
    colaboradores.cidade_trabalho,
    colaboradores.estado_trabalho,
    colaboradores.genero_colaborador
FROM colaboradores
LEFT JOIN cargos
ON colaboradores.codigo_cargo = cargos.codigo_cargo
HAVING (2022 - DATE_FORMAT(colaboradores.nascimento_colaborador, "%Y")) <= MAX((2022 - DATE_FORMAT(colaboradores.nascimento_colaborador, "%Y")));

SELECT
	COUNT(nascimento_colaborador)
	FROM colaboradores
WHERE (DATE_FORMAT(nascimento_colaborador, "%Y")/10 >= 199);

DROP TABLE colaboradores;
DROP TABLE cargos;

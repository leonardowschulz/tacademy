CREATE TABLE alunos(
	nome VARCHAR(40),
    Turma VARCHAR(10),
    nota01 DOUBLE,
    nota02 DOUBLE,
    nota03 DOUBLE,
    turno VARCHAR(10)
);

INSERT INTO alunos VALUES
("Ana Paula", "7A", 5, 8, 7, "Vespertino"),
("Caio Neves", "8B", 3, 4, 2, "Matutino"),
("Isabella Fontana", "7C" ,9, 8.5, 9, "Vespertino"),
("Daniel Luz", "8A", 2, 5, 4, "Vespertino"),
("Gabriela Braga", "8A", 10, 10, 10, "Vespertino"),
("Ellen Souza", "7A", 5, 8, 7, "Matutino"),
("Luciana Biltz", "8B", 9.5, 10, 10, "Vespertino"),
("Paulo Almeida", "8A", 10, 10, 10, "Matutino"),
("Carla Malta", "7B", 3, 7, 9, "Matutino"),
("Diogo Andrade", "8C", 10, 9, 10, "Vespertino"),
("Mônica Mota", "8A", 7, 7, 8, "Vespertino"),
("Juliana Lima", "8C", 9, 8, 2, "Vespertino"),
("Marcelo Matos", "7A", 9, 10, 5, "Matutino");

SELECT nome,
	IF((nota01+nota02+nota03) / 3 >= 7, "Aprovado", "Reprovado")
FROM alunos;

SELECT turno, COUNT(turno) FROM alunos GROUP BY turno;

SELECT turma, COUNT(turma) FROM alunos GROUP BY turma;

SELECT nome, ((nota01+nota02+nota03) / 3)  AS "Media" FROM alunos WHERE (nota01+nota02+nota03) / 3 >= 7;

SELECT nome, ((nota01+nota02+nota03) / 3)  AS "Media" FROM alunos WHERE (nota01+nota02+nota03) / 3 < 7 AND turno = "Vespertino";

SELECT nome FROM alunos WHERE ((nota01+nota02+nota03) / 3) = (SELECT MAX((nota01+nota02+nota03) / 3) FROM alunos);

SELECT turma, ((nota01+nota02+nota03) / 3) AS "Media" FROM alunos GROUP BY turma;

UPDATE alunos SET turma = "8A" WHERE turma = "8B";

DROP TABLE alunos;
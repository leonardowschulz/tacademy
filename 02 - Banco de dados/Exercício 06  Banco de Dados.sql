CREATE TABLE professores(
	codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(20)
);

CREATE TABLE materias(
	codigo_materia INT PRIMARY KEY AUTO_INCREMENT,
    codigo_professor INT,
    FOREIGN KEY(codigo_professor) REFERENCES professores(codigo_professor),
    nome_materia VARCHAR(20)
);

CREATE TABLE turmas(
	codigo_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(2),
    turno_turma VARCHAR(10)
);

CREATE TABLE alunos(
	codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(30)
);

CREATE TABLE alunos_turmas(
	codigo_aluno INT,
    FOREIGN KEY(codigo_aluno) REFERENCES alunos(codigo_aluno),
    codigo_materia INT,
    FOREIGN KEY (codigo_materia) REFERENCES materias(codigo_materia),
    codigo_turma INT,
    FOREIGN KEY (codigo_turma) REFERENCES turmas(codigo_turma)
);


INSERT INTO professores VALUES
(1, "Renato"),
(2, "Oscar"),
(3, "Cátia"),
(4, "Osvaldo"),
(5, "Marília"),
(6, "Paula"),
(7, "Otávio"),
(8, "Airton");


INSERT INTO materias VALUES
(1, 1, "Matemática"),
(2, 2, "Geografia"),
(3, 7, "Química"),
(4, 6, "Filosofia"),
(5, 1, "Física"),
(6, 3, "Português"),
(7, 3, "Inglês"),
(8, 6, "Sociologia"),
(9, 5, "Português"),
(10, 4, "História"),
(11, 4, "Sociologia"),
(12, 5, "Espanhol"),
(13, 8, "Biologia"),
(14, 8, "Química");

INSERT INTO turmas VALUES
(1, "6A", "Matutino"),
(2, "6B", "Vespertino"),
(3, "7A", "Matutino"),
(4, "7A", "Vespertino"),
(5, "8A", "Matutino"),
(6, "8B", "Vespertino");


INSERT INTO alunos VALUES
(1, "Alessandra"),
(2, "Emanuela"),
(3, "Cíntia"),
(4, "Diego"),
(5, "Eduardo"),
(6, "Larissa"),
(7, "Jonathan"),
(8, "Cleber"),
(9, "Jéssica"),
(10, "Lucas"),
(11, "Murilo"),
(12, "Marcelo"),
(13, "Rebeca"),
(14, "Tatiana"),
(15, "Taís"),
(16, "Gabriel"),
(17, "Felipe"),
(18, "Eliza"),
(19, "Sarah"),
(20, "Patrícia");

INSERT INTO alunos_turmas VALUES
(1, 1, 1),
(2, 5, 1),
(3, 10, 2),
(4, 14, 1),
(5, 1, 1),
(6, 2, 6),
(7, 3, 2),
(8, 6, 3),
(9, 5, 4),
(10, 4, 4),
(11, 1, 5),
(12, 5, 2),
(13, 8, 3),
(14, 13, 6),
(15, 6, 5),
(16, 14, 3),
(17, 9, 5),
(18, 3, 1),
(19, 8, 4),
(20, 5, 6),
(4, 10, 3),
(15, 2, 1),
(12, 10, 1),
(9, 8, 6);


SELECT
	alunos.nome_aluno,
    materias.nome_materia,
    turmas.nome_turma
FROM alunos_turmas
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma;

SELECT
	professores.nome_professor,
    materias.nome_materia
FROM materias
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor;

SELECT
	turmas.nome_turma,
    COUNT(alunos_turmas.codigo_aluno)
FROM alunos_turmas
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
GROUP BY turmas.nome_turma;

SELECT
	turmas.turno_turma,
    COUNT(alunos_turmas.codigo_aluno)
FROM alunos_turmas
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
GROUP BY turmas.turno_turma;

SELECT
	alunos.nome_aluno,
    turmas.nome_turma,
    materias.nome_materia
FROM alunos_turmas
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE professores.nome_professor = "Renato"; 

SELECT
	professores.nome_professor
FROM materias
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE materias.nome_materia = "Química";

SELECT
	alunos.nome_aluno,
    materias.nome_materia
FROM alunos_turmas
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
WHERE materias.nome_materia = "História"; 

SELECT
	professores.nome_professor
FROM materias
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE (materias.nome_materia = "Inglês" OR materias.nome_materia = "Português") HAVING COUNT(nome_professor) > 1;

SELECT
	materias.nome_materia,
    COUNT(alunos.nome_aluno)
FROM alunos_turmas
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
GROUP BY materias.nome_materia;

SELECT
	alunos.nome_aluno,
    materias.nome_materia
FROM alunos_turmas
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE materias.nome_materia = "Inglês" AND professores.nome_professor = "Cátia";

SELECT
	turmas.nome_turma,
    turmas.nome_turma,
    alunos.nome_aluno,
    materias.nome_materia
FROM alunos_turmas
LEFT JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
LEFT JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
WHERE turmas.nome_turma = "6A" AND professores.nome_professor = "Renato" AND materias.nome_materia = "Matemática";

SELECT
	professores.nome_professor,
    materias.nome_materia
FROM materias
INNER JOIN professores
ON materias.codigo_professor = professores.codigo_professor
HAVING professores.nome_professor = "Airton";

SELECT
	turmas.turno_turma,
    materias.nome_materia,
    COUNT(alunos.nome_aluno)
FROM alunos_turmas
INNER JOIN materias
ON alunos_turmas.codigo_materia = materias.codigo_materia
INNER JOIN turmas
ON alunos_turmas.codigo_turma = turmas.codigo_turma
INNER JOIN alunos
ON alunos_turmas.codigo_aluno = alunos.codigo_aluno
WHERE turmas.turno_turma = "Vespertino" AND materias.nome_materia = "Biologia";

DROP TABLE alunos_turmas;
DROP TABLE alunos;
DROP TABLE turmas;
DROP TABLE materias;
DROP TABLE professores;
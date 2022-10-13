CREATE TABLE professores(
	codigo_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(20)
);

CREATE TABLE cursos(
	codigo_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(20),
    valor_curso DOUBLE,
    codigo_professor INT,
    FOREIGN KEY(codigo_professor) REFERENCES professores(codigo_professor)
);

CREATE TABLE alunos(
	codigo_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(20),
    nascimento_aluno DATE,
    estado_aluno VARCHAR(20),
    cidade_aluno VARCHAR(40)
);

CREATE TABLE alunos_cursos(
	codigo_aluno INT,
    codigo_curso INT,
    status_curso VARCHAR(20)
);

INSERT INTO professores VALUES
(1, "Larissa"),
(2, "Daniel"),
(3, "Gustavo"),
(4, "Carla"),
(5, "Guilherme"),
(6, "Carina"),
(7, "Lúcio"),
(8, "Bianca");

INSERT INTO cursos VALUES
(1, "Java - Básico", 1000.00, 2),
(2, "Java - Avançado", 1250.00, 2),
(3, "Spring Boot", 1800.00, 2),
(4, "C#", 1140.00, 7),
(5, "ASP.NET Core", 1800.00, 7),
(6, "Python", 900.00, 4),
(7, "Flask", 1020.00, 4),
(8, "Django", 1400.00, 4),
(9, "PHP", 950.00, 4),
(10, "Laravel", 1600.00, 4),
(11, "Angular", 2300.00, 1),
(12, "React", 2100.00, 1),
(13, "HTML", 500.00, 8),
(14, "CSS", 700.00, 8),
(15, "JavaScript", 900.00, 4),
(16, "Banco de dados", 600.00, 3),
(17, "Design Patterns", 2700.00, 8);

INSERT INTO alunos VALUES
(1, "Aline", "1997-03-01", "Santa Catarina", "Blumenau"),
(2, "Mariana", "1993-08-28", "Santa Catarina", "Joinville"),
(3, "Gustavo", "2000-11-14", "São Paulo", "Campinas"),
(4, "Bianca", "1999-01-07", "Santa Catarina", "Blumenau"),
(5, "Ricardo", "2002-07-30", "Paraná", "Curitiba"),
(6, "Tamara", "2005-02-22", "São Paulo", "São Paulo"),
(7, "Juliano", "1986-09-19", "Paraná", "Londrina"),
(8, "Fernanda", "1987-01-28", "São Paulo", "São Paulo"),
(9, "Alice", "2001-06-13", "Santa Catarina", "Blumenau"),
(10, "Henrique", "1991-01-24", "Rio de Janeiro", "Niterói"),
(11, "Marcelo", "1988-12-08", "Paraná", "Curitiba"),
(12, "Daniela", "1998-10-14", "Santa Catarina", "Florianópolis"),
(13, "Caroline", "2002-04-10", "Paraná", "Maringá"),
(14, "Letícia", "1993-08-22", "São Paulo", "São Paulo"),
(15, "Mauro", "1996-09-08", "Santa Catarina", "Jaraguá do Sul");

INSERT INTO alunos_cursos VALUES
(1, 2, "Concluído"),
(3, 6, "Em andamento"),
(1, 7, "Concluído"),
(4, 2, "Em andamento"),
(9, 16, "Não iniciado"),
(8, 10, "Concluído"),
(1, 4, "Concluído"),
(4, 9, "Não iniciado"),
(10, 2, "Em andamento"),
(7, 1, "Concluído"),
(12, 2, "Não iniciado"),
(2, 1, "Não iniciado"),
(15, 7, "Não iniciado"),
(11, 2, "Concluído"),
(6, 13, "Em andamento"),
(3, 4, "Em andamento"),
(4, 10, "Em andamento"),
(9, 17, "Concluído"),
(1, 5, "Em andamento"),
(10, 8, "Em andamento");

SELECT
	alunos.nome_aluno,
    COUNT(cursos.codigo_curso)
FROM alunos_cursos
INNER JOIN alunos
ON alunos_cursos.codigo_aluno = alunos.codigo_aluno
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
WHERE cursos.codigo_curso > 0
GROUP BY alunos.nome_aluno;

SELECT
	alunos_cursos.status_curso,
    COUNT(cursos.nome_curso)
FROM alunos_cursos
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
GROUP BY alunos_cursos.status_curso;

SELECT
	alunos.nome_aluno,
    cursos.nome_curso,
    alunos_cursos.status_curso,
    cursos.valor_curso
FROM alunos_cursos
INNER JOIN alunos
ON alunos_cursos.codigo_aluno = alunos.codigo_aluno
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
WHERE cursos.valor_curso > 1000 AND alunos_cursos.status_curso = "Concluído";

SELECT
	alunos.estado_aluno,
    COUNT(alunos.codigo_aluno)
FROM alunos
GROUP BY alunos.estado_aluno;

SELECT
	alunos.nome_aluno,
    cursos.nome_curso,
    alunos_cursos.status_curso
FROM alunos_cursos
INNER JOIN alunos
ON alunos_cursos.codigo_aluno = alunos.codigo_aluno
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
WHERE alunos_cursos.status_curso = "Não iniciado";

SELECT
	alunos.nome_aluno,
    COUNT(alunos_cursos.codigo_curso)
FROM alunos_cursos
INNER JOIN alunos
ON alunos_cursos.codigo_aluno = alunos.codigo_aluno
WHERE TIMESTAMPDIFF(YEAR, alunos.nascimento_aluno, CURDATE()) < 18
GROUP BY alunos.nome_aluno;

SELECT
	cursos.nome_curso,
    cursos.valor_curso,
    COUNT(alunos_cursos.codigo_curso)
FROM alunos_cursos
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
WHERE cursos.valor_curso = (SELECT MAX(valor_curso) FROM cursos);

SELECT
	professores.nome_professor,
    COUNT(alunos_cursos.codigo_curso)
FROM alunos_cursos
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
INNER JOIN professores
ON cursos.codigo_professor = professores.codigo_professor
GROUP BY professores.nome_professor;

SELECT
	professores.nome_professor,
    COUNT(alunos_cursos.codigo_aluno)
FROM alunos_cursos
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
INNER JOIN professores
ON cursos.codigo_professor = professores.codigo_professor
GROUP BY professores.nome_professor;

SELECT
	alunos.nome_aluno,
    cursos.nome_curso,
    cursos.valor_curso,
    professores.nome_professor
FROM alunos_cursos
LEFT JOIN alunos
ON alunos_cursos.codigo_aluno = alunos.codigo_aluno
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
INNER JOIN professores
ON cursos.codigo_professor = professores.codigo_professor;

SELECT
	AVG(cursos.valor_curso) AS "Média valores"
FROM cursos;

SELECT
	cursos.nome_curso,
    cursos.valor_curso,
    COUNT(alunos_cursos.codigo_aluno)
FROM alunos_cursos
INNER JOIN cursos
ON alunos_cursos.codigo_curso = cursos.codigo_curso
WHERE cursos.valor_curso >= (SELECT AVG(valor_curso) FROM cursos)
GROUP BY cursos.nome_curso;
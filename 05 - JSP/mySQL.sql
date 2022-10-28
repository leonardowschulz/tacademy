#Criar base de dados
CREATE DATABASE JSP;

# Selecionar base de dados
USE jsp;

# Criar tabela de pessoas
CREATE TABLE pessoas(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    idade int
);
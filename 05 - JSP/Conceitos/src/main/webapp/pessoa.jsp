<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerenciar pessoas</title>

	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="pessoa.css">
	
	<!--  JS -->
	<script src="pessoa.js"></script>
	
</head>
<body>

	<!-- 
		Métodos:
			GET -> Exibe os valores informados na URL
			POST -> Oculta os valores informados
	 -->

	<form action="cadastrarPessoa.jsp" method="post" onsubmit="return valida()">
		<input type="text" placeholder="Nome" name="nome" id="nome" class="form-control">
		<input type="number" placeholder="Idade" name="idade" id="idade" class="form-control">
		<input type="submit" value="Cadastrar" class="btn btn-primary">	
	</form>
	
	<table class="table">
		<thead>
		<tr>
			<th>#</th>
			<th>Nome</th>
			<th>Idade</th>
			<th>Remover</th>		
		</tr>
		</thead>
		
		<tbody>
			
			<%
				// Conexão com o banco mySQL
				Conexao c = new Conexao();
				
				// SQL
				String sql = "SELECT * FROM pessoas";
			
				// Statement
				Statement stmt = c.efetuarConexao().createStatement();
				
				// Obter dados da tabela pessoas
				ResultSet rs = stmt.executeQuery(sql);
				
				// Laço de repetição
				while(rs.next()) {
					
				
			
			%>
		
			<tr>
				<td><% out.print(rs.getInt(1)); %></td>
				<td><% out.print(rs.getString(2)); %></td>
				<td><% out.print(rs.getInt(3)); %></td>
				<td><a href="removerPessoa.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Remover</a></td>
			</tr>
			
			<% } %>
			
		</tbody>
	</table>

</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posts</title>

<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="posts.css">
	
	<!--  JS -->
	<script src="posts.js"></script>
	
</head>
<body>
<%
	 String name=(String)session.getAttribute("admin");

	 if(name == null) {
		 response.sendRedirect("login.jsp");
	 }
		 %>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
		  
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			  <li class="nav-item">
				<a class="nav-link active" aria-current="page" href="index.jsp">Blog</a>
			  </li>
			  
			  <% if(name != null) {	%>
			  
			  <li class="nav-item">
				<a class="nav-link active" href="posts.jsp">Manutenção</a>
			  </li>
			  <li class="nav-item">
					<a class="nav-link active" href="user.jsp">Admin logado: <% out.print(name); %></a>
				  </li>
			  				  	
				  <li class="nav-item">
					<a class="nav-link active" href="logout.jsp">Logout</a>
				  </li>
			  <% }	  %>

			  

			</ul>
			<form class="d-flex" role="search" action="pesquisa.jsp" method="post">
			  <input class="form-control me-2" type="search" placeholder="Busca..." aria-label="Search" id="busca" name="busca">
			  <button class="btn btn-outline-success" type="submit">Busca</button>
			</form>
		  </div>
		</div>
	  </nav>
	<div class="corpo">
	
	<h1 id="novoPost">Novo post:</h1>
	
	<form action="cadastroPostagem.jsp" method="post" onsubmit="return valida()" id="cadastroPost">
		<input type="text" placeholder="Nome" name="nome" id="nome" class="form-control">
		<input type="text" placeholder="Título" name="titulo" id="titulo" class="form-control">
		<input type="text" placeholder="Texto" name="post" id="post" class="form-control">
		<input type="submit" value="Cadastrar" class="btn btn-primary">	
	</form>
	
	
	
	<table class="table">
		<thead>
		<tr>
			<th>#</th>
			<th>Nome</th>
			<th>Título</th>
			<th>Alterar</th>		
		</tr>
		</thead>
		
		<tbody>
			
			<%
				// Conexão com o banco mySQL
				Conexao c = new Conexao();
				
				// SQL
				String sql = "SELECT * FROM posts";
			
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
				<td><% out.print(rs.getString(3)); %></td>
				<td><a href="edicao.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-success">Editar/Apagar</a></td>
			</tr>
			
			<% } %>
			
		</tbody>
	</table>
	</div>
</body>
</html>
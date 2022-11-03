<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index - Blog - Avaliação</title>

<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="posts.css">
	
	<!--  JS -->
	<script src="posts.js"></script>
	
</head>
<body>
	 <%
	 String name=(String)session.getAttribute("admin");
	 String nameUser=(String)session.getAttribute("user");
	 if(name == null && nameUser == null) {
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

			  <% if(nameUser != null) { %>
			  	
			  	<li class="nav-item">
					<a class="nav-link active" href="user.jsp">Usuário logado: <% out.print(nameUser); %></a>
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
	

			<h1><% name=(String)session.getAttribute("mainuser");  
			out.print("Hello "+name);   %></h1>
			
			
	
	
			
			<%
				// Conexão com o banco mySQL
				Conexao c = new Conexao();
				
				// SQL
				String sql = "SELECT * FROM posts ORDER BY codigo DESC";
			
				// Statement
				Statement stmt = c.efetuarConexao().createStatement();
				
				// Obter dados da tabela pessoas
				ResultSet rs = stmt.executeQuery(sql);
				int i = 1;
				
				// Laço de repetição
				while(rs.next() && i <= 10) {
				
				
				
			
			%>
			
				<h2> <a href="postagem.jsp?codigo=<% out.print(rs.getInt(1)); %>"> <% out.print(rs.getString(3)); %></a></h2>
				<%
				String texto = rs.getString(4);
				if (texto.length() > 100) {
					texto = texto.substring(0, 100) + "...";
				}
				%>
				<p><% out.print(texto); %></p>
				<p>Autor: <% out.print(rs.getString(2)); %></p>
				<br>
				
			
			<%
				i++;
				} %>
</div>
</body>
</html>
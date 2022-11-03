<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Postagem</title>

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
	
	<div id="postagem">
	<%
	
				int codigo = Integer.parseInt(request.getParameter("codigo"));
				// Conexão com o banco mySQL
				Conexao c = new Conexao();
				
				// SQL
				String sql = "SELECT * FROM posts WHERE codigo =" + codigo;
			
				// Statement
				Statement stmt = c.efetuarConexao().createStatement();
				
				// Obter dados da tabela pessoas
				ResultSet rs = stmt.executeQuery(sql);

				
				// Laço de repetição
				while(rs.next()) {
				
				
				
			
			%>
			
				<h2> <% out.print(rs.getString(3)); %></h2>
				<p><% out.print(rs.getString(4)); %> </p>
				<p>Autor: <% out.print(rs.getString(2)); %></p>
				<br>
				
			
			<%	} %>
			
				<h2 id="h2comentarios">Comentários:</h2>
			
			<%
			
			// String sql comentários
			String sqlComentario = "SELECT * FROM comentario WHERE codigo_post =" + codigo;
			
			// Statement
			Statement stmtComentario = c.efetuarConexao().createStatement();
			
			// Obter dados da tabela pessoas
			ResultSet rsComentario = stmtComentario.executeQuery(sqlComentario);
			
			
			while(rsComentario.next()) {
				
				
				
				
				%>

	<div id="comentarios">


				
					<h3>Nome: <% out.print(rsComentario.getString(2)); %></h3>
					<p>Comentário: <% out.print(rsComentario.getString(3)); %></p>
					<br>
					
	</div>				
				<%	} %>
			
	

	<H2 id="h2addComentario">Adicionar um novo comentário: </H2>	

	<form action="cadastroComentario.jsp" method="post" onsubmit="return valida()" id="cadastroComentario">
		<input type="text" value="<% out.print((String)session.getAttribute("mainuser")); %>" name="nomeComentario1" id="nomeComentario1" class="form-control" disabled>
		<input type="text" placeholder="Texto" name="textoComentario" id="textoComentario" class="form-control">
		<input type="hidden" name="nomeComentario" id="nomeComentario" value="<% out.print((String)session.getAttribute("mainuser")); %>">
		<input type="hidden" id="codigoC" name="codigoC" value="<% out.print(request.getParameter("codigo"));%>">
		<input type="submit" value="Comentar" class="btn btn-primary form-control">	
	</form>
	
	</div>
</body>
</html>
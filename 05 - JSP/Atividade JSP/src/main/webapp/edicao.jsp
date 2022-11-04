<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tela de edição</title>

<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

	<link rel="stylesheet" href="posts.css">
	
	<!--  JS -->
	<script src="posts.js"></script>
</head>
<body id="editBody">
<%
	 String name=(String)session.getAttribute("admin");
	 String nameUser=(String)session.getAttribute("user");
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
				<a class="nav-link active" href="listausuarios.jsp">Lista de Usuarios</a>
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
	
	<div class="edicaoPostagem">
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
				<h1 id="h1edicao">Tela de edição</h1>
				<form action="salvar.jsp" method="post" onsubmit="return valida()" id="cadastroPost">
				<h2>Texto de código: <% out.print(rs.getString(1)); %></h2>
				Título: 
				
				<input type="text" value="<% out.print(rs.getString(3)); %>" name="editTitulo" class=form-control id="editTitulo">

				<p></p>
				Texto: 
				<input type="text" value="<% out.print(rs.getString(4)); %>" name="editTexto" class=form-control id="editTexto">
				
				
				<p></p>
				Autor:
				<input type="text" value="<% out.print(rs.getString(2)); %>" name="editAutor" class=form-control id="editAutor">
				
				
				
				<input type="hidden" name="codigo" value="<% out.print(rs.getInt(1)); %>">
				<input type="submit" value="Salvar" class="btn btn-success">
				</form>
				
				
				<a href="removePost.jsp?codigo=<% out.print(rs.getInt(1)); %>" class="btn btn-danger">Apagar</a>
			
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
					<p>Comentário: <% out.print(rsComentario.getString(3)); %>
					
					<% if(rsComentario.getInt(5) == 0) { %>
					<a href="abilitarcomentario.jsp?codigo=<% out.print(rsComentario.getInt(1)); %>&postagem=<%out.print(rsComentario.getInt(4)); %>" class="btn btn-success">Abilitar</a>
					<% } else { %>
					<a href="desabilitarcomentario.jsp?codigo=<% out.print(rsComentario.getInt(1)); %>&postagem=<%out.print(rsComentario.getInt(4)); %>" class="btn btn-danger">Desabilitar</a>
					<% } %>
					<a href="removeComentario.jsp?codigo=<% out.print(rsComentario.getInt(1)); %>&postagem=<%out.print(rsComentario.getInt(4)); %>" class="btn btn-warning">Apagar</a>
					</p>
					<br>
					
	</div>				
				<%	} %>
	
	</div>
</body>
</html>
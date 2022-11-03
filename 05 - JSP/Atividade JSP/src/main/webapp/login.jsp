<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
	  

	<h1 id="h1login">Tela de login</h1>
	  
	<div class="split left">
		<div class="centered">
  	
		
		<form action="cadastrarusuario.jsp" style="border:3px solid #ccc">
  		<div class="container">
    	<h1>Usuário Novo</h1>
    	<p>Preencha os dados abaixo:</p>
    	<hr>

    
    	<input type="text" placeholder="Digite o usuário" name="usuario" required class="form-control">
	
    
    	<input type="password" placeholder="Digite a senha" name="senha" required class="form-control">

    	<hr>

    	<%
	String mensagem = request.getParameter("mensagem");
	if(mensagem != null) {%>
    <p><% out.print(mensagem); %></p>
    <% } %>

    	<div class="clearfix">
      	<button type="submit" class="btn btn-success">Cadastrar</button>
      
    </div>
  </div>
</form>
		
  	
  	</div>
</div>



<div class="split right">
  <div class="centered">
  
<form action="checkuser.jsp" style="border:3px solid #ccc">
  <div class="container">
    <h1>Login usuário</h1>
    <p>Preencha os dados abaixo:</p>
    <hr>

    
    <input type="text" placeholder="Digite o usuário" name="usuariologin" id="usuariologin" required class="form-control">
	
    
    <input type="password" placeholder="Digite a senha" name="senhalogin" id="senhalogin" required class="form-control">

    <hr>

	<%
	String retorno = request.getParameter("retorno");
	if(retorno != null) {%>
    <p><% out.print(retorno); %></p>
    <% } %>

    <div class="clearfix">
      <button type="submit" class="btn btn-success">Login</button>
      
    </div>
  </div>
</form>




  
  </div>
</div>
	  
	  
</body>
</html>
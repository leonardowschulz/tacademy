<%@page import="java.sql.PreparedStatement"%>
<%@page import="pacote.Conexao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	 String name=(String)session.getAttribute("admin");
	 String nameUser=(String)session.getAttribute("user");
	 if(name == null && nameUser == null) {
		 response.sendRedirect("login.jsp");
	 }
		 %>
<%
		// Obter o nome, título e post
		String nome = request.getParameter("nome");
		String titulo = request.getParameter("titulo");
		String post = request.getParameter("post");
		
		
		// Efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL
		String sql = "INSERT INTO posts (nome, titulo, post) VALUES (?, ? , ?)";
		
		// PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// Passar os parâmetros do SQL
		pstmt.setString(1, nome);
		pstmt.setString(2, titulo);
		pstmt.setString(3, post);
		
		// Executar o comando SQL
		pstmt.execute();
		
		// Redirecionamento
		response.sendRedirect("posts.jsp");
		
	%>
</body>
</html>
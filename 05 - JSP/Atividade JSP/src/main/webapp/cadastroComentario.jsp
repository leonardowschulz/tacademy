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
		String nome = request.getParameter("nomeComentario");
		String texto = request.getParameter("textoComentario");
		int codigoC = Integer.parseInt(request.getParameter("codigoC"));
		
		
		// Efetuar a conexão
		Conexao cComentario = new Conexao();
		
		// SQL
		String sqlComentario = "INSERT INTO comentario (nome, comentario, codigo_post) VALUES (?, ? , ?)";
		
		// PreparedStatement
		PreparedStatement pstmtComentario = cComentario.efetuarConexao().prepareStatement(sqlComentario);
		
		// Passar os parâmetros do SQL
		pstmtComentario.setString(1, nome);
		pstmtComentario.setString(2, texto);
		pstmtComentario.setInt(3, codigoC);
		
		// Executar o comando SQL
		pstmtComentario.execute();
		
		// Redirecionamento
		response.sendRedirect("postagem.jsp?codigo=" + codigoC);
		
	%>
</body>
</html>
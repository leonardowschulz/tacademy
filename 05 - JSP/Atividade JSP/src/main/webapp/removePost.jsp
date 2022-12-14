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
	// Obter o código do post
	int codigo = Integer.parseInt(request.getParameter("codigo"));

	// Efetuar conexão
	Conexao c = new Conexao();
	
	// SQL
	String sql = "DELETE FROM posts WHERE codigo = ?";
	
	// PreparedStatement
	PreparedStatement pstm = c.efetuarConexao().prepareStatement(sql);
	pstm.setInt(1, codigo);
	
	// Executar a remoção
	pstm.execute();
	
	
	

	
	// SQL
	String sqlComentario = "DELETE FROM comentario WHERE codigo_post = ?";
	
	// PreparedStatement
	PreparedStatement pstmComentario = c.efetuarConexao().prepareStatement(sqlComentario);
	pstmComentario.setInt(1, codigo);
	
	// Executar a remoção
	pstmComentario.execute();
	
	// Redirecionamento
	response.sendRedirect("posts.jsp");
	
%>

</body>
</html>
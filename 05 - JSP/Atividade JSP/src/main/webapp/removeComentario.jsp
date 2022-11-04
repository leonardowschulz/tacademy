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
	int postagem = Integer.parseInt(request.getParameter("postagem"));

	// Efetuar conexão
	Conexao c = new Conexao();
	
	// SQL
	String sql = "DELETE FROM comentario WHERE codigo = ?";
	
	// PreparedStatement
	PreparedStatement pstm = c.efetuarConexao().prepareStatement(sql);
	pstm.setInt(1, codigo);
	
	// Executar a remoção
	pstm.execute();
	
	
	// Redirecionamento
	response.sendRedirect("edicao.jsp?codigo=" + postagem);
	
%>

</body>
</html>
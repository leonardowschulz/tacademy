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
	// Obter o código da pessoa
	int codigo = Integer.parseInt(request.getParameter("codigo"));

	out.print(codigo);
	
	// Efetuar conexão
	Conexao c = new Conexao();
	
	// SQL
	String sql = "DELETE FROM pessoas WHERE codigo = ?";
	
	// PreparedStatement
	PreparedStatement pstm = c.efetuarConexao().prepareStatement(sql);
	pstm.setInt(1, codigo);
	
	// Executar a remoção
	pstm.execute();
	
	// Redirecionamento
	response.sendRedirect("pessoa.jsp");
	
%>

</body>
</html>
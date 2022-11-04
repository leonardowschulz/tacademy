<%@page import="java.text.ParseException"%>
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
		String nome = request.getParameter("nickname");
		String password = request.getParameter("password");
		int codigo = Integer.parseInt(request.getParameter("codigo"));
		
		

		
				
		// Efetuar a conexão
		Conexao c = new Conexao();
		
		// SQL
		String sql = "UPDATE usuarios SET senha = ?,  nome = ?  WHERE codigo = ?";
		
		// PreparedStatement
		PreparedStatement pstmt = c.efetuarConexao().prepareStatement(sql);
		
		// Passar os parâmetros do SQL
		pstmt.setString(1, password);
		pstmt.setString(2, nome);
		pstmt.setInt(3, codigo);
		
		
		// Executar o comando SQL
		pstmt.execute();
		
		// Redirecionamento
		response.sendRedirect("user.jsp?codigo=" + codigo);
		
	%>

</body>
</html>
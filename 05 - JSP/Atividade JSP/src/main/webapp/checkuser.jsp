<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
		// Obter o nome, título e post
		String usuario = request.getParameter("usuariologin");
		String senha = request.getParameter("senhalogin");
		
		
		
		// Conexão com o banco mySQL
		Conexao cCheckUser = new Conexao();
		
		// SQL
		String sqlCheckUser = "SELECT COUNT(usuario), acessoadm, banido, nome, usuario FROM usuarios WHERE usuario = ? AND senha = ?";
	
		// Statement
		PreparedStatement stmtCheckUser = cCheckUser.efetuarConexao().prepareStatement(sqlCheckUser);
		
		stmtCheckUser.setString(1, usuario);
		stmtCheckUser.setString(2, senha);
		// Obter dados da tabela pessoas
		ResultSet rsCheckUser = stmtCheckUser.executeQuery();
		
		
		String retorno = "";

		if(rsCheckUser.next()){
		out.print(rsCheckUser.getInt(1));
		if(rsCheckUser.getInt(3) == 1) {
			retorno = "Usuário banido.";
			response.sendRedirect("login.jsp?retorno=" + retorno);
		} else	if(rsCheckUser.getInt(1) == 1) {
					if(rsCheckUser.getInt(2) == 1) {
						session.setAttribute("admin", rsCheckUser.getString(4));
						session.setAttribute("mainuser", rsCheckUser.getString(5));
						response.sendRedirect("index.jsp");
					} else {
						session.setAttribute("user", rsCheckUser.getString(4));
						session.setAttribute("mainuser", rsCheckUser.getString(5));
						response.sendRedirect("index.jsp");
					}
				} else {
					retorno = "Usuário ou senha inválidos.";
					// Redirecionamento
					response.sendRedirect("login.jsp?retorno=" + retorno);
				}
			} else {
				retorno = "Usuário ou senha inválidos.";
				// Redirecionamento
				response.sendRedirect("login.jsp?retorno=" + retorno);
			}
	%>
	

</body>
</html>
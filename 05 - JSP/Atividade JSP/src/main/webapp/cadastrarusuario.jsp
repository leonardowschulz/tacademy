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
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String nome = usuario;
		
		
		// Conexão com o banco mySQL
		Conexao cCheckUser = new Conexao();
		
		// SQL
		String sqlCheckUser = "SELECT COUNT(usuario) FROM usuarios WHERE usuario = ?";
	
		// Statement
		PreparedStatement stmtCheckUser = cCheckUser.efetuarConexao().prepareStatement(sqlCheckUser);
		
		stmtCheckUser.setString(1, usuario);
		// Obter dados da tabela pessoas
		ResultSet rsCheckUser = stmtCheckUser.executeQuery();
		

		String mensagem = "";

		if(rsCheckUser.next()){
		out.print(rsCheckUser.getInt(1));
			if(rsCheckUser.getInt(1) > 0) {

			mensagem = "Usuário " + usuario + " já cadastrado";
			
		} else {
		
		
			// Efetuar a conexão
			Conexao caduser = new Conexao();
		
			// SQL
			String sqlcaduser = "INSERT INTO usuarios (usuario, senha, nome, acessoadm, banido) VALUES (?, ? , ?, ?, ?)";
		
			// PreparedStatement
			PreparedStatement pstmtcaduser = caduser.efetuarConexao().prepareStatement(sqlcaduser);
		
			// Passar os parâmetros do SQL
			pstmtcaduser.setString(1, usuario);
			pstmtcaduser.setString(2, senha);
			pstmtcaduser.setString(3, nome);
			pstmtcaduser.setInt(4, 0);
			pstmtcaduser.setInt(5, 0);
		
			// Executar o comando SQL
			pstmtcaduser.execute();
			mensagem = "Usuário " + usuario + " cadastrado com sucesso";
			
			}
		}
		// Redirecionamento
		response.sendRedirect("login.jsp?mensagem=" + mensagem);
		
	%>
	

</body>
</html>
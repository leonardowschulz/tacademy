package TrabalhoAvaliativo071022;


//Interface com todas as opções e funções para o Produto

public interface IservicosProduto {
		
	boolean cadastrar(String nome, double valor, int quantidade, String marca);
	
	boolean atualizar(int codAntigo, Produto novo);
	
	String listar();
	
	String listar(String pesquisa);
	
	boolean excluir(int cadastro);
	
	boolean existe(String nome, String marca);
	
}

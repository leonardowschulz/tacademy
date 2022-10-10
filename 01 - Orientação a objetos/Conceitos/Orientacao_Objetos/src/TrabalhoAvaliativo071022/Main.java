package TrabalhoAvaliativo071022;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Main {

	// Inicializando as 2 listas estáticas
	public static ArrayList<Marca> bancoMarcas = new ArrayList<>();
	public static ArrayList<Produto> bancoProdutos = new ArrayList<>();

	public static void main(String[] args) {

		// Inicialização dos serviços
		ServicosMarca novaMarca = new ServicosMarca();
		ServicosProduto novoProduto = new ServicosProduto();
		
		// 3 cadastros de marcas e 4 de produtos para teste
		novaMarca.cadastrar("Samsung");
		novaMarca.cadastrar("Apple");
		novaMarca.cadastrar("Motorola");
		novoProduto.cadastrar("Notebook", 100, 5, "Samsung");
		novoProduto.cadastrar("Celular", 100, 5, "Samsung");
		novoProduto.cadastrar("Notebook gamer", 100, 5, "Samsung");
		novoProduto.cadastrar("Notebook empresarial", 100, 5, "Samsung");
		
		// Inicializando o primeiro menu
		int opcao = 0;
		do {
			System.out.println(" -------- Opções da loja: --------");
			System.out.println("1 - Marca (cadastrar/alterar/remover");
			System.out.println("2 - Produto (cadastrar/alterar/remover");
			System.out.println("3 - Sair");
			opcao = Validator.catchNumero("Digite a opção desejada: ", "Erro. Favor digitar um numero de 1 a 3");
			
			// Entra no primeiro switch, com as opções do menu 1
			if (opcao < 3 && opcao > 0) {
				Tela.opcao(opcao);
			}
		} while (opcao != 3);
	}
}

package TrabalhoAvaliativo;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class Main {

	static Cadastro cadas = new Cadastro();

	public static void main(String[] args) {

		Marca nomeMarca = new Marca();
		Produto novoProduto = new Produto();
		Integer opcao = 0;

		do {
			System.out.println(" -------- Opções da loja: --------");
			System.out.println("1 - Marca (cadastrar/alterar/remover");
			System.out.println("2 - Produto (cadastrar/alterar/remover");
			System.out.println("3 - Sair");
			opcao = Integer.parseInt(JOptionPane.showInputDialog("Digite a opção desejada:"));
			opcao(opcao);

		} while (opcao != 3);

	}

	public static void opcao(int opcao) {
		switch (opcao) {
		case 1: {
			menuMarca();
			break;
		}
		case 2: {
			menuProduto();
			break;
		}
		default:
			break;
		}
	}

	public static void menuMarca() {
		Integer opcaoMarca = 0;
		do {
			System.out.println(" ------ Menu Marca ------");
			System.out.println("1 - Cadastrar nova marca");
			System.out.println("2 - Listar marcas");
			System.out.println("3 - Alterar marca");
			System.out.println("4 - Deletar marca");
			System.out.println("5 - Voltar ao menu anterior");
			opcaoMarca = Integer.parseInt(JOptionPane.showInputDialog("Digite a opção desejada:"));
			if (opcaoMarca != 5) {
				opcaoMarca(opcaoMarca);
			}
		} while (opcaoMarca != 5);

	}

	public static void opcaoMarca(Integer opcaoMarca) {

		switch (opcaoMarca) {
		case 1: {
			System.out.println("Digite a marca a ser cadastrada");
			String novaMarca = JOptionPane.showInputDialog("Digite a nova marca a ser cadastrada");
			cadas.cadastrarNovaMarca(novaMarca);
			break;
		}
		case 2: {
			cadas.listarMarcas();
			break;
		}
		case 3: {
			System.out.println("Alteração de nome de marca");
			cadas.alterarCadastroMarca();
			break;
		}
		case 4: {
			cadas.deletarMarca();
		}
		default:
			break;
		}

	}

	public static void menuProduto() {
		Integer opcaoProduto = 0;
		do {
		System.out.println(" ------ Menu Produto ------");
		System.out.println("1 - Cadastrar novo produto");
		System.out.println("2 - Listar produtos");
		System.out.println("3 - Selecionar produto");
		System.out.println("4 - Localizar produto");
		System.out.println("5 - Alterar produto");
		System.out.println("6 - Deletar produto");
		System.out.println("7 - Voltar ao menu anterior");
		opcaoProduto = Integer.parseInt(JOptionPane.showInputDialog("Digite a opção desejada: "));
		if (opcaoProduto < 7) {
			opcaoProduto(opcaoProduto);
		}
		} while (opcaoProduto != 7);
	}
	
	public static void opcaoProduto(Integer x) {
		switch (x) {
		case 1: {
			cadas.cadastrarNovoProduto();
			break;
		}
		case 2: {
			cadas.listarProdutos();
			break;
		}
		case 3: {
			break;
		}
		case 4: {
			break;
		}
		case 5: {
			break;
		}
		case 6: {
			break;
		}
		default:
			break;
		}
	}
	
	

}

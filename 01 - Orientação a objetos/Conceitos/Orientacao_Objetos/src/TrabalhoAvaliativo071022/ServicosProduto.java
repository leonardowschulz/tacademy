package TrabalhoAvaliativo071022;

public class ServicosProduto implements IservicosProduto {

	// Classe de serviços implementada pela IservicosProduto

	// Método para cadastrar novos produtos
	@Override
	public boolean cadastrar(String nome, double valor, int quantidade, String marca) {
		if (!existe(nome, marca)) {
			Produto novoProduto = new Produto(nome.toUpperCase(), valor, quantidade, marca.toUpperCase());
			Main.bancoProdutos.add(novoProduto);
			ServicosMarca novaMarca = new ServicosMarca();
			if (!novaMarca.existe(marca)) {
				novaMarca.cadastrar(marca);
			}
			return true;
		}
		return false;
	}

	// Método para atualizar (trocar todos os dados de um produto já existente)
	@Override
	public boolean atualizar(int codProduto, Produto novo) {
		if (codProduto < Main.bancoProdutos.size()) {
			if (!existe(novo.getNome(), novo.getMarca())) {
				Main.bancoProdutos.set(codProduto, novo);
				ServicosMarca marca = new ServicosMarca();
				if (!marca.existe(novo.getMarca())) {
					marca.cadastrar(novo.getMarca());
				}
				return true;
			} else {
				System.out.println("Cadastro inválido. Produto já cadastrado.");
				return false;
			}
		} else {
			System.out.println("Produto inexistente");
			return false;
		}
	}

	// Método para chamar o método listas (listando todos os produtos cadastrados)
	@Override
	public String listar() {
		return listar("Tudo");
	}

	// Método para listar todos os produtos ou apenas os produtos com o termo
	// procurado
	@Override
	public String listar(String pesquisa) {
		String mensagem;
		if (!Main.bancoProdutos.isEmpty()) {
			if (pesquisa.equals("Tudo")) {
				mensagem = " -------------------- Lista de produtos: -------------------- \r\n";
				for (int i = 0; i < Main.bancoProdutos.size(); i++) {
					mensagem += (i + 1) + " - Nome: " + Main.bancoProdutos.get(i).getNome() + " - Valor: "
							+ Main.bancoProdutos.get(i).getValor() + " - Quantidade: "
							+ Main.bancoProdutos.get(i).getQuantidade() + " - Marca: "
							+ Main.bancoProdutos.get(i).getMarca() + "\r\n";
				}
				mensagem += " -------------------- Total de Produtos: " + Main.bancoProdutos.size()
						+ " --------------------";
				return mensagem;
			} else {
				mensagem = " -------------------- Lista de produtos: -------------------- \r\n";
				int qtdPesquisados = 0;
				for (int i = 0; i < Main.bancoProdutos.size(); i++) {
					pesquisa = pesquisa.toUpperCase();
					if (Main.bancoProdutos.get(i).getNome().toUpperCase().contains(pesquisa)) {
						mensagem += "Cod: " + (i + 1) + " - Nome: " + Main.bancoProdutos.get(i).getNome() + " - Valor: "
								+ Main.bancoProdutos.get(i).getValor() + " - Quantidade: "
								+ Main.bancoProdutos.get(i).getQuantidade() + " - Marca: "
								+ Main.bancoProdutos.get(i).getMarca() + "\r\n";
						qtdPesquisados++;
					}
				}
				mensagem += " -------------------- Total de Produtos: " + qtdPesquisados + " --------------------";
				return mensagem;

			}

		} else

		{
			return "Você não tem produtos cadastrados";
		}
	}

	// Método para excluir um produto
	@Override
	public boolean excluir(int cadastro) {
		cadastro -= 1;
		if (cadastro <= Main.bancoProdutos.size()) {
			Main.bancoProdutos.remove(cadastro);
			return true;
		}
		return false;
	}

	// Método para verificar se um produto da mesma marca já está cadastrado
	@Override
	public boolean existe(String nome, String marca) {
		nome = nome.toUpperCase();
		marca = marca.toUpperCase();
		for (int i = 0; i < Main.bancoProdutos.size(); i++) {
			if (nome.equals(Main.bancoProdutos.get(i).getNome())
					&& marca.equals(Main.bancoProdutos.get(i).getMarca())) {
				return true;
			}
		}
		return false;
	}

	// Método estático para verificar de algum produto de uma marca específica está
	// cadastrado
	public static boolean existeProdMarca(String marca) {
		marca = marca.toUpperCase();
		for (int i = 0; i < Main.bancoProdutos.size(); i++) {
			if (Main.bancoProdutos.get(i).getMarca().equals(marca)) {
				return true;
			}
		}

		return false;
	}
}

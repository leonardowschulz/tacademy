package TrabalhoAvaliativo071022;

public class ServicosMarca implements IservicosMarca {

	// Classe de serviços implementada pela IservicosMarca
	
	// Método para cadastrar nova marca
	@Override
	public boolean cadastrar(String m) {
		if (!existe(m)) {
			Marca novaMarca = new Marca(m.toUpperCase());
			Main.bancoMarcas.add(novaMarca);
			return true;
		} else {
			System.out.println("Esta marca já está cadastrada");
			return false;
		}
	}

	// Método para atualizar (trocar o nome) de uma marca existente
	@Override
	public boolean atualizar(String m, String n) {
		if (existe(m)) {
			m = m.toUpperCase();
			Marca novaMarca = new Marca(n.toUpperCase());
			for (int i = 0; i < Main.bancoMarcas.size(); i++) {
				if (m.equals(Main.bancoMarcas.get(i).nome)) {
					Main.bancoMarcas.set(i, novaMarca);
					return true;
				}
			}
		} else {
			System.out.println("Marca não encontrada");
		}
		return false;
	}

	// Método para listar todas as marcas cadastradas
	@Override
	public String listar() {
		String mensagem;
		if (!Main.bancoMarcas.isEmpty()) {
			mensagem = " ------ Lista de Marcas ------\r\n";
			for (int i = 0; i < Main.bancoMarcas.size(); i++) {
				mensagem += (i + 1) + " - " + Main.bancoMarcas.get(i).nome + "\r\n";
			}
			mensagem += " ------ Total de Marcas: " + Main.bancoMarcas.size() + " ------\r\n";
			} else {
				mensagem =  "Sem marcas para listar.";				
			}

	return mensagem;
	}

	// Método para excluir uma marca digitada
	@Override
	public boolean excluir(String m) {
		m = m.toUpperCase();
		if (existe(m)) {
			if (!ServicosProduto.existeProdMarca(m)) {
				for (int i = 0; i < Main.bancoMarcas.size(); i++) {
					if (Main.bancoMarcas.get(i).nome.equals(m)) {
						Main.bancoMarcas.remove(i);
						return true;
					}
				}
			} else {
				System.out.println("Marca está sendo utilizada por algum produto");
				return false;
			}
		} else {
			System.out.println("Marca não encontrada");
			return false;
		}
		
		return false;
	}

	// Método para verificar se uma marca já está no ArrayList das marcas cadastradas
	@Override
	public boolean existe(String m) {
		m = m.toUpperCase();
		for (int i = 0; i < Main.bancoMarcas.size(); i++) {
			if (Main.bancoMarcas.get(i).nome.equals(m)) {
				return true;
			}
		}
		return false;
	}

}

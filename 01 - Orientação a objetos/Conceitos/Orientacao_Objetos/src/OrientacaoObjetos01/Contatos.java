package OrientacaoObjetos01;

import java.util.ArrayList;

public class Contatos  {

		
	public static ArrayList<Pessoa> contatos = new ArrayList<>();
	
	
	public static void Cadastrar(String nome, String email, String telefone) {
		Pessoa cadastrar = new Pessoa(nome, email, telefone);
		contatos.add(cadastrar);
	}
	
	public static void LerCadastros() {
		System.out.println("\r\n");
		for (int i = 0; i < contatos.size(); i++) {
			System.out.println("Cadastro: " + (i + 1) + " - Nome: " + contatos.get(i).nome + " - E-mail: " + contatos.get(i).email + " - Telefone: " + contatos.get(i).telefone);
		}
		System.out.println("-----------------------");
	}
	public static void PesquisarCadastro(String nome) {
		int achou = 0;
		for (int i = 0; i < contatos.size(); i++) {
			if (contatos.get(i).nome.contains(nome)) {
				System.out.println(" - Nome: " + contatos.get(i).nome + " - E-mail: " + contatos.get(i).email + " - Telefone: " + contatos.get(i).telefone);
				achou++;
			}
		}
		if (achou > 0) {
			System.out.println("Encontradas " + achou + " cadastros com este nome.");
		} else {
			System.out.println("Nome não encontrado");
		}
	}
	
	public static void AlterarCadastro(int cadastro, String nome, String email, String telefone) {
		Pessoa alterar = new Pessoa(nome, email, telefone);
		contatos.set(cadastro-1, alterar);
		System.out.println("Cadastro " + cadastro + " alterado com sucesso");
	}
	
	public static void RemoverCadastro(int cadastro) {
		if (contatos.isEmpty() == false) {
			contatos.remove(cadastro -1);
			System.out.println("Cadastro " + cadastro + " removido com sucesso.");
		}
	}

}

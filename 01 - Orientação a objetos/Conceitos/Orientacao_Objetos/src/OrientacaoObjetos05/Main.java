package OrientacaoObjetos05;

import java.util.Vector;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		Vector<String> palavras = new Vector<>(10);
		
		String nome;
		Integer voto = 1;
		
		Palavras cadastro = new Palavras();
		
		cadastro.cadastroPalavras("Casa");
		cadastro.cadastroPalavras("Computador");
		cadastro.cadastroPalavras("Escola");
		cadastro.cadastroPalavras("Shopping");
		cadastro.cadastroPalavras("Cidade");
		cadastro.cadastroPalavras("Carro");
		cadastro.cadastroPalavras("Mouse");
		cadastro.cadastroPalavras("Moto");
		cadastro.cadastroPalavras("Apartamento");
		cadastro.cadastroPalavras("Garrafa");
		
		do {
		nome = JOptionPane.showInputDialog("Digite seu nome: ");
		
		cadastro.selectWord();
		cadastro.play();
		
		voto = Integer.parseInt(JOptionPane.showInputDialog("Gostaria de jogar novamente? Digita 1 para SIM e 2 para NAO: "));
		
		
		} while (voto == 1);
		

	}

}

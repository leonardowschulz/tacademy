package OrientacaoObjetos04;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		String mensagem;
		mensagem = JOptionPane.showInputDialog("Digite sua mensagem:");
		
		Mensagem texto = new Mensagem(mensagem);
		
		texto.Vogais();
		texto.Consoantes();
		texto.Numeros();
		texto.Espacos();
		texto.Especiais();
	}

}

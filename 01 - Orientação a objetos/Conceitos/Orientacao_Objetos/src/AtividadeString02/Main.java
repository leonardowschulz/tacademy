package AtividadeString02;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {

		String palavra = JOptionPane.showInputDialog("Digite a palavra: ");
		
		char[] word = palavra.toCharArray();
		String vogais = "aeiouAEIOU";
		String letra;
		int qtdeVogais = 0;
		
		for (int i = 0; i < palavra.length(); i++) {
			letra = String.valueOf(word[i]);
			if (vogais.indexOf(letra) > -1) {
				qtdeVogais++;
				
			}
		}
		System.out.println("Quantidade de vogais: " + qtdeVogais);

	}

}

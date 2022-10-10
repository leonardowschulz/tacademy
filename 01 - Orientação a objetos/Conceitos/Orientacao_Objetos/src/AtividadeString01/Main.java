package AtividadeString01;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {

		String palavra = JOptionPane.showInputDialog("Digite a palavra:");
		char[] word = palavra.toCharArray();
		String letra;
		
		for (int i = 0; i < palavra.length(); i++) {
			if (i%2 == 0) {
				
				letra = Character.toString(word[i]);
				
				System.out.print(letra.toUpperCase());
				
			} else {
				letra = Character.toString(word[i]);
				System.out.print(letra.toLowerCase());
			}
		}

	}

}

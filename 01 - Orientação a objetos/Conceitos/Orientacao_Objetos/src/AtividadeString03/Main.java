package AtividadeString03;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		String palavra = JOptionPane.showInputDialog("Digite a palavra: ");
		
		String ultimas = palavra.substring(palavra.length() -2, palavra.length());

		
		if (ultimas.equals("ar") || ultimas.equals("AR") || ultimas.equals("Ar") || ultimas.equals("aR")) {
			
			System.out.println("EU " + palavra.substring(0, palavra.length() - 2) + "O");
			System.out.println("TU " + palavra.substring(0, palavra.length() - 2) + "AS");
			System.out.println("ELE " + palavra.substring(0, palavra.length() - 2) + "A");
			System.out.println("NÓS " + palavra.substring(0, palavra.length() - 2) + "AMOS");
			System.out.println("VÓS " + palavra.substring(0, palavra.length() - 2) + "ÁIS");
			System.out.println("ELES " + palavra.substring(0, palavra.length() - 2) + "AM");
			
		}
		else {
			System.out.println("Não é um verbo.");
		}

	}

}

package OrientacaoObjetos06;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		System.out.println("Digite os 5 numeros individualment");

		Integer n1, n2, n3, n4, n5;
		n1 = Integer.parseInt(JOptionPane.showInputDialog("Digite o primeiro numero"));
		n2 = Integer.parseInt(JOptionPane.showInputDialog("Digite o segundo numero"));
		n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o terceiro numero"));
		n4 = Integer.parseInt(JOptionPane.showInputDialog("Digite o quarto numero"));
		n5 = Integer.parseInt(JOptionPane.showInputDialog("Digite o quinto numero"));
		
		Numeros lista = new Numeros(n1,n2,n3,n4,n5);
		lista.maiorMenor();
		lista.menorMaior();
		lista.soma();
		lista.media();
		lista.acimaOuIgualMedia();
		
		
		
	}

}

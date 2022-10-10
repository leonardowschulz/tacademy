package AtividadeMath01;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {

		Integer x = 0;
		do {
			System.out.println(""
					+ "1 - Soma;\r\n"
					+ "2 - Subtração;\r\n"
					+ "3 - Multiplicação;\r\n"
					+ "4 - Divisão;\r\n"
					+ "5 - Seno;\r\n"
					+ "6 - Cosseno;\r\n"
					+ "7 - Tangente;\r\n"
					+ "8 - Log;\r\n"
					+ "9 - Raiz Quadrada;\r\n"
					+ "10 - Raiz Cúbica.\r\n"
					+ "11 - Sair\r\n");
			x = Integer.parseInt(JOptionPane.showInputDialog("Digite o número da opção: "));
			opcao(x);
			
		} while (x != 11);
		

	}
	
	public static void opcao(Integer i) {
		double n1, n2;
		int n3;
		if (i == 1) {
			n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro número: "));
			n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo número: "));
			JOptionPane.showMessageDialog(null, "A soma dos números é: " + (n1 + n2));
		}
		if (i == 2) {
			n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro número: "));
			n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo número: "));
			JOptionPane.showMessageDialog(null, "A subtração dos números é: " + (n1 - n2));
		}
		if (i == 3) {
			n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro número: "));
			n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo número: "));
			JOptionPane.showMessageDialog(null, "A multiplicação dos números é: " + (n1 * n2));
		}
		if (i == 4) {
			n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite o primeiro número: "));
			n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite o segundo número: "));
			JOptionPane.showMessageDialog(null, "A divisão dos números é: " + (n1 / n2));
		}
		if (i == 5) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "O Seno do número é: " + (Math.sin(n3)));
		}
		if (i == 6) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "O Cosseno do número é: " + (Math.cos(n3)));
		}
		if (i == 7) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "A Tangente do número é: " + (Math.tan(n3)));
		}
		if (i == 8) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "O Log do número é: " + (Math.log(n3)));
		}
		if (i == 9) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "A raiz quadrada do número é: " + (Math.sqrt(n3)));
		}
		if (i == 10) {
			n3 = Integer.parseInt(JOptionPane.showInputDialog("Digite o número: "));
			JOptionPane.showMessageDialog(null, "A raiz cúbica do número é: " + (Math.cbrt(n3)));
		}
		
	}

}

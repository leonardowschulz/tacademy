package TrabalhoAvaliativo071022;

import javax.swing.JOptionPane;

public class Validator {

	public static boolean nome(String nome, String erro) {
		if (!nome.isEmpty() && nome != null && nome.length() <= 30 && !nome.isBlank()) {
			return true;
		} else {
			System.out.println(erro);
			return false;
		}
	}
	public static int catchNumero(String mensagem, String erro) {
		try {
				Integer x = Integer.parseInt(JOptionPane.showInputDialog(mensagem));
				return x;
			} catch (Exception e) {
				System.out.println(erro);
				return -1;
			}
	}
	public static Double catchPreco(String mensagem, String erro) {
		try {
			Double x = Double.parseDouble(JOptionPane.showInputDialog(mensagem));
			return x;
		} catch (Exception e) {
			System.out.println(erro);
			return -1.0;
		}
	}

}

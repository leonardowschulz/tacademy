package exemplo01;

import javax.swing.JOptionPane;

public class Pessoa {
	
	// Atributos
	String nome;
	int idade;
	double altura;
	
	// Método para poder obter os dados
	void obterDados() {
		nome = JOptionPane.showInputDialog("Informe seu nome");
		idade = Integer.parseInt(JOptionPane.showInputDialog("Digite sua idade"));
		altura = Double.parseDouble(JOptionPane.showInputDialog("Informe sua altura:"));
		
	}
	
	// Método para retornar os dados
	void retornarDados() {
		String mensagem = "Nome: " + nome;
			   mensagem += "\nIdade: " + idade;
			   mensagem += "\nAltura: " + altura;
			   
		JOptionPane.showMessageDialog(null, mensagem);
	}

}
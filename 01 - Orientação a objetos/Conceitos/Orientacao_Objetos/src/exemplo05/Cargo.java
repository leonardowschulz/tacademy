package exemplo05;

import javax.swing.JOptionPane;

public class Cargo extends Colaborador {

	// Atributos
	private String cargo;
	private double salario;
	
	// Método para obter o cargo e salário
	private void obterDadosCargo() {
		cargo = JOptionPane.showInputDialog("Informe o cargo: ");
		salario = Double.parseDouble(JOptionPane.showInputDialog("Informe o salario: "));
		
	}
	
	// Construtor
	public Cargo() {
		obterDadosColaborador();
		obterDadosCargo();
		
		
		System.out.println("Nome: " + nome);
		System.out.println("Idade: " + idade);
		System.out.println("Cargo: " + cargo);
		System.out.println("Salário: " + salario);
	}
	
}

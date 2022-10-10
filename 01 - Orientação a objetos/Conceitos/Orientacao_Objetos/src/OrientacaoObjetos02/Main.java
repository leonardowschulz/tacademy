package OrientacaoObjetos02;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		

		double investimento = 0;
		Integer meses = 0;
		double taxaJuros = 0;
		
		investimento = Double.parseDouble(JOptionPane.showInputDialog("Digite o valor do investimento: "));
		meses = Integer.parseInt(JOptionPane.showInputDialog("Digite a quantidade de meses: "));
		taxaJuros = Double.parseDouble(JOptionPane.showInputDialog("Digite a taxa de juros do período: "));
		
		CalculoJuros calculo = new CalculoJuros(investimento, meses, taxaJuros);
		
		calculo.Calculo();
		
	}

}

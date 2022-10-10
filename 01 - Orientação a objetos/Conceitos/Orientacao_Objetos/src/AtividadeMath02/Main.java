package AtividadeMath02;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		System.out.println("Geramos um número aleatório. Tente acertar ele");
		int tentativa;
		int qtdeTentativas = 0;
		int diferenca = 0;
		int x = (int) (Math.random()*100);
		
		do {
			
			tentativa = Integer.parseInt(JOptionPane.showInputDialog("Digite sua tentativa: "));
			qtdeTentativas++;
			diferenca = x - tentativa;
			diferenca = Math.abs(diferenca);
			if (tentativa != x) {
				if (diferenca <= 10) {
				
					JOptionPane.showMessageDialog(null, "Está perto");
				} else if (diferenca > 10 && diferenca <= 20) {
					JOptionPane.showMessageDialog(null, "Está longe");
				} else {
					JOptionPane.showMessageDialog(null, "Muito longe");
				}
			}
			
			
		} while(tentativa != x);
		
		System.out.println(x);
		System.out.println("Tentavias: " + tentativa);
		if (qtdeTentativas == 1) {
			System.out.println("Nossa! Acertou na mosca");
		}
		else if (qtdeTentativas <= 5) {
			System.out.println("Parabéns! Você é bom de adivinhação");
		}
		else if (qtdeTentativas <= 10) {
			System.out.println("Muito bom, continue assim");
		}
		else if (qtdeTentativas <= 20) {
			System.out.println("Podia ser melhor, continue tentando");
		}
		else if (qtdeTentativas > 20) {
			System.out.println("Meio lerdo você, hein?");
		}
		
		
	}

}

package OrientacaoObjetos03;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		
		String data;
		
		data = JOptionPane.showInputDialog("Digite a data: ");
		
		Data date = new Data(data);
		
		date.divide();
		date.diminuiDia();
		System.out.println(date.mensagem());
		
		
	}

}

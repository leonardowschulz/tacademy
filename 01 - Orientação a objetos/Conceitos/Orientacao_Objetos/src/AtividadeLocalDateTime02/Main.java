package AtividadeLocalDateTime02;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		
		ArrayList<Produto> produtos = new ArrayList<>();
		Produto cadastrar = new Produto("Camiseta",59.90,100,LocalDateTime.now());
		produtos.add(cadastrar);
		cadastrar = new Produto("Calca",79.90,200,LocalDateTime.now());
		produtos.add(cadastrar);
		
		
		
		for (int i = 0; i < produtos.size(); i++) {
			System.out.println("Nome: " + produtos.get(i).nome);
			System.out.println("Valor: " + produtos.get(i).valor);
			System.out.println("Estoque: " + produtos.get(i).estoque);
			System.out.println("Data: " + produtos.get(i).data);
			System.out.println("---------------------------------");
		}
	}

}

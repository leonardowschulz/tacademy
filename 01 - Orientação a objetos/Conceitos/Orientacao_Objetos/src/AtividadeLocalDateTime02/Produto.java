package AtividadeLocalDateTime02;

import java.time.LocalDateTime;

public class Produto {
	
	String nome;
	double valor;
	int estoque;
	LocalDateTime data = LocalDateTime.now();
	
	public Produto(String nome, double valor, int estoque, LocalDateTime data) {
		this.nome = nome;
		this.valor = valor;
		this.estoque = estoque;
		this.data = data;
	}
	


}

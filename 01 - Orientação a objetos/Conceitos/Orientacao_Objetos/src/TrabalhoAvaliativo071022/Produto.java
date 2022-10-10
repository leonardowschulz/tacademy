package TrabalhoAvaliativo071022;

public class Produto {

	private String nome;
	private Double valor;
	private int quantidade;
	private String marca;

	// Construtora da classe produto
	public Produto(String nome, Double valor, int quantidade, String marca) {
		super();
		this.nome = nome.toUpperCase();
		this.valor = valor;
		this.quantidade = quantidade;
		this.marca = marca.toUpperCase();
	}

	// Getters e setters
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

}

package OrientacaoObjetos10;

public class Candidatos {

	private String nome;
	private int votos;

	public Candidatos(String nome) {
		super();
		this.nome = nome;
	}
	
	public String getNome() {
		return this.nome;
	}

	public int getVotos() {
		return votos;
	}

	public void voto(String nome) {
		this.votos += 1;		
	}

	

}

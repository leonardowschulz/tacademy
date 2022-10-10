package OrientacaoObjetos07;

public class Tabuleiro {
	
	
	private int tabuleiro[][] = new int[10][10];

	public Tabuleiro(int[][] tabuleiro) {
		super();
		this.tabuleiro = tabuleiro;
	}

	public int[][] getTabuleiro() {
		return tabuleiro;
	}

	public void setTabuleiro(int[][] tabuleiro) {
		this.tabuleiro = tabuleiro;
	}
	
	

}

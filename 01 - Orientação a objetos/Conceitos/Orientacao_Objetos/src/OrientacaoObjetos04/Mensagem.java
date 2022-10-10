package OrientacaoObjetos04;

public class Mensagem {
	
	private String mensagem;
	
	public Mensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	public void Vogais() {
		char[] texto = this.mensagem.toCharArray();
		int qtdeVogais = 0;
		String vogais = "aeiouAEIOU";
		String letra;
		for (int i = 0; i < texto.length; i++) {
			letra = String.valueOf(texto[i]);
			if (vogais.indexOf(letra) > -1) {
				qtdeVogais += 1;
			}
		}
		System.out.println("\r\nQuantidade de vogais: " + qtdeVogais);
	}
	public void Consoantes() {
		char[] texto = this.mensagem.toCharArray();
		int qtdeConsoantes = 0;
		String consoantes = "bcdfghijklmnpqrstvwxyzBCDFGHIJKLMNPQRSTVWXYZ";
		String letra;
		for (int i = 0; i < texto.length; i++) {
			letra = String.valueOf(texto[i]);
			if (consoantes.indexOf(letra) > -1) {
				qtdeConsoantes += 1;
			}
		}
		System.out.println("Quantidade de consoantes: " + qtdeConsoantes);
	}
	public void Numeros() {
		char[] texto = this.mensagem.toCharArray();
		int qtdeNumeros = 0;
		String numeros = "0123456789";
		String letra;
		for (int i = 0; i < texto.length; i++) {
			letra = String.valueOf(texto[i]);
			if (numeros.indexOf(letra) > -1) {
				qtdeNumeros += 1;
			}
		}
		System.out.println("Quantidade de números: " + qtdeNumeros);
	}
	public void Espacos() {
		char[] texto = this.mensagem.toCharArray();
		String letra;
		int qtdeEspacos = 0;
		for (int i = 0; i < texto.length; i++) {
			letra = String.valueOf(texto[i]);
			if (letra.isBlank()) {
				qtdeEspacos += 1;
			}
		}
		System.out.println("Quantidade de espacos: " + qtdeEspacos);
	}
	public void Especiais() {
		char[] texto = this.mensagem.toCharArray();
		String letra;
		int valor;
		int qtdeEspeciais = 0;
		for (int i = 0; i < texto.length; i++) {
			valor = texto[i];

			if (valor >= 33 && valor <= 47) {
				qtdeEspeciais += 1;
			}
			if (valor >= 58 && valor <= 64) {
				qtdeEspeciais += 1;
			}
			if (valor >= 91 && valor <= 95) {
				qtdeEspeciais += 1;
			}
			if (valor >= 123 && valor <= 126) {
				qtdeEspeciais += 1;
			}
		}
		System.out.println("Quantidade de caracteres especiais: " + qtdeEspeciais);
	}

	int valor = 'a';
	
}

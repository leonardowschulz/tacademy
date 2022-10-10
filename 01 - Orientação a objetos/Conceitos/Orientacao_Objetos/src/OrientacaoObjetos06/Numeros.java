package OrientacaoObjetos06;

import java.util.ArrayList;

public class Numeros {
	
	ArrayList<Integer> numeros = new ArrayList<>();
	
	public Numeros(Integer n1, Integer n2, Integer n3, Integer n4, Integer n5) {
		this.numeros.add(n1);
		this.numeros.add(n2);
		this.numeros.add(n3);
		this.numeros.add(n4);
		this.numeros.add(n5);
		
	}
	
	public void maiorMenor() {
		Integer temp = 0;
		for (int i = 0; i < 5; i++) {
			for (int j = i + 1; j < 5; j++) {
				if (numeros.get(j) > numeros.get(i)) {
					temp = numeros.get(i);
					numeros.set(i, numeros.get(j));
					numeros.set(j, temp);
				}
			}
		}
		System.out.println("Do maior para o menor: " + numeros);
	}
	public void menorMaior() {
		Integer temp = 0;
		for (int i = 0; i < 5; i++) {
			for (int j = i + 1; j < 5; j++) {
				if (numeros.get(j) < numeros.get(i)) {
					temp = numeros.get(i);
					numeros.set(i, numeros.get(j));
					numeros.set(j, temp);
				}
			}
		}
		System.out.println("Do maior para o menor: " + numeros);
	}
	
	public void soma() {
		int soma = 0;
		for (int i = 0; i < numeros.size(); i++) {
			soma += numeros.get(i);
		}
		System.out.println("A soma de todos os números é: " + soma);
	}
	public int soma(String sum) {
		int soma = 0;
		for (int i = 0; i < numeros.size(); i++) {
			soma += numeros.get(i);
		}
		return soma;
	}
	
	public void media() {
		double media = soma("sum");
		media = media / numeros.size();
		System.out.println("A média dos valores é: " + media);
	}
	public double media(String med) {
		double media = soma("sum");
		media = media / numeros.size();
		return media;
	}
	public void acimaOuIgualMedia() {
		double media = media("med");
		System.out.print("Mumeros iguais ou acima da media:");
		for (int i = 0; i < numeros.size();i++) {
			if (numeros.get(i) >= media) {
				System.out.print(" " + numeros.get(i) + ",");
			}
		}
	}

}

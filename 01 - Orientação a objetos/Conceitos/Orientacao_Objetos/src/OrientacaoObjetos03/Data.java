package OrientacaoObjetos03;

public class Data {

	private String data;
	private Integer day;
	private Integer month;
	private Integer year;
	
	public Data(String data) {
		this.data = data;	
	}
	
	public void divide() {
		String[] partes = this.data.split("/");
		this.day = Integer.parseInt(partes[0]);
		this.month = Integer.parseInt(partes[1]);
		this.year = Integer.parseInt(partes[2]);
	}
	
	public void diminuiDia() {
		if (this.year > 1900 && this.year < 2101) {
			if (this.day > 1 && this.day < 31) {
				this.day -= 1;
			} else if(this.day == 1 && this.month > 1) {
				this.month -= 1;
				corrigeDiaNovoMes();
			} else if (this.day == 1 && this.month == 1 && this.year > 1900 && this.year < 2101) {
				this.year -= 1;
				this.month = 12;
				corrigeDiaNovoMes();
			} else {
				System.out.println("Data inválida.");
			}
		} else {
			System.out.println("Data inválida. Você digitou a seguinte data: ");
		}
	}
	public void corrigeDiaNovoMes() {
		switch(this.month) {
			case 1: {
				this.day = 31;
				break;
			}
			case 2: {
				if (this.year % 4 == 0) {
					this.day = 29;
				} else {
					this.day = 28;
				}
				break;
			}
			case 3: {
				this.day = 31;
				break;
			}
			case 4: {
				this.day = 30;
				break;
				}
			case 5: {
				this.day = 31;
				break;
			}
			case 6: {
				this.day = 30;
				break;
			}
			case 7: {
				this.day = 31;
				break;
			}
			case 8: {
				this.day = 31;
				break;
			}
			case 9: {
				this.day = 30;
				break;
			}
			case 10: {
				this.day = 31;
				break;
			}
			case 11: {
				this.day = 30;
				break;
			}
			case 12: {
				this.day = 31;
				break;
			}
			default: {
				break;
			}
		}
	}
	
	public String mensagem() {
		return (this.day + "/" + this.month + "/" + this.year);
	}
	
	

	
	
}

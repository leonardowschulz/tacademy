function valida(){
	// Obter nome e idade
	let nome = document.getElementById("nome").value;
	let titulo = document.getElementById("titulo").value;
	let post = document.getElementById("post").value;
	
	
	// Condicional
	if(nome == ""){
		alert("Informe o nome!");
		return false;
		} else if(titulo == "") {
			alert("Informe o título!");
			return false;
	} else if(post == "") {
		alert("Informa o conteúdo do post!");
		return false;
	} else {
		return true;
	}
	
	
}
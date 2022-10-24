// Vetor
let dados = [];

// Ao carregar o projeto
window.onload = function(){
    dados = JSON.parse(localStorage.getItem("vetor"));

    selecionar();
}

// Função para atualizar o vetor no LocalStorage
function ls(){
    localStorage.setItem("vetor", JSON.stringify(dados));
}

// Função para efetuar o cadastro de usuários
function cadastrar() {
  // Manipular elementos HTML
  let nome = document.getElementById("nome");
  let cidade = document.getElementById("cidade");
  let alerta = document.getElementById("alerta");

  // Remover as classes alert-danger e alert-success
  alerta.classList.remove("alert-danger");
  alerta.classList.remove("alert-success");

  // Condicional
  if (nome.value == "") {
    alerta.innerHTML = "Favor informar o nome";
    alerta.classList.add("alert-danger");
    nome.focus();
  } else if (cidade.value == "") {
    alerta.innerHTML = "Favor informar a cidade";
    alerta.classList.add("alert-danger");
    cidade.focus();
  } else {
    // Mensagem no alerta
    alerta.innerHTML = "Cadastro efetuado com sucesso";
    alerta.classList.add("alert-success");

    // Criar objeto JSON
    let obj = {
      nome: nome.value,
      cidade: cidade.value,
    };

    // Cadastrar no vetor
    dados.push(obj);

    // Atualizar tabela
    selecionar();
    ls();
  }
}

// Função para listar os dados dos usuários
function selecionar() {
  // Obter Tbody
  let tabela = document.getElementById("tabela");

  // Limpar os conteúdos da tabela
  tabela.innerHTML = "";

  // Laçco de repetição
  for (let i = 0; i < dados.length; i++) {
    // Criar linha de tabela
    let linha = tabela.insertRow(-1);

    // Criar colunas de tabela
    let col1 = linha.insertCell(0);
    let col2 = linha.insertCell(1);
    let col3 = linha.insertCell(2);
    let col4 = linha.insertCell(3);

    // Conteúdos das colunas
    col1.innerHTML = i + 1;
    col2.innerHTML = dados[i].nome;
    col3.innerHTML = dados[i].cidade;
    //col4.innerHTML = "<button class='btn btn-danger' onclick='remover("+i+")'>Remover</button>";
    col4.innerHTML = `<button class="btn btn-danger" onclick="remover(${i})">Remover</button>`;
  }
}

// Função para remover usuário
function remover(indice) {
    dados.splice(indice, 1);
    selecionar();
    ls();
}

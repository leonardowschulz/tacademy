let produtos = [];
let carrinho = [];
let prodPesquisa = [];
let randomArr = [];
let buscaArr = [];
let valorTotal = 0;

var obj = {
  nome: "",
  valor: 0,
  quantidade: 0,
  segmento: "",
};
var objCarrinho = {
  nome: "",
  valor: 0,
  quantidade: 0,
  img: "",
};

function captarProd(num) {
  switch (num) {
    case 1:
      obj = {
        nome: "Notebook",
        valor: 5000,
        quantidade: 3,
        segmento: "Informatica",
        img: "notebook.webp",
      };
      break;
    case 2:
      obj = {
        nome: "Mouse",
        valor: 100,
        quantidade: 5,
        segmento: "Informatica",
        img: "mouse.webp",
      };
      break;
    case 3:
      obj = {
        nome: "Teclado",
        valor: 200,
        quantidade: 10,
        segmento: "Informatica",
        img: "teclado.webp",
      };
      break;
    case 4:
      obj = {
        nome: "Memória Ram",
        valor: 299,
        quantidade: 2,
        segmento: "Informatica",
        img: "memoriaram.webp",
      };
      break;
    case 5:
      obj = {
        nome: "SSD",
        valor: 390,
        quantidade: 10,
        segmento: "Informatica",
        img: "ssd.webp",
      };
      break;
    case 6:
      obj = {
        nome: "Placa de video",
        valor: 3000,
        quantidade: 1,
        segmento: "Informatica",
        img: "placadevideo.webp",
      };
      break;
    case 7:
      obj = {
        nome: "Fonte",
        valor: 500,
        quantidade: 50,
        segmento: "Informatica",
        img: "fonte.webp",
      };
      break;
    case 8:
      obj = {
        nome: "Monitor",
        valor: 2000,
        quantidade: 33,
        segmento: "Informatica",
        img: "monitor.webp",
      };
      break;
    case 9:
      obj = {
        nome: "No-Break",
        valor: 500,
        quantidade: 20,
        segmento: "Informatica",
        img: "no-break.webp",
      };
      break;
    case 10:
      obj = {
        nome: "Headset",
        valor: 179,
        quantidade: 30,
        segmento: "Informatica",
        img: "headset.webp",
      };
      break;
    case 11:
      obj = {
        nome: "Cadeira gamer",
        valor: 1200,
        quantidade: 10,
        segmento: "Móveis Escritório",
        img: "cadeiragamer.webp",
      };
      break;
    case 12:
      obj = {
        nome: "Mesa com uma gaveta",
        valor: 134.91,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "mesaumagaveta.webp",
      };
      break;
    case 13:
      obj = {
        nome: "Cadeira Presidente",
        valor: 1300,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "cadeirapresidente.webp",
      };
      break;
    case 14:
      obj = {
        nome: "Estante para Livros",
        valor: 351,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "estantelivros.webp",
      };
      break;
    case 15:
      obj = {
        nome: "Mesa em L com 2 portas e 3 gavetas",
        valor: 415,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "mesa2portas3gavetas.webp",
      };
      break;
    case 16:
      obj = {
        nome: "Mesa duas gavetas",
        valor: 319,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "mesa2gavetas.webp",
      };
      break;
    case 17:
      obj = {
        nome: "Mesa com estante",
        valor: 388.89,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "mesacomestante.webp",
      };
      break;
    case 18:
      obj = {
        nome: "Estante para livros com 1 porta e 2 gavetas",
        valor: 747.15,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "estantelivros1porta2gavetas.webp",
      };
      break;
    case 19:
      obj = {
        nome: "Gaveteiro com 4 gavetas",
        valor: 299,
        quantidade: 30,
        segmento: "Móveis Escritório",
        img: "gaveteiro4gavetas.webp",
      };
      break;
    case 20:
      obj = {
        nome: "Mesa gamer",
        valor: 399,
        quantidade: 8,
        segmento: "Móveis Escritório",
        img: "mesagamer.webp",
      };
      break;
    case 21:
      obj = {
        nome: "Geladeira",
        valor: 2688.89,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "geladeira.webp",
      };
      break;
    case 22:
      obj = {
        nome: "Fogão",
        valor: 789.99,
        quantidade: 5,
        segmento: "Eletrodomésticos",
        img: "fogao.webp",
      };
      break;
    case 23:
      obj = {
        nome: "Adega",
        valor: 1399.99,
        quantidade: 10,
        segmento: "Eletrodomésticos",
        img: "adega.webp",
      };
      break;
    case 24:
      obj = {
        nome: "Cervejeira",
        valor: 1899.99,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "cervejeira.webp",
      };
      break;
    case 25:
      obj = {
        nome: "Microondas",
        valor: 399.99,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "microondas.webp",
      };
      break;
    case 26:
      obj = {
        nome: "Máquna lava roupas",
        valor: 1199.99,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "maquinadelavarroupas.webp",
      };
      break;
    case 27:
      obj = {
        nome: "Lava e seca",
        valor: 3999.99,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "lavaeseca.webp",
      };
      break;
    case 28:
      obj = {
        nome: "Forno elétrico de embutir",
        valor: 799.99,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "fornodeembutir.webp",
      };
      break;
    case 29:
      obj = {
        nome: "Forno elétrico",
        valor: 399,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "fornoeletrico.webp",
      };
      break;
    case 30:
      obj = {
        nome: "Air Fryer",
        valor: 475.11,
        quantidade: 30,
        segmento: "Eletrodomésticos",
        img: "airfryer.webp",
      };
      break;
  }
}

function cadastar() {
  for (let i = 1; i <= 30; i++) {
    captarProd(i);
    produtos.push(obj);
  }

  listarInicial();
}

function listarInicial() {
    generateRandom();
    listar("rd");
}

function listar(categoria) {
    // Obter o local onde serão exibidos os produtos
    let exibirProdutos = document.getElementById("principal");
    exibirProdutos.innerHTML = "";
    
    if (categoria == "rd") {
    // Laço de repetição
    for (let i = 0; i < 12; i++) {
      let randomNumber = randomArr[i];
      // Coluna
      let coluna = document.createElement("div");
      coluna.classList.add("col-3");

      // Card
      let card = document.createElement("div");
      card.classList.add("card", "produto");

      // Título
      let titulo = document.createElement("h1");
      titulo.innerText = produtos[randomNumber].nome;

      // Imagem
      let imagem = document.createElement("img");
      imagem.src = "imagens/" + produtos[randomNumber].img;

      // Valor
      let valor = document.createElement("h2");
      valor.innerText = "R$ " + produtos[randomNumber].valor.toFixed(2);

      // Quantidade
      let quantidade = document.createElement("h3");
      quantidade.innerText = "Estoque: " + produtos[randomNumber].quantidade;

      // Botão
      let botao = document.createElement("button");
      if (produtos[randomNumber].quantidade > 0) {
      botao.classList.add("btn", "btn-success");
      botao.innerHTML = "Adicionar";
} else {
	botao.classList.add("btn", "btn-danger");
        botao.innerHTML = "Sem estoque";
	botao.disabled = true;
}
      botao.value = randomNumber;
      botao.onclick = function acao() {
        addCarrinho(this.value);
        produtos[this.value].quantidade--;
        
        if (produtos[this.value].quantidade == 0) {
            this.disabled = true;
            this.innerHTML = "Sem estoque";
            this.classList.remove("btn-success");
            this.classList.add("btn-danger");
        }
        listar(categoria);
      };

      // Adicionar informações ao card
      card.appendChild(titulo);
      card.appendChild(imagem);
      card.appendChild(valor);
      card.appendChild(quantidade);
      card.appendChild(botao);

      // Coluna recebe card
      coluna.appendChild(card);

      exibirProdutos.appendChild(coluna);
    }
  } else if (categoria == "busca") {
    for (let i = 0; i <= 30; i++) {
      if (buscaArr.indexOf(i) != -1) {
        // Coluna
        let coluna = document.createElement("div");
        coluna.classList.add("col-3");

        // Card
        let card = document.createElement("div");
        card.classList.add("card", "produto");

        // Título
        let titulo = document.createElement("h1");
        titulo.innerText = produtos[i].nome;

        // Imagem
        let imagem = document.createElement("img");
        imagem.src = "imagens/" + produtos[i].img;

        // Valor
        let valor = document.createElement("h2");
        valor.innerText = "R$ " + produtos[i].valor.toFixed(2);

        // Quantidade
        let quantidade = document.createElement("h3");
        quantidade.innerText = "Estoque: " + produtos[i].quantidade;

        // Botão
        let botao = document.createElement("button");
        if (produtos[i].quantidade > 0) {
          botao.classList.add("btn", "btn-success");
          botao.innerHTML = "Adicionar";
        } else {
          botao.classList.add("btn", "btn-danger");
          botao.innerHTML = "Sem estoque";
          botao.disabled = true;
        }
        botao.value = i;
        botao.onclick = function acao() {
          addCarrinho(i);
          produtos[this.value].quantidade--;

          if (produtos[this.value].quantidade == 0) {
            this.disabled = true;
            this.innerHTML = "Sem estoque";
            this.classList.remove("btn-success");
            this.classList.add("btn-danger");
          }
          listar(categoria);
        };

        // Adicionar informações ao card
        card.appendChild(titulo);
        card.appendChild(imagem);
        card.appendChild(valor);
        card.appendChild(quantidade);
        card.appendChild(botao);

        // Coluna recebe card
        coluna.appendChild(card);

        exibirProdutos.appendChild(coluna);
      }
    }
  } else {
    for (let i = 0; i <= 30; i++) {
      if (produtos[i].segmento == categoria) {
        // Coluna
        let coluna = document.createElement("div");
        coluna.classList.add("col-3");

        // Card
        let card = document.createElement("div");
        card.classList.add("card", "produto");

        // Título
        let titulo = document.createElement("h1");
        titulo.innerText = produtos[i].nome;

        // Imagem
        let imagem = document.createElement("img");
        imagem.src = "imagens/" + produtos[i].img;

        // Valor
        let valor = document.createElement("h2");
        valor.innerText = "R$ " + produtos[i].valor.toFixed(2);

        // Quantidade
        let quantidade = document.createElement("h3");
        quantidade.innerText = "Estoque: " + produtos[i].quantidade;

        // Botão
        let botao = document.createElement("button");
        if (produtos[i].quantidade > 0) {
          botao.classList.add("btn", "btn-success");
          botao.innerHTML = "Adicionar";
        } else {
          botao.classList.add("btn", "btn-danger");
          botao.innerHTML = "Sem estoque";
          botao.disabled = true;
        }
        botao.value = i;
        botao.onclick = function acao() {
          addCarrinho(i);
          produtos[this.value].quantidade--;

          if (produtos[this.value].quantidade == 0) {
            this.disabled = true;
            this.innerHTML = "Sem estoque";
            this.classList.remove("btn-success");
            this.classList.add("btn-danger");
          }
          listar(categoria);
        };

        // Adicionar informações ao card
        card.appendChild(titulo);
        card.appendChild(imagem);
        card.appendChild(valor);
        card.appendChild(quantidade);
        card.appendChild(botao);

        // Coluna recebe card
        coluna.appendChild(card);

        exibirProdutos.appendChild(coluna);
      }
    }
  }
}
function addCarrinho(codigo) {
  // Obj carrinho com as infos
  objCarrinho = {
    nome: produtos[codigo].nome,
    valor: produtos[codigo].valor,
    quantidade: 1,
    img: produtos[codigo].img,
  };
  let existe = 0;

  // Se não existe produto cadastrado, cadastra automaticamente
  if (carrinho.length == 0) {
    carrinho.push(objCarrinho);
    existe = 1;

    // Caso contrário, ele verifica se o produto adicionado já está cadastrado
  } else {
    for (let i = 0; i < carrinho.length; i++) {
      if (produtos[codigo].nome == carrinho[i].nome) {
        carrinho[i].quantidade++;
        existe = 1;
      }
    }
  }
  if (existe == 0) {
    carrinho.push(objCarrinho);
  }
  updateCart();
}

function generateRandom() {
  randomArr = [];
  while (randomArr.length < 12) {
    let r = Math.floor(Math.random() * 30);
    if (randomArr.indexOf(r) === -1) {
      randomArr.push(r);
    }
  }
}
window.onload = function () {
  cadastar();
};
function listarCarrinho() {
  let exibirProdutos = document.getElementById("principal");
  exibirProdutos.innerHTML = "";

  // Laço de repetição
  for (let i = 0; i < carrinho.length; i++) {
    // Coluna
    let coluna = document.createElement("div");
    coluna.classList.add("col-3");

    // Card
    let card = document.createElement("div");
    card.classList.add("card", "produto");

    // Título
    let titulo = document.createElement("h1");
    titulo.innerText = carrinho[i].nome;

    // Imagem
    let imagem = document.createElement("img");
    imagem.src = "imagens/" + carrinho[i].img;

    // Valor
    let valor = document.createElement("h2");
    valor.innerText = "R$ " + carrinho[i].valor.toFixed(2);

    // Quantidade
    let quantidade = document.createElement("h3");
    quantidade.innerText = "Quantidade: " + carrinho[i].quantidade;

    // Botão
    let botao = document.createElement("button");
    botao.classList.add("btn", "btn-danger");
    botao.innerHTML = "Adicionar";
    botao.value = i;
    botao.onclick = function acao() {
      remCarrinho(this.value);
      // carrinho[this.value].quantidade--;

      // if (carrinho[this.value].quantidade == 0) {
      //   this.disabled = true;
      //   this.innerHTML = "Sem estoque";
      //   this.classList.remove("btn-primary");
      //   this.classList.add("btn-danger");
      // }
    };

    // Adicionar informações ao card
    card.appendChild(titulo);
    card.appendChild(imagem);
    card.appendChild(valor);
    card.appendChild(quantidade);
    card.appendChild(botao);

    // Coluna recebe card
    coluna.appendChild(card);

    exibirProdutos.appendChild(coluna);
  }
  valorCompra();
}
function remCarrinho(num) {
  for (let i = 0; i < produtos.length; i++) {
    if (carrinho[num].nome == produtos[i].nome) {
      produtos[i].quantidade++;
    }
  }
  if (carrinho[num].quantidade == 1) {
    carrinho.splice(num, 1);
  } else {
    carrinho[num].quantidade--;
  }

  listarCarrinho();
  updateCart();
}

function buscar() {
  buscaArr = [];
  let procura = document.getElementById("termo").value;
  procura = procura.toLowerCase();
  if (procura != "") {
    for (let i = 0; i < produtos.length; i++) {
      let nomeATestar = produtos[i].nome.toLowerCase();
      if (nomeATestar.includes(procura) == true && buscaArr.indexOf(i) == -1) {
        buscaArr.push(i);
        console.log(i);
      }
    }
    listar("busca");
  }
}

function valorCompra() {
  let qtditens = 0;
  let valorDaCompra = document.getElementById("valorDaCompra");
  valorDaCompra.innerHTML = "";
  valorTotal = 0;
  if (carrinho.length > 0) {
    for (let i = 0; i < carrinho.length; i++) {
      valorTotal += carrinho[i].valor * carrinho[i].quantidade;
      qtditens += carrinho[i].quantidade;
    }
    valorDaCompra.innerHTML =
      "A quantidade de itens ficou em " +
      qtditens +
      ", e o valor total em: R$" +
      valorTotal.toFixed(2);
  } else {
    valorDaCompra.innerHTML = "O carrinho está vazio";
  }
}

function updateCart() {
    let qtditens = 0;
  if (carrinho.length > 0) {
    for (let i = 0; i < carrinho.length; i++) {
      qtditens += carrinho[i].quantidade;
    }
  }
  if (qtditens > 0) {
    let cartButton = document.getElementById("cartButton");
    cartButton.innerHTML = "";
    cartButton.innerHTML = qtditens;
  } else {
    let cartButton = document.getElementById("cartButton");
    cartButton.innerHTML = "";
    cartButton.innerHTML = "0";
  }
}

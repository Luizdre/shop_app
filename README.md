O projeto construido entrega um codigo limpo com alta componentizaçao e personalizaçao dinamica de cada conteudo do projeto, utilizaçao de injeçao de dependencias para prevençao em manutençoes futuras do projeto e separaçao de telas por modulos afim de diminuir o uso de memoria do dispositivo visando entregar uma melhor experiencia ao usuario, funçoes pouco verbosas e com diferentes chamadas entre camadas de regra de negocios e chamadas de API visando a facilidade de leitura do codigo e manutençao futura do mesmo e conta com variaveis de nomes intuitivos.

Funcoes disponiveis do projeto:
    - Filtro de produtos por preço (Botao superior direito na AppBar);
    - Adiçao e remocao de produtos na sacola ainda na tela principal ao clicar no botao inferior direito do card do produto;
    - Adicao de produtos na sacola na tela de detalhes do produto;
    - Produtos que forem da linha clothing terao opçoes de cores onde o usuario podera ter uma visualizacao previa ao selecionar uma das cores disponibilizadas;

O Shop App foi desenvolvido utilizando modular para facilitar a navegaçao no projeto e toda a injeçao de dependencias e separaçao de regras de negocios utilizando o metodo de store fornecido e a lib build_runner para assistir todas as alteraçoes dentro da store e alterar o codigo auxiliar em tempo real (arquivos.g.dart);

Para facilitar o gerenciamento de estado foi utilizado a forma nativa do framework Change Notifier em conjunto com mobx, especialmente pela facilidade em gerenciar o estado da aplicaçao entre diferentes contextos;

Foi utilizado o banco de dados local Hive em conjunto com o Path Provider para salvar de forma dinamica a informaçao inicial do nome da loja para acessar futuramente apos finalizar o aplicativo;

Para consultas de API externa foi utilizada a lib Dio pela facilidade de trabalho e personalizaçao de requisiçoes;

Com intuito de manter um visual mais limpo e personalizado, para os icones foram utilizados arquivos de vetores SVG e para a utilizaçao dos mesmos dentro do projeto foi utilizada a lib flutter_svg;

Com certeza a parte de responsividade entre as diferentes telas afim de manter a fidelidade do layout proposto pelo app foi a parte mais dificil.
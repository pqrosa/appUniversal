Implementar a chamada dos View Controllers a partir da lista

    Criar uma propriedade do tipo array na lista, para armazenar os view controllers que vão receber o aviso de que há um novo time
    no app delegate, ao criar os view controllers, adicionar eles nessa property criada
    no método da table view que mapeia a célula selecionada, basta chamar o método do NSArray que faz com que todos os objetos do array executem um determinado método (aka 'selector'). Vou deixar vocês olharem na documentação para descobrirem qual é (embora eu já tenha falado nele)

Quero que vocês observem uma coisa: para pessoas que prezam por um código bem feito, a questão da existência dessa property viewControllers faz pensar em criar uma classe filha da lista, que só implementa o método didSelectRowAtIndexPath, fazendo a implementação do iPad. Ficaria muito feliz se vocês pensassem nisso, e fizessem as devidas alterações no código para que isso acontecesse.

Ajustes de layout
Há vários ajustes de layout que vocês podem fazer, segue uma lista de sugestões:

    Colocar imagens nos itens do Tab Bar
    Tirar o Accessory Indicator da célula quando eu estiver no iPad (isso pode até ficar na implementação da classe filha, se vocês a criarem)


Duas pedreiras:
Aqui tem duas pedreiras para serem feitas. A primeira nem é tanto: toda vez que a WebView estiver carregando, colocar um Activity Indicator (aquela bolinha feita de palitinhos que fica girando, indicando "loading"), e quando terminar de carregar tirar o Activity Indicator. 

A segunda é mexer nas propriedades do ScrollView, ajustando a imagem para exibir ocupando tudo, e com paginação.
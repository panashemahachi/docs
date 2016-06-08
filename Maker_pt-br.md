Informações rápidas
-------------------------------

A Maker é uma Organização Autônoma Descentralizada (DAO, do inglês *Decentralized Autonomous Organization*) que garante o valor do Dai, uma **criptomoeda estável** (_stablecoin_) no blockchain de Ethereum. Uma DAO é uma organização totalmente baseada na tecnologia blockchain, que usa contratos inteligentes para impor suas regras e seu modelo de negócio.

O **Dai** é uma stablecoin utilizada para comércio e transferências na plataforma Ethereum. Uma stablecoin é uma criptomoeda cuja cotação é estável.

O **MKR** é uma quota especulativa que garante o valor do Dai. Por gerenciar o sistema e assumir o risco de cobrir dívidas insolventes, a Maker recebe continuamente uma taxa sobre os Dai existentes no mercado. Essa receita é revertida para os proprietários de MKR por meio de um mecanismo de compra e destruição de MKR (em inglês: *Buy & Burn*).

#### Links Rápidos
* [Chat](https://makerdao.herokuapp.com/) - Principal plataforma de interação com a comunidade
* [Fórum](https://forum.makerdao.com) - Para debates e propostas
* [Subreddit](https://www.reddit.com/r/makerdao) - Melhor lugar para saber das últimas notícias e links
* [GitHub](https://github.com/makerdao) - Repositório do código público da Maker 
* [TeamSpeak](https://ts.makerdao.com/) - Para as reuniões de governança
* [SoundCloud](https://soundcloud.com/makerdao) - Gravações das reuniões de governança
* [MakerX](https://x.makerdao.com) - Para troca descentralizada de MKR e Dai por outras criptomoedas

Introdução à stablecoin Dai e à Maker
------------------------------------

### Dai e Maker

O Dai é uma stablecoin na plataforma Ethereum e Maker é a organização que busca manter a estabilidade do Dai ao definir sua política monetária (por exemplo, a definição de quais são as garantias mínimas para a criação de Dai, entre outros fatores).

Novos Dai entram no mercado quando uma pessoa (o *mutuário*) obtém um empréstimo em Dai dando algo em garantia. Essa garantia é retida em um contrato inteligente chamado de Dívida com Garantia (**CDP**, do inglês *Collateralized Debt Position*), e portanto lastreia o Dai em circulação de um modo totalmente transparente, auditável por qualquer pessoa.

Qualquer conta Ethereum pode originar a tomada de Dai emprestado sem quaisquer requisitos ou restrições. Empréstimos de Dai não possuem limites, e os mutuários podem abrir e quitar CDPs a qualquer momento.

Aqueles interessados em manter reservas em Dai (chamados de Dai *holders*) compram essas moedas dos mutuários e as usam como uma moeda estável para transações na plataforma Ethereum ou como uma forma de reserva de valor de longo prazo.

### MKR, a quota da Maker
MKR é o nome do token que representa “ações” da MakerDAO. O preço do MKR varia livremente de acordo com a demanda por ele, que por sua vez é tão maior quanto maior for a demanda por abrir CDPs.

Isso porque  os mutuários de Dai pagam uma **taxa de estabilidade** que é canalizada para os proprietários de MKR por um processo automatizado chamado de *Buy & Burn*, que consiste em usar a receita advinda dessas taxas para comprar MKR e destruí-los permanentemente. Esse processo intensifica a demanda por MKR, ajudando assim a valorizar a moeda. Em compensação, a Maker tem a obrigação de quitar automaticamente qualquer CDP que se torne de alto risco (aqueles cujas garantias tenham se desvalorizado além de um certo ponto).

Como resultado, MKR tende a ser uma criptomoeda com alto potencial de valorização, mas ao mesmo tempo sujeita a altos riscos e alta volatilidade.

Inicialmente, existem 1 milhão de MKR. Antes da implantação do sistema, 421.897 MKR (42,19%) foram distribuídos aos fundadores e vendidos aos primeiros investidores.

Os outros 578.103 MKR foram armazenados em um contrato inteligente chamado de *Maker Fund*. Esse contrato está isolado do núcleo do sistema e armazena também outras moedas em nome da Maker. O Maker Fund é controlado pelos proprietários de MKR que desejem participar do processo de governança da Maker por meio de discussões e votações de propostas.

### A mecânica básica
O preço alvo do Dai é referenciado em Direitos Especiais de Saque (Special Drawing Rights - SDR) - uma cesta de moedas internacionais mantida pelo FMI que possui baixa volatilidade em relação às principais moedas mundiais. Quando o Dai for lançado, o valor de 1 Dai será atrelado a um preço-alvo inicial no equivalente a um dólar em SDR, com base na [taxa de câmbio divulgada pelo FMI](https://www.imf.org/external/np/fin/data/rms_sdrv.aspx). Após o lançamento, o preço do Dai irá descolar dessa referência inicial e começará a flutuar bem lentamente em relação ao SDR (com tendência de deflação em condições normais), mantendo a baixa volatilidade no curto prazo.

Novos Dai entram em circulação quando um mutuário provê garantia a um CDP, que então envia os Dai para a carteira do mutuário e registra a dívida correspondente. Ao longo do tempo, o CDP acumula uma taxa de estabilidade ("juros"), que é adicionada à dívida. O mutuário pode recuperar as garantias providas quitando o valor da dívida inicial somada à taxa de estabilidade acumulada desde a criação do CDP. Os valores provenientes das taxas de estabilidade dos CDPs vão para o contrato inteligente que executa o Buy & Burn.

>*__Exemplo 1:__ Bob quer tomar emprestado 100 Dai. Ele transfere para o CDP uma quantidade de “ETH” (símbolo de ether, a moeda da rede Ethereum) significativamente maior do que 100 Dai e então recebe os 100 Dai na sua conta Ethereum. Considerando uma taxa de estabilidade de 0,5% ao ano, caso decida resgatar seus ETH ao final de 12 meses, Bob precisará de 100,5 Dai para quitar o CDP.*

Em função da natureza deflacionária do Dai, o valor de mercado da dívida (medido em SDR) também aumenta ao longo do tempo, resultando em um custo adicional para o mutuário além da taxa de estabilidade. É importante notar que: enquanto a deflação implica uma transferência de valor dos mutuários para os detentores de Dai, a taxa de estabilidade implica uma transferência de valor dos mutuários para os proprietários de MKR.

Uma das principais aplicações para os CDPs é a possibilidade de os mutuários realizarem negociação com margem, também chamada de [alavancagem](https://pt.wikipedia.org/wiki/Alavancagem_financeira).

>*__Exemplo 2:__ Bob quer alavancar sua exposição à variação de ETH em relação ao SDR. Ele toma emprestado 100 SDR em Dai, transferindo o equivalente a 150 SDR em ETH para um CDP. Em seguida, ele compra outros 100 SDR em ETH com seus Dai recém-emprestados, aumentando sua exposição ao ETH em 66%, já que (150+100)÷150 = 1,66. Bob poderia ter feito qualquer outra coisa com os 100 SDR em ETH obtidos com a venda do Dai, enquanto a garantia (150 SDR em ETH) permanece bloqueada até que a dívida e a taxa de estabilidade sejam quitadas.*

Embora CDPs não sejam fungíveis entre si, a propriedade de um CDP é transferível. Isso permite que os CDPs possam ser usados em contratos inteligentes que executam métodos mais complexos de empréstimos (por exemplo, envolvendo mais de um ator).

>*__Exemplo 3:__ Alice deseja alavancar sua exposição ao ETH. Bob, por outro lado, deseja utilizar ETH para adquirir Dai como reserva de valor. Alice e Bob criam um contrato inteligente na rede Ethereum que toma um empréstimo de 100 SDR em Dai utilizando ETH como garantia. Alice contribui com 50 SDR em ETH, enquanto Bob contribui com 100 SDR em ETH. O contrato usa esses recursos para criar um CDP com 150 SDR em ETH em garantia e 100 SDR em Dai emprestados. O contrato automaticamente transfere os Dai para Bob e a propriedade do CDP para Alice. Na prática, é como se Bob estivesse simplesmente comprando 100 SDR em Dai, pagando o valor equivalente em ETH. Já Alice tem uma dívida em Dai equivalente a 100 SDR garantidos por um valor em ETH equivalente a 150 SDR. Como no início ela tinha apenas 50 SDR em ETH, ela está agora alavancada em 3 vezes, já que 150÷50 = 3.*

Como a Maker mantém o Dai estável
------------------------------

A estabilidade do Dai em torno do preço-alvo é mantida graças ao ajuste contínuo de incentivos para que de um lado pessoas tomem Dai emprestado e de outro pessoas retenham a moeda como reserva de valor. Isso é feito ajustando-se a taxa de deflação.

### Baixa volatilidade devido a uma taxa de deflação determinada pelo mercado

Ajustes na taxa de deflação garantem que o valor de mercado do Dai permaneça estabilizado em torno do preço-alvo. Quando o valor de mercado está abaixo do preço-alvo, a taxa de deflação aumenta, fazendo com que empréstimos tornem-se mais caros, o que reduz a quantidade de Dai em circulação. Ao mesmo tempo, o aumento da taxa de deflação torna maior o ganho para pessoas que poupam em Dai, levando a um aumento correspondente na demanda. Esta combinação de redução da oferta e aumento da demanda faz com que o valor de mercado do Dai aumente.

O mesmo mecanismo funciona no sentido inverso se o preço de mercado está acima do preço-alvo: a taxa de deflação diminui, levando a um aumento na demanda por empréstimos de Dai e a uma diminuição na demanda pela posse. Isso faz com que o valor de mercado do Dai diminua.

Este é um mecanismo de retroalimentação negativa: um desvio para longe do preço-alvo amplia a força na direção oposta. A magnitude dos ajustes na taxa de deflação depende de quanto tempo o preço de mercado permanece distante do preço-alvo, de modo que os desvios mais longos resultarão em ajustes agressivos, enquanto desvios mais curtos resultarão em ajustes menores.

                          
### Impondo o preço-alvo: Liquidação

Outra forma de assegurar que o preço de mercado permaneça próximo ao preço-alvo é a *liquidação*, que consiste na quitação de CDPs pela própria Maker quando o valor em garantia atinge um certo nível considerado arriscado, chamado de **proporção de liquidação** (*liquidation ratio*). Isso significa que a própria Maker resgata a garantia do CDP e a vende por meio de leilões específicos (chamados em inglês de continuous splitting auctions - **CSA**).  O CSA é um mecanismo de leilão que permite à Maker obter o melhor valor possível pelas garantias sendo liquidadas.

Para que a Maker assuma o controle sobre a garantia e posteriormente a leiloe, uma **dívida de emergência** (*emergency debt*) é imediatamente usada para gerar Dai. Esse Dai é garantido pela capacidade da Maker de diluir a oferta de MKR, ou seja, de gerar mais MKR. Um leilão reverso é usado para encontrar a menor quantidade de MKR que precisa ser gerada a fim de se criar Dai suficiente para saldar a dívida de emergência. Este tipo de leilão é chamado de **leilão de dívida** (*debt auction*).

Simultaneamente, a garantia é vendida por Dai por meio de um CSA. Os Dai arrecadados em quantidade suficiente para cobrir a **penalidade de liquidação** (*liquidation penalty*, veja exemplo a seguir) são enviados imediatamente para o contrato de *Buy & Burn*. Assim que houver uma proposta de compra que cubra a penalidade de liquidação, o leilão se torna um leilão reverso com o objetivo de vender o mínimo de garantia possível, e qualquer garantia restante é devolvida para o criador do CDP.

>*__Exemplo 4__: Considere que a proporção de liquidação estabelecida para CDPs garantidos por Ether seja de 145%; que a proporção de penalidade seja de 105%; e que exista um CDP garantido por ETH em uma proporção de 150% do valor da dívida. Se então o preço do ETH cai 10% em relação ao preço-alvo do Dai, a proporção de garantia do CDP cai para aproximadamente 135%, abaixo portanto da proporção de liquidação. A Maker então emite 100 Dai em dívida de emergência para quitar o CDP e dá início a dois leilões: um leilão de dívida em que vende novos MKR por Dai (para saldar a dívida de emergência); e um leilão dos ETH (equivalentes a aproximadamente 135 Dai) resgatados do CDP. Assim que o volume de propostas de compra ultrapassa 105 Dai (valor da proporção de penalidade), os compradores passam a dar lances em um leilão reverso, de modo que a Maker venda a menor quantidade possível de ETH que arrecade esses 105 Dai. Os eventuais ETH restantes são devolvidos ao criador do CDP. Os 105 Dai arrecadados no leilão são utilizados pelo contrato de Buy & Burn. Caso o leilão de dívida consiga arrecadar Dai equivalente à proporção de penalidade, a Maker terá “lucrado” 5 Dai, que é em quanto a penalidade de liquidação excede a dívida original.*

Gerenciando a estabilidade do sistema
---------------------------------------

Apesar de sempre haver mais garantia do que o valor da dívida em um CDP quando as liquidações são acionadas, nada garante que elas serão operações lucrativas. Baixa liquidez ou um *crash* no mercado podem fazer com que o leilão de liquidação arrecade uma quantia de Dai equivalente a menos MKR do que o que foi diluído no leilão de dívida, resultando em prejuízos para a Maker e um aumento líquido da oferta MKR.

Apesar dos riscos, a Maker possui vários parâmetros que visam assegurar a estabilidade do sistema.

**Taxa de estabilidade - parâmetro global**

A taxa de estabilidade é uma taxa paga por todos os CDPs. Define-se como uma percentagem por ano que é calculada sobre o débito existente do CDP. Quando o mutuário quita seu CDP, o Dai usado para cobrir a dívida é destruído, mas o Dai usado para pagar a taxa de estabilidade é enviado para o contrato de Buy & Burn.

**Teto da dívida - parâmetro por tipo de CDP**

Teto da dívida é a quantidade máxima de dívida que pode ser criada por cada tipo de CDP. Uma vez que essa quantidade de dívida tenha sido criada por CDPs de um determinado tipo, torna-se impossível criar mais CDPs desse tipo, a menos que CDPs existentes sejam quitados.

**Proporção de liquidação - parâmetro por tipo de CDP**

Proporção de liquidação é a proporção de garantia abaixo da qual um CDP entra em liquidação.

**Proporção de penalidade - parâmetro por tipo de CDP**

A proporção de penalidade é usada para determinar a quantidade máxima de Dai arrecadada em um leilão de dívida que será destinada ao *Buy & Burn*. Eventual excedente de garantia é devolvido para o criador original do CDP.

Como agentes externos auxiliam a Maker
---------------------------------------

### Keepers: Mantendo o sistema economicamente eficiente
Operadores que sistematicamente exploram oportunidades simples de lucro ligadas à Maker e ao Dai são chamados de **keepers**. De maneira geral, um keeper é um agente econômico que contribui com um sistema descentralizado em troca de recompensas inerentes ao sistema. No contexto da Maker, os keepers executam várias funções importantes:

**Participam de leilões CSA**

Os keepers analisam constantemente o blockchain em busca de CDPs que tenham caído abaixo da sua proporção de liquidação e podem ter um leilão de liquidação acionado. Keepers dão lances nesses leilões com o objetivo de obter pelas garantias um preço melhor do que o valor de mercado, vendendo-as instantaneamente e realizando o lucro.

**Proveem liquidez ao mercado de Dai**

Cada keeper tentará vender Dai quando o preço de mercado for maior e comprar quando for menor do que o preço-alvo, a fim de lucrar com a convergência de longo prazo para o preço-alvo e ganhar dinheiro no curto prazo com as flutuações de preço.

O keeper pode também atuar como um **Oráculo** (*Oracle*), provendo informações de preço, como descrito na seção seguinte.

### Oráculos: Provedores externos de informação de preço
Outro grupo importante de atores externos necessários para o bom funcionamento da Maker são os oráculos de informação de preço. Oráculos são mecanismos que proveem informações do mundo exterior para o blockchain, para serem consumidas por contratos inteligentes. A Maker precisa de informações sobre o preço do Dai e seu desvio do preço-alvo, a fim de ajustar a taxa de deflação. Ela também precisa de informações sobre o preço dos vários ativos utilizados como garantia para o Dai, a fim de saber quando liquidações podem ser acionadas.

### Custodians: especialistas em armazenamento de garantias
A Custodian é uma empresa (pessoa jurídica) especializada em garantir empréstimos de Dai com ativos do mundo real. Isto é viabilizado por um contrato inteligente chamado de "custodian trap" que possibilita que a Maker autorize um limite de dívida ao custodian baseado em suas posses reais. Custodians aumentam a capacidade do sistema de responder a choques de demanda Dai.

Governança da Maker
---------------------------------------

### O processo de votação

*Governança direta* significa controlar a Maker diretamente por meio da votação com uma conta Ethereum que contém MKR. Uma conta tem direito a um voto para cada token MKR que contenha. Proprietários de MKR que votam e participam ativamente do processo de governança são chamados **governors**. A maioria simples dos votos tem plena autoridade do sistema para alterar as regras de votação, alterar a lógica de negócios, gastar o dinheiro do Fundo, e impedir alterações futuras em contratos inteligentes da Maker à medida que o sistema amadurece.

Há quatro fases principais nas quais os governors exercem governança direta sobre a Maker:

1) **Implementaçao e publicaçao de uma proposta de ação**, um contrato inteligente que mudará o status quo da Maker se for executado, modificando diretamente o estado de outros contratos inteligentes.

2) **Submissão da proposta de ação para votação** pública pelos governors. Isso permite que eles votem com suas MKR e iniciará a contagem do prazo de sua validade.

3) **Processo de votação**, realizado de acordo com as regras de votação do sistema. Essas regras em si também podem ser alteradas, até que no futuro finalmente sejam estabelecidas em definitivo pelo processo de governança. Cada proposta de ação tem um prazo de validade, após o qual é automaticamente abandonada.

4) **Execução da ação**, a operação que modifica o estado dos contratos inteligentes da Maker.

### Organização dos votantes

Uma parte importante da governança direta é a organização dos votantes. A fim de torná-la tão simples quanto possível, para que os governors possam coordenar seus votos e discutir propostas de ação, semanalmente ocorre uma reunião formal de governança por meio de uma conferência aberta à livre participação (em inglês) usando a plataforma TeamSpeak, atualmente marcada para todos os domingos às 15:00 GMT (12:00 no horário de Brasília sem horário de verão).

Apesar de o sistema de contratos permitir que propostas seja iniciadas a qualquer momento, em condições normais isso é feito somente em reuniões de governança. Uma proposta colocada em votação fora da estrutura da reunião de governança indica um ataque ao sistema, ou uma falha na estrutura de governança e uma potencial crise de governança.

Todas as discussões que não ocorrem dentro do arcabouço das reuniões de governança são referenciadas como governança informal. O chat da Maker no Slack e o fórum são as plataformas de comunicação primária para os proprietários de MKR discutirem e debaterem todos os aspectos da DAO e sua governança, e para governors agendarem reuniões de governança.

### Governança em ação: da ideia à proposta de ação

**Proposta em nível de governança informal:** Uma nova proposta será primeiramente levantada e discutida no Slack e no fórum. Nestes canais, de informações livres e públicas, uma proposta será rapidamente avaliada e objeções óbvias serão levantadas imediatamente pela comunidade. A proposta pode ser alterada com base em sugestões e objeções, ou até mesmo abandonada.

**Propostas em nível de governança formal:** Uma vez que uma proposta tenha sido suficientemente debatida e não haja objeções óbvias, ela pode seguir para a governança formal. A governança formal garante que cada governor estará presente para ponderar sobre a proposta apresentada em linguagem formal que enfatize o uso do inglês simples e com tradução simultânea para outros idiomas importantes. 

Se houver sugestões e objeções à proposta, estas devem ser devidamente articuladas e, se necessário, a proposta pode ser adiada até a próxima reunião de governança para permitir mais uma semana de governança informal. Quando uma proposta já não tem quaisquer sugestões ou objeções formais, uma proposta de ação deve de ser criada e publicada para avaliação, para que governors possam se assegurar de que ela implementa corretamente a essência da proposta.

**Voto direto:** Quando a proposta de ação for considerada pronta para votação, ela será submetida a votação pelo seu autor e os governors poderão votar a favor ou contra. Como mencionado acima, a submissão deve ocorrer durante a reunião de governança, ou ela seria considerada um ataque ou uma crise de governança. O processo de votação se estende para além da reunião de governança onde foi submetida, permitindo tempo suficiente para que cada governor vote, mesmo os ausentes.

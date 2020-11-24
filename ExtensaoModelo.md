# Extensão do Modelo

**Avaliação**: todos os participantes do evento podem fazer avaliações, sejam do próprio _Evento_ ou das _Atividades_. Cada avaliação carrega uma nota e um comentário. Uma _Pessoa_ pode fazer quantas avaliações quiser, assim como um _Evento_ e _Atividade_ podem receber `n` avaliações. Mas uma única _Avaliação_ fala sobre apenas uma _Atividade_ ou apenas um _Evento_.

**Playlist**: lista de músicas que podem tocar num _LocalFísico_. É composta por uma ou mais **Música** (sendo que uma _Música_ pode pertencer a uma ou mais playlists). Cada _Música_ é da autoria de um **GrupoMusical**. Um _GrupoMusical_ pode produzir uma ou mais _Músicas_.

**Anúncio Online**: agora o _Evento_ pode criar anúncios online para atrair público. Cada anúncio possui um título, descrição e uma URL, ao qual o usuário é direcionado quando clica no anúncio. Esse anúncio é publicado em uma **RedeSocial**, que é registrada com um nome, descrição e URL principal, além de um ícone para identificá-la.

**Perfil na Rede Social**: para alavancar ainda mais a divulgação do _Evento_, agora é possível que o mesmo possui um perfil oficial em qualquer rede social. Esse _Perfil_ é registrado com o nome, URL da página dentro da rede social, e também um contador do número de seguidores. Um _GrupoMusical_ também pode registrar seu _Perfil_, que forma que o _GrupoMusical_ pode ganhar visibilidade ao ter suas músicas tocadas no evento.

**Transfer**: por meio de um _Transfer_, agora um _LocalFísica_ consegue se conectar a **Estações de Metrô**, **Hotéis** e **Restaurantes**. Isso dá uma comodidade maior aos participantes do _Evento_, que podem tanto sair destes lugares para chegar no _Evento_, ou então visitá-los a partir do _Evento_.

O _Transfer_ possui um horário de início e de fim. Durante este horário, o _Transfer_ realizará o trajeto completo a cada dado intervalo. O _Transfer_ é feito usando um **Veículo**, que pode é registrado com nome, descrição, tipo e ano.

A _Estações de Metrô_, _Hotéis_ e _Restaurantes_ são generalizados para uma entidade chamada **Ponto de Transporte**, que facilita a modelagem para indicar que o _Transfer_ é capaz de chegar a qualquer um destes lugares sem precisar ficar criando uma relacionamento para cada lugar.
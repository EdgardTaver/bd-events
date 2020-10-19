2020-10-13

# TODOs


- [X] Atividades que acontecem em locais como auditórios e tudo mais?
> Possibilidade: ter uma entidade do tipo Instalação que servirá para registrar Salas de Reunião, Auditórios, etc, com atributos que indiquem a qualidade da Instalação (terceiro parágrafo dos requisitos).

- [X] Formas de apresentação de artigos: `apresentação oral, apresentação em pôsteres, apresentações multimidia, sessões da indústria, sessões de relato de experiências, etc`
> Será que pode ser resolvido sendo apenas um atributo da entidade de Apresentação?

- [X] Atributos das especializaçãos das **atividades** (como em `Palestras: nome do palestrante, afiliação, minicurrículo, nome da palestra, duração, públicoalvo, data, local de realização`).

- [X] **Atividade** dentro de **Evento** deve possuir um gerenciamento financeiro à parte das demais
> Isso talvez possa ser resolvido com uma generalização para **Atividade** e **Evento**, e aí a generalização estaria ligada ao gerenciamento financeiro. Essa generalização também indicaria o público.

- [X] Indicar que a especialização de **Pessoa** é _compartilhada_.
> Fiz diferente. Criei uma relação Papel que tem a função como um atributo. Aí, uma pessoa pode ter mais de um Papel.

- [X] Emissão de certificado para a **Pessoa** que participou de um evento sob determinada função.

- [X] **Taxa de Atividade** não pode ser uma especialização de Taxa, porque quem deve possuir essa taxa é a Atividade, e não o Evento (sendo que a relação de Possui tá entre Taxa e Evento, e não Taxa e Atividade)
> Talvez a ideia de generalizar **Atividade** e **Evento** ajude aqui.

- [X] Aceitar eventos online e presenciais.
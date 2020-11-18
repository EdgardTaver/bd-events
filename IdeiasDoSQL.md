Pontos do brModelo:

Não temos o tipo Serial para colocar em todas as chaves "id" que criamos, então temporariamente foram definidas como Integer.
- Ok!
	
Não temos também o tipo Text, mas isso não é problema porque usamos um Varchar. O problema acontece quando queremos criar um limite para o varchar, que não é possível pelo brmodelo.

Exemplo: "Telefone" poderia ser um varchar com um tamanho de 14
	
- Mano, eu topo editar manualmente o modelo para fazer tudo ficar como `text`. Argumentos [aqui](https://www.depesz.com/2010/03/02/charx-vs-varcharx-vs-varchar-vs-text/), [aqui](https://serverfault.com/questions/240813/whats-difference-between-varchar-and-text-type-in-postgresql) e [aqui](https://stackoverflow.com/questions/4848964/difference-between-text-and-varchar-character-varying). Em resumo: colocar o limite n pode ser problemático pra manter e o `text` parece performar ligeiramente melhor.

	- Então, eu tinha visto [aqui](https://www.postgresql.org/docs/current/datatype-character.html) que tanto faz se é varchar ou text
	
Colocamos "Senha" (tabela Portal) como varchar. Podemos guardar em plaintext ou usar uma encriptação onde só guardamos o hash (desejável)
- Podemos fazer todo o rolê da encriptação. Mas novamente, usando tipo `text`. E podemos deixar isso pro final... Acho que, pra fins de avaliar conhecimento em BD, não faz diferença.
	
"Entrada" (tabela Atividade) poderia ser um boolean se mudássemos pra Atividade Gratuita (sim/não)
- Hmmmm... Vou olhar o modelo pra dar uma pensada. Mas gosto da sua solução.

Além disso, "Duracao" está como varchar, mas poderia ser int (só definir se é em minutos, horas, o que)
- Estava pensando aqui... Não temos os campos de **Horário Início** e **Horário Fim**? A Duração já não estaria descrita por esses dois atributos? De repente a gente nem precisa do "Duração".
	- Essa duração era relativa devido a quando ta ocorrendo a atividade, não? Por exemplo, uma atividade ocorrer 5 dias (duração) e em cada dia ter um horário de início e fim.
		
"MEC" como integer, pq não sei o que isso vai ser?
- É... Também não sei hahaha. Seria "avaliação do MEC"? "Nota do MEC?" No pior dos casos, deixamos como `text` e boas.
	
Pra lidar com campos "Valor", estaremos usando o tipo Numeric, pq parece o certo
- Pode ser. Mas eu já vi que o formato ideal seria `int` ou `bigint`. Anyway, isso não faz muita diferença. Podemos ir de `numeric`.
	- Como a gente está falando de valores monetários o ideal é realmente Numeric, porque ele não tem problemas de arredondamento que floats teriam, por exemplo. [Doc](https://www.postgresql.org/docs/13/datatype-money.html)
	
"Minicurrículo" (tabela Palestra), qual deveria ser o tipo? Coloquei blob
- O Blob seria para dados binários, mas acho que o Minicurrículo seria uma descrição em texto corrido. Podemos deixar como `text`.
	- Justamente, pensei em deixar Blob pra poder subir pdf e afins, mas pode ser texto também
	
Tabela Concurso: "Regras" e "Premiacoes", que tipo seriam? Coloquei varchar mas parece bosta?
- Acho que podemos ir de `text` também.
	
"Horario Inicio" e "Horario Fim" estão como varchar, mas né?
- Tem que mudar pra `timestamptz`. 
	- Ok, só talvez seja chato o lance da data, mas veremos
	
"Chave de acesso" (tabela Nota Fiscal), coloquei varchar, mas não sei como é a identifição da nota?
- Essa chave é uma sequência de (salvo engano) 33 dígitos numéricos. Como não cabe no `int` e a chave não recebe operações algébricas, podemos só deixar como `text`
	- A única coisa que eu seria contra é que teríamos que ter na aplicação algo pra não permitir letras (E usar um varchar(33)), então talvez usar (Numeric)[https://www.postgresql.org/docs/13/datatype-numeric.html]



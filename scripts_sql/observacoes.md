# Observações

SI - Banco de Dados  
Novembro, 2020

Nome                           | Nr. USP
-------------------------------|---------
Edgard van Tol Taver           | 10686575
Guilherme Vaz de Sousa Ribeiro | 10300320
Pedro Raul Taborga da Costa    | 4537076

---

## Alteração do domínio das chaves estrangeiras

Decidimos usar o pseudo-tipo `SERIAL` como domínio das chaves primárias (conforme vimos [aqui](https://www.postgresqltutorial.com/postgresql-serial/)).

Este psedo-tipo gera uma sequência que se incrementa a cada nova tupla, o que é ideal para a chave primárias nas nossas tabelas.

Porém, pela forma como o BR Modelo funciona, o domínio da chave estrangeira sempre espelha o domínio da chave para a qual está se apontando. Desta forma, todas as chaves estrangeiras acabam herdando o tipo `SERIAL`.

Para chave estrangeira, o formato `SERIAL` não faz sentido, pois não se trata de um campo de valor sequencial, mas sim de um ponteiro para outro campo. Desta forma, o formato `INTEGER` seria melhor.

Devido a essa limitação do BR Modelo, fizemos uma edição nos scripts de DDL para fazer com que o domínio das chaves estrangeiras seja `INTEGER` enquanto o tipo das chaves primárias manteve-se como `SERIAL`.
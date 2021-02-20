# Stone Challenge - Programa de Formação em Elixir

## Objetivo do desafio!

Imagine uma lista de compras. Ela possui:

- Itens
- Quantidade de cada item
- Preço por unidade/peso/pacote de cada item

Desenvolva uma função (ou método) que irá receber uma lista de compras (como a detalhada acima) e uma lista de e-mails. Aqui, cada e-mail representa uma pessoa. 

A função deve:

- Calcular a soma dos valores, ou seja, multiplicar o preço de cada item por sua quantidade e somar todos os itens
- Dividir o valor de forma igual entre a quantidade de e-mails
- Retornar um mapa/dicionário onde a chave será o e-mail e o valor será quanto ele deve pagar nessa conta.

** Para mais detalhes veja o [repositório do teste](https://gist.github.com/programa-elixir/1bd50a6d97909f2daa5809c7bb5b9a8a)

## Minha Solução

Para resolver o problema, primeiramente, o valor total dos itens é calculado e distribuído igualmente entre todas as pessoas ignorando o resto da divisão. Ou seja, se o valor total for *301 centavos* para *3 pessoas* cada uma receberá *100 centavos*. Após isso, o resto da divisão é distribuído de um em um centavo para cada um dos integrantes até que chegue a zero. No nosso exemplo dos 301 centavos, cada integrante receberá 300 centavos e o resto (*1 centavo*) será distribuído para a primeira pessoa da lista fazendo com que ela tenha que pagar *301 centavos*. Com isso o valor a ser pago por cada pessoa será o mais igualitario dentro do possível.

## Gimme the Code!!!

Este desafio foi feito utilizando elixir. Para rodá-lo abra um terminal na pasta do projeto e digite:

```
iex //para o terminal interativo do elixir

c("stone_challenge.ex") //para compilar o código

StoneChallenge.main() //executa a função

```

Para mudar a lista de itens ou de pessoas basta alterar o conteúdo dos métodos:

```elixir
@doc """
    return a list of items (insert your list of items here)
  """
  def generated_shopping_list() do
    [
      %{
        name: "Vodka",
        qty: 4,
        price: 3000
      },
      ...
    ]
  end

  @doc """
    return a list of emails (insert your list of emails here)
  """
  def generated_email_list() do
    [
      "teste1@email.com",
      "teste2@email.com",
      "teste3@email.com"
    ]
  end
```
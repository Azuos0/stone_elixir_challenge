defmodule StoneChallenge do
  @doc """
    main function! Call it and see the magic happen!!!
  """
  def main() do
    shopping_list = generated_shopping_list() # "generate" the list of items
    email_list = generated_email_list() # "generate" the list of emails

    # Check if the lists sizes are greater than zero.
    # If not it returns a error message
    if Kernel.length(shopping_list) > 0 and Kernel.length(email_list) > 0 do
      #calculate the total value of the shopping list
      billToPay =  Enum.reduce(shopping_list, 0, fn item, acc ->
        acc + (item.price * item.qty)
      end)

      # Divide it equally among all emails and get the remainder (if it exists)
      minimumValuePerEmail = div(billToPay, Kernel.length(email_list))
      remainder = rem(billToPay, Kernel.length(email_list))

      IO.puts("Bill to pay: #{billToPay}")
      IO.puts("Minimum value for each person: #{minimumValuePerEmail}")
      IO.puts("Final value per person: ")

      # create a map with the amount to pay per user
      create_payment_map(email_list, minimumValuePerEmail, remainder)
    else
      IO.puts("Error: Empty list of emails and/or items. Try insert elements in yours lists and try again! ;)")
    end
  end

  def create_payment_map([], _), do: %{}

  @doc """
    return a map with the value that each person must paid
    it receive a "baseValue" (minimum amount that each person must paid)
    and a remainder which are distributed through the email list util it reachs zero
  """
  def create_payment_map([email|t], baseValue, remainder \\ 0) do
    if(remainder > 0) do
      amount = baseValue + 1
      newRemainder = remainder - 1

      Map.merge(%{"#{email}": amount}, create_payment_map(t, baseValue, newRemainder))
    else
      Map.merge(%{"#{email}": baseValue}, create_payment_map(t, baseValue))
    end
  end

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
      %{
        name: "Redbull",
        qty: 10,
        price: 600
      },
      %{
        name: "Water 500ml",
        qty: 15,
        price: 200
      },
      %{
        name: "Coffe",
        qty: 35,
        price: 430
      },
      %{
        name: "Misto Quente",
        qty: 5,
        price: 3000
      }
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
end

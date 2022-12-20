defmodule Day1 do
  def letter_to_number(c) do
    cond do
      c in ~w(a b c) -> 2
      c in ~w(d e f) -> 3
      c in ~w(g h i) -> 4
      c in ~w(j k l) -> 5
      c in ~w(m n o) -> 6
      c in ~w(p q r s) -> 7
      c in ~w(t u v) -> 8
      c in ~w(w x y z) -> 9
      :else -> raise "bad input: #{c}"
    end
  end

  def name_to_phone_number(name) do
    name
    |> String.split(" ")
    |> List.last()
    |> normalize()
    |> String.codepoints()
    |> Enum.map(&letter_to_number/1)
    |> Enum.join("")
  end

  ## returns a string with no whitespace, lowercase letters or digits only
  def normalize(str) do
    str |> String.downcase() |> String.replace(~r"[^0-9a-z]", "")
  end

  def solve() do
    [customer] =
      Hanukkah5783.customers()
      |> Enum.filter(fn %{"name" => name, "phone" => phone} ->
        name_number = name_to_phone_number(name)
        phone = normalize(phone)

        String.starts_with?(name_number, phone)
      end)

    customer
  end
end

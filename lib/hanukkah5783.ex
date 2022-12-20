defmodule Hanukkah5783 do
  @customers "noahs-customers.jsonl"
             |> File.read!()
             |> String.split("\n", trim: true)
             |> Enum.map(&Jason.decode!/1)
  @products "noahs-products.jsonl"
            |> File.read!()
            |> String.split("\n", trim: true)
            |> Enum.map(&Jason.decode!/1)
  @orders "noahs-orders.jsonl"
          |> File.read!()
          |> String.split("\n", trim: true)
          |> Enum.map(&Jason.decode!/1)

  def customers, do: @customers
  def products, do: @products
  def orders, do: @orders
end

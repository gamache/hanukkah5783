defmodule Day2 do
  def jd_contractors do
    Hanukkah5783.customers()
    |> Enum.filter(fn %{"name" => name} ->
      names = String.split(name, " ")
      first_name = List.first(names)
      last_name = List.last(names)
      String.starts_with?(first_name, "J") && String.starts_with?(last_name, "D")
    end)
  end

  def solve do
    contractor_map =
      jd_contractors()
      |> Enum.map(fn %{"customerid" => cid} = cust -> {cid, cust} end)
      |> MapSet.new()
      |> Enum.into(%{})

    [order] =
      Hanukkah5783.orders()
      |> Enum.filter(fn %{"customerid" => cid, "ordered" => ordered, "items" => items} ->
        Map.get(contractor_map, cid) &&
          String.starts_with?(ordered, "2017") &&
          Enum.any?(items, fn %{"sku" => sku} -> sku == "DLI1464" end)
      end)

    Map.get(contractor_map, order["customerid"])
  end
end

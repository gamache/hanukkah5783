defmodule Day3 do
  @years_of_the_dog ~w[1946 1958 1970 1982 1994 2006 2018]
  @aries_start "03-21"
  @aries_end "04-19"

  def solve do
    day_2_contractor = Day2.solve()

    aries_dogs =
      Hanukkah5783.customers()
      |> Enum.filter(fn %{"birthdate" => birthdate} ->
        Enum.any?(@years_of_the_dog, fn year ->
          "#{year}-#{@aries_start}" <= birthdate &&
            "#{year}-#{@aries_end}" >= birthdate
        end)
      end)

    [aries_dog_with_rug] =
      aries_dogs
      |> Enum.filter(fn %{"citystatezip" => csz} ->
        csz == day_2_contractor["citystatezip"]
      end)

    aries_dog_with_rug
  end
end

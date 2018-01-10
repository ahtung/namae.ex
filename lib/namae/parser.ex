defmodule Parser do
  def parse(string) do
    if string == "" do
      []
    else
      [Name.new(%{given: string})]
    end
  end
  
  def normalize(string) do
    string
      |> String.normalize(:nfd)
      |> String.trim
  end
end

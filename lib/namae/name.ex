defmodule Name do
  defstruct [:family, :given, :suffix, :particle,
  :dropping_particle, :nick, :appellation, :title]
  
  def new(), do: %Name{}
  def new(opts) do
    struct(Name, opts)
  end
  
  def initials(name) do
    [given_part(name), family_part(name)]
      |> Enum.join(" ")
      |> initials_of
  end
  def initials(name, opts) do
    [initials_of(given_part(name)), name.family]
      |> Enum.filter(& !is_nil(&1))
      |> Enum.join(" ")
  end
  
  def initials_of(name) do
    i = Regex.replace(~r/([[:upper:]])[[:lower:]]+/, name, "\\g{1}.")
    Regex.replace(~r/\s+/, i, "")
  end
  
  def family_part(name) do
    [name.particle, name.family]
      |> Enum.filter(& !is_nil(&1))
      |> Enum.join(" ")
  end

  def given_part(name) do
    [name.given, name.dropping_particle]
      |> Enum.filter(& !is_nil(&1))
      |> Enum.join(" ")
  end
end

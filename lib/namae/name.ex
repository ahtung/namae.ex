defmodule Name do
  defstruct [:family, :given, :suffix, :particle,
  :dropping_particle, :nick, :appellation, :title]
  
  def new(opts) do
    struct(Name, opts)
  end
  
  def new(), do: %Name{}
  
  def parse(name) do
    
  end
end

defmodule NamaeTest do
  use ExUnit.Case
  doctest Namae

  test "greets the world" do
    assert Namae.hello() == :world
  end
end

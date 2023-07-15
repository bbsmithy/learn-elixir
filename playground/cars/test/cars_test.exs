defmodule CarsTest do
  use ExUnit.Case
  doctest Cars

  test "greets the world" do
    assert Cars.hello() == :world
  end
end

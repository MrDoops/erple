defmodule ErpleTest do
  use ExUnit.Case
  doctest Erple

  test "greets the world" do
    assert Erple.hello() == :world
  end
end

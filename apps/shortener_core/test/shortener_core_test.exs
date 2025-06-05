defmodule ShortenerCoreTest do
  use ExUnit.Case
  doctest ShortenerCore

  test "greets the world" do
    assert ShortenerCore.hello() == :world
  end
end

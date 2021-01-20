defmodule PragmaticTest do
  use ExUnit.Case
  doctest Pragmatic

  test "list_concat" do
    assert Pragmatic.list_concat([1, 2 ,3], []) == [1, 2, 3]
  end

end

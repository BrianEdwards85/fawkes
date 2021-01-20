defmodule Fawkes.Resolvers.Books do
  alias Fawkes.Repos.Books, as: Books_Repo

  def all_books(_root, _args, _info) do
    {:ok, Books_Repo.list_books()}
  end
end
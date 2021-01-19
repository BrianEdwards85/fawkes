defmodule Fawkes.Repos.Books do
  import Ecto.Query

  alias Fawkes.Repo
  alias Fawkes.Repos.Book

  def list_books do
    Repo.all(Book)
  end

  def get_book(id), do: Repo.get(Book, id)
end
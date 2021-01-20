defmodule Fawkes.Repos.Authors do
  import Ecto.Query

  alias Fawkes.Repo
  alias Fawkes.Repos.Author

  def list_authors do
    Repo.all(Author)
  end

  def get_author(id), do: Repo.get(Author, id)
end

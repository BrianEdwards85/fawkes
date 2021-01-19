defmodule Fawkes.Routes.Books do
  use Fawkes.Routes.Base

  alias Fawkes.Repo
  alias Fawkes.Repos.Books, as: Book_Repo

  get "/" do
    send(conn, 200, Book_Repo.list_books())
  end

end
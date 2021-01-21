defmodule Fawkes.Repos.Books do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :title, :author, :price]}
  @schema_prefix "fawkes"
  @primary_key {:id, :string, autogenerate: false}
  schema "books" do
    field :title, :string
    belongs_to :author, Fawkes.Repos.Authors, type: :binary_id
    field :price, :integer
  end

  import Ecto.Query

  alias Fawkes.Repo

  def list_books(query \\ __MODULE__) do
    Repo.all(query)
  end

  def get_book(query \\ __MODULE__, id), do: Repo.get(query, id)
end
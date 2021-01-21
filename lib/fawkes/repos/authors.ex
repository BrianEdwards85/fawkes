defmodule Fawkes.Repos.Authors do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :name]}
  @schema_prefix "fawkes"
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "authors" do
    field :name, :string
  end

  import Ecto.Query

  alias Fawkes.Repo

  def list_authors(query \\ __MODULE__) do
    Repo.all(query)
  end

  def get_author(query \\ __MODULE__, id), do: Repo.get(query, id)
end

defmodule Fawkes.Repos.Author do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :name]}
  @schema_prefix "fawkes"
  @primary_key {:id, :binary_id, autogenerate: false}
  schema "authors" do
    field :name, :string
  end
end

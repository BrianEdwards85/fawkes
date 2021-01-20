defmodule Fawkes.Repos.Book do
  use Ecto.Schema

  @derive {Jason.Encoder, only: [:id, :title, :author, :price]}
  @schema_prefix "fawkes"
  @primary_key {:id, :string, autogenerate: false}
  schema "books" do
    field :title, :string
    belongs_to :author, Fawkes.Repos.Author, type: :binary_id
    field :price, :integer
  end
end

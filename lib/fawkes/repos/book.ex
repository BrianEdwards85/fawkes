defmodule Fawkes.Repos.Book do
  use Ecto.Schema

  @schema_prefix "fawkes"
  @primary_key {:id, :string, autogenerate: false}
  schema "books" do
#    field :id, :string
    field :title, :string
    field :author, :string
    field :price, :integer
  end
end
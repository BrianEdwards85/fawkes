defmodule Fawkes.Schema do
  use Absinthe.Schema

  alias Fawkes.Resolvers.Books

  object :book do
    field :id, non_null(:string)
    field :title, non_null(:string)
    field :author, non_null(:string)
    field :price, non_null(:integer)
  end

  query do
    @desc "Get all books"
    field :all_books, non_null(list_of(non_null(:book))) do
      resolve(&Books.all_books/3)
    end
  end
end
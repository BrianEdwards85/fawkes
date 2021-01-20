defmodule Fawkes.Schema do
  use Absinthe.Schema

  alias Fawkes.Resolvers.Books
  alias Fawkes.Resolvers.Author
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :author do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :book do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :author, non_null(:author), resolve: dataloader(:db)
    field :price, non_null(:integer)
  end

  query do
    @desc "Get all books"
    field :all_books, non_null(list_of(non_null(:book))) do
      resolve(&Books.all_books/3)
    end
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  def context(ctx) do
    source = Dataloader.Ecto.new(Fawkes.Repo)

    loader =
      Dataloader.new()
      |> Dataloader.add_source(:db, source)

    Map.put(ctx, :loader, loader)
  end

end

defmodule Fawkes.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    execute "CREATE SCHEMA fawkes"

    create table(:books, primary_key: false, prefix: "fawkes") do
      add :id, :text, primary_key: true
      add :title, :text, null: false
      add :author, :text, null: false
      add :price, :integer, null: false
    end
  end
end

defmodule Fawkes.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors, primary_key: false, prefix: "fawkes") do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :name, :text, null: false
    end

    alter table(:books, prefix: "fawkes") do
      add :author_id, references("authors", type: :uuid)
    end

    execute """
    INSERT INTO fawkes.authors (name)
    SELECT author
    FROM fawkes.books
    GROUP BY author
    """

    execute """
    UPDATE fawkes.books
    SET author_id = authors.id
    FROM fawkes.authors
    WHERE books.author = authors.name
    """

    execute "ALTER TABLE fawkes.books ALTER COLUMN author_id SET NOT NULL;"

    alter table(:books, prefix: "fawkes") do
      remove :author
    end
  end
end

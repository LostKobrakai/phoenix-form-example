defmodule FormExample.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :text

      timestamps(type: :utc_datetime)
    end
  end
end

defmodule FormExample.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :text
      add :business_id, references(:businesses, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:profiles, [:business_id])
  end
end

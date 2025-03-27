defmodule Homework2.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :first_name, :string
      add :last_name, :string
      add :department_id, references(:departments, on_delete: :nothing)
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

    create index(:employees, [:department_id])
    create index(:employees, [:role_id])
  end
end

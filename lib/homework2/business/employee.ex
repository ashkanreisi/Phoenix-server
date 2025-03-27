defmodule Homework2.Business.Employee do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework2.Business.Department
  alias Homework2.Business.Role

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    belongs_to :department, Department #note that the field has been removed
    belongs_to :role, Role #note that the field has been removed
    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:first_name, :last_name, :department_id, :role_id])
    |> validate_required([:first_name, :last_name])
  end
end

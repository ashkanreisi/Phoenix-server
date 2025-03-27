defmodule Homework2.Business.Department do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework2.Business.Employee

  schema "departments" do
    field :name, :string
    has_many :employees, Employee
    timestamps()
  end

  @doc false
  def changeset(department, attrs) do
    department
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

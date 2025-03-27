defmodule Homework2.Business.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias Homework2.Business.Employee


  schema "roles" do
    field :name, :string
    has_many :employees, Employee
    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

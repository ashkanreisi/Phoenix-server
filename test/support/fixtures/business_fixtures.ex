defmodule Homework2.BusinessFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Homework2.Business` context.
  """

  @doc """
  Generate a department.
  """
  def department_fixture(attrs \\ %{}) do
    {:ok, department} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Homework2.Business.create_department()

    department
  end

  @doc """
  Generate a role.
  """
  def role_fixture(attrs \\ %{}) do
    {:ok, role} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Homework2.Business.create_role()

    role
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> Homework2.Business.create_employee()

    employee
  end
end

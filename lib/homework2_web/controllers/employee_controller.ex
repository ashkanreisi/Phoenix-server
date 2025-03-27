defmodule Homework2Web.EmployeeController do
  use Homework2Web, :controller

  alias Homework2.Business
  alias Homework2.Business.Employee
  alias Homework2.Business.Department
  alias Homework2.Business.Role
  alias Homework2.Repo

  def index(conn, _params) do
    employees = Business.list_employees()
    |> Repo.preload(:department)
    |> Repo.preload(:role)
    render(conn, "index.html", employees: employees)
  end

  def new(conn, _params) do
    changeset = Business.change_employee(%Employee{})
    roles = Business.list_roles()
    departments = Business.list_departments()
    render(conn, "new.html", changeset: changeset, roles: roles, departments: departments)
  end

  def create(conn, %{"employee" => employee_params}) do
    case Business.create_employee(employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee created successfully.")
        |> redirect(to: Routes.employee_path(conn, :show, employee))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    employee = Business.get_employee!(id)
    |> Repo.preload(:department)
    |> Repo.preload(:role)
    render(conn, "show.html", employee: employee)
  end

  def edit(conn, %{"id" => id}) do
    employee = Business.get_employee!(id)
    changeset = Business.change_employee(employee)
    roles = Business.list_roles()
    departments = Business.list_departments()
    render(conn, "edit.html", employee: employee, changeset: changeset, roles: roles, departments: departments)
  end


  def update(conn, %{"id" => id, "employee" => employee_params}) do
    employee = Business.get_employee!(id)

    case Business.update_employee(employee, employee_params) do
      {:ok, employee} ->
        conn
        |> put_flash(:info, "Employee updated successfully.")
        |> redirect(to: Routes.employee_path(conn, :show, employee))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", employee: employee, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    employee = Business.get_employee!(id)
    {:ok, _employee} = Business.delete_employee(employee)

    conn
    |> put_flash(:info, "Employee deleted successfully.")
    |> redirect(to: Routes.employee_path(conn, :index))
  end
end

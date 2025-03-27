defmodule Homework2Web.DepartmentController do
  use Homework2Web, :controller

  alias Homework2.Business
  alias Homework2.Business.Department
  alias Homework2.Business.Employee
  alias Homework2.Repo

  def index(conn, _params) do
    departments = Business.list_departments()
    render(conn, "index.html", departments: departments)
  end

  def new(conn, _params) do
    changeset = Business.change_department(%Department{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"department" => department_params}) do
    case Business.create_department(department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department created successfully.")
        |> redirect(to: Routes.department_path(conn, :show, department))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    department = Business.get_department!(id)
    |> Repo.preload(:employees)

    render(conn, "show.html", department: department)
  end

  def edit(conn, %{"id" => id}) do
    department = Business.get_department!(id)
    changeset = Business.change_department(department)
    render(conn, "edit.html", department: department, changeset: changeset)
  end

  def update(conn, %{"id" => id, "department" => department_params}) do
    department = Business.get_department!(id)

    case Business.update_department(department, department_params) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "Department updated successfully.")
        |> redirect(to: Routes.department_path(conn, :show, department))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", department: department, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    department = Business.get_department!(id)
    {:ok, _department} = Business.delete_department(department)

    conn
    |> put_flash(:info, "Department deleted successfully.")
    |> redirect(to: Routes.department_path(conn, :index))
  end
end

defmodule Homework2Web.RoleController do
  use Homework2Web, :controller

  alias Homework2.Business
  alias Homework2.Business.Role
  alias Homework2.Business.Employee
  alias Homework2.Repo

  def index(conn, _params) do
    roles = Business.list_roles()
    render(conn, "index.html", roles: roles)
  end

  def new(conn, _params) do
    changeset = Business.change_role(%Role{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role" => role_params}) do
    case Business.create_role(role_params) do
      {:ok, role} ->
        conn
        |> put_flash(:info, "Role created successfully.")
        |> redirect(to: Routes.role_path(conn, :show, role))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    role = Business.get_role!(id)
    |> Repo.preload(:employees)
    render(conn, "show.html", role: role)
  end

  def edit(conn, %{"id" => id}) do
    role = Business.get_role!(id)
    changeset = Business.change_role(role)
    render(conn, "edit.html", role: role, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    role = Business.get_role!(id)

    case Business.update_role(role, role_params) do
      {:ok, role} ->
        conn
        |> put_flash(:info, "Role updated successfully.")
        |> redirect(to: Routes.role_path(conn, :show, role))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", role: role, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Business.get_role!(id)
    {:ok, _role} = Business.delete_role(role)

    conn
    |> put_flash(:info, "Role deleted successfully.")
    |> redirect(to: Routes.role_path(conn, :index))
  end
end

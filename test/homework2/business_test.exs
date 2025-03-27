defmodule Homework2.BusinessTest do
  use Homework2.DataCase

  alias Homework2.Business

  describe "departments" do
    alias Homework2.Business.Department

    import Homework2.BusinessFixtures

    @invalid_attrs %{name: nil}

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Business.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Business.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Department{} = department} = Business.create_department(valid_attrs)
      assert department.name == "some name"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Department{} = department} = Business.update_department(department, update_attrs)
      assert department.name == "some updated name"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_department(department, @invalid_attrs)
      assert department == Business.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Business.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Business.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Business.change_department(department)
    end
  end

  describe "roles" do
    alias Homework2.Business.Role

    import Homework2.BusinessFixtures

    @invalid_attrs %{name: nil}

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Business.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Business.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Role{} = role} = Business.create_role(valid_attrs)
      assert role.name == "some name"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Role{} = role} = Business.update_role(role, update_attrs)
      assert role.name == "some updated name"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_role(role, @invalid_attrs)
      assert role == Business.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Business.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Business.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Business.change_role(role)
    end
  end

  describe "employees" do
    alias Homework2.Business.Employee

    import Homework2.BusinessFixtures

    @invalid_attrs %{first_name: nil, last_name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Business.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Business.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Employee{} = employee} = Business.create_employee(valid_attrs)
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Business.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Employee{} = employee} = Business.update_employee(employee, update_attrs)
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Business.update_employee(employee, @invalid_attrs)
      assert employee == Business.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Business.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Business.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Business.change_employee(employee)
    end
  end
end

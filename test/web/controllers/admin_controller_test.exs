defmodule Test13.Web.AdminControllerTest do
  use Test13.Web.ConnCase

  alias Test13.Accounts
  alias Test13.Accounts.Admin

  @create_attrs %{email: "some email", password: "some password", username: "some username"}
  @update_attrs %{email: "some updated email", password: "some updated password", username: "some updated username"}
  @invalid_attrs %{email: nil, password: nil, username: nil}

  def fixture(:admin) do
    {:ok, admin} = Accounts.create_admin(@create_attrs)
    admin
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, admin_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates admin and renders admin when data is valid", %{conn: conn} do
    conn = post conn, admin_path(conn, :create), admin: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, admin_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "email" => "some email",
      "password" => "some password",
      "username" => "some username"}
  end

  test "does not create admin and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, admin_path(conn, :create), admin: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen admin and renders admin when data is valid", %{conn: conn} do
    %Admin{id: id} = admin = fixture(:admin)
    conn = put conn, admin_path(conn, :update, admin), admin: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, admin_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "email" => "some updated email",
      "password" => "some updated password",
      "username" => "some updated username"}
  end

  test "does not update chosen admin and renders errors when data is invalid", %{conn: conn} do
    admin = fixture(:admin)
    conn = put conn, admin_path(conn, :update, admin), admin: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen admin", %{conn: conn} do
    admin = fixture(:admin)
    conn = delete conn, admin_path(conn, :delete, admin)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, admin_path(conn, :show, admin)
    end
  end
end

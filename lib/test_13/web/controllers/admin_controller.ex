defmodule Test13.Web.AdminController do
  use Test13.Web, :controller

  alias Test13.Accounts
  alias Test13.Accounts.Admin

  action_fallback Test13.Web.FallbackController

  def index(conn, _params) do
    admin = Accounts.list_admin()
    render(conn, "index.json", admin: admin)
  end

  def create(conn, %{"admin" => admin_params}) do
    with {:ok, %Admin{} = admin} <- Accounts.create_admin(admin_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", admin_path(conn, :show, admin))
      |> render("show.json", admin: admin)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)
    render(conn, "show.json", admin: admin)
  end

  def update(conn, %{"id" => id, "admin" => admin_params}) do
    admin = Accounts.get_admin!(id)

    with {:ok, %Admin{} = admin} <- Accounts.update_admin(admin, admin_params) do
      render(conn, "show.json", admin: admin)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Accounts.get_admin!(id)
    with {:ok, %Admin{}} <- Accounts.delete_admin(admin) do
      send_resp(conn, :no_content, "")
    end
  end
end

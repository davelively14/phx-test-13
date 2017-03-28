defmodule Test13.Web.AdminView do
  use Test13.Web, :view
  alias Test13.Web.AdminView

  def render("index.json", %{admin: admin}) do
    %{data: render_many(admin, AdminView, "admin.json")}
  end

  def render("show.json", %{admin: admin}) do
    %{data: render_one(admin, AdminView, "admin.json")}
  end

  def render("admin.json", %{admin: admin}) do
    %{id: admin.id,
      username: admin.username,
      email: admin.email,
      password: admin.password}
  end
end

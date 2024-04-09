defmodule FormExampleWeb.HomeLive do
  alias FormExample.Businesses.Business
  alias FormExample.Profiles.Profile
  use FormExampleWeb, :live_view

  alias FormExample.Orders.Order
  alias FormExampleWeb.HomeLive.HomeForm

  def render(assigns) do
    ~H"""
    <.form :let={form} for={@changeset}>
      <.input field={form[:profile][:name]} type="text" />
      <.input field={form[:business][:name]} type="text" />
      <%= for order <- form[:orders] do %>
        <.input
          field={form[:orders][order.id][:status]}
          type="select"
          options={Order.valid_statutes()}
        />
      <% end %>
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, params, socket.assigns.live_action)}
  end

  defp apply_action(socket, _params, :new) do
    form = %HomeForm{profile: %Profile{}, business: %Business{}, orders: []}
    changeset = form |> HomeForm.changeset(%{}) |> to_form()
    assign(socket, :changeset, changeset)
  end
end

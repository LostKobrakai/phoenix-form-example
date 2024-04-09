defmodule FormExample.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, Ecto.Enum, values: [:draft, :paid, :refunded]
    field :business, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end

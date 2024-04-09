defmodule FormExampleWeb.HomeLive.HomeForm do
  use Ecto.Schema
  import Ecto.Changeset

  alias FormExample.Businesses.Business
  alias FormExample.Orders.Order
  alias FormExample.Profiles.Profile

  embedded_schema do
    embeds_one :profile, Profile
    embeds_one :business, Business
    embeds_many :orders, Order
  end

  def changeset(form, attrs) do
    form
    |> cast(attrs, [])
    |> cast_embed(:profile, with: &Profile.changeset/2)
    |> cast_embed(:business, with: &Business.changeset/2)
    |> cast_embed(:orders, with: &Order.changeset/2)
  end
end

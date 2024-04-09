defmodule FormExample.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FormExample.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{})
      |> FormExample.Orders.create_order()

    order
  end

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        status: :draft
      })
      |> FormExample.Orders.create_order()

    order
  end
end

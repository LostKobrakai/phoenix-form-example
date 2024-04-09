defmodule FormExample.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FormExample.Profiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FormExample.Profiles.create_profile()

    profile
  end
end

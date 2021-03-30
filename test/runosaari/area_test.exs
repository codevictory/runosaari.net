defmodule Runosaari.AreaTest do
  use Runosaari.DataCase

  alias Runosaari.Area

  describe "locations" do
    alias Runosaari.Area.Location

    @valid_attrs %{address: "some address", description: "some description", max_seats: 42, name: "some name", reserved_seats: 42}
    @update_attrs %{address: "some updated address", description: "some updated description", max_seats: 43, name: "some updated name", reserved_seats: 43}
    @invalid_attrs %{address: nil, description: nil, max_seats: nil, name: nil, reserved_seats: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Area.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Area.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Area.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Area.create_location(@valid_attrs)
      assert location.address == "some address"
      assert location.description == "some description"
      assert location.max_seats == 42
      assert location.name == "some name"
      assert location.reserved_seats == 42
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Area.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Area.update_location(location, @update_attrs)
      assert location.address == "some updated address"
      assert location.description == "some updated description"
      assert location.max_seats == 43
      assert location.name == "some updated name"
      assert location.reserved_seats == 43
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Area.update_location(location, @invalid_attrs)
      assert location == Area.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Area.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Area.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Area.change_location(location)
    end
  end
end

defmodule Runosaari.ScheduleTest do
  use Runosaari.DataCase

  alias Runosaari.Schedule

  describe "performances" do
    alias Runosaari.Schedule.Performance

    @valid_attrs %{description: "some description", notes: "some notes", time: ~N[2010-04-17 14:00:00]}
    @update_attrs %{description: "some updated description", notes: "some updated notes", time: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{description: nil, notes: nil, time: nil}

    def performance_fixture(attrs \\ %{}) do
      {:ok, performance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_performance()

      performance
    end

    test "list_performances/0 returns all performances" do
      performance = performance_fixture()
      assert Schedule.list_performances() == [performance]
    end

    test "get_performance!/1 returns the performance with given id" do
      performance = performance_fixture()
      assert Schedule.get_performance!(performance.id) == performance
    end

    test "create_performance/1 with valid data creates a performance" do
      assert {:ok, %Performance{} = performance} = Schedule.create_performance(@valid_attrs)
      assert performance.description == "some description"
      assert performance.notes == "some notes"
      assert performance.time == ~N[2010-04-17 14:00:00]
    end

    test "create_performance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_performance(@invalid_attrs)
    end

    test "update_performance/2 with valid data updates the performance" do
      performance = performance_fixture()
      assert {:ok, %Performance{} = performance} = Schedule.update_performance(performance, @update_attrs)
      assert performance.description == "some updated description"
      assert performance.notes == "some updated notes"
      assert performance.time == ~N[2011-05-18 15:01:01]
    end

    test "update_performance/2 with invalid data returns error changeset" do
      performance = performance_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_performance(performance, @invalid_attrs)
      assert performance == Schedule.get_performance!(performance.id)
    end

    test "delete_performance/1 deletes the performance" do
      performance = performance_fixture()
      assert {:ok, %Performance{}} = Schedule.delete_performance(performance)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_performance!(performance.id) end
    end

    test "change_performance/1 returns a performance changeset" do
      performance = performance_fixture()
      assert %Ecto.Changeset{} = Schedule.change_performance(performance)
    end
  end
end

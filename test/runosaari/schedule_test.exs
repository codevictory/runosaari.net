defmodule Runosaari.ScheduleTest do
  use Runosaari.DataCase

  alias Runosaari.Schedule

  describe "performances" do
    alias Runosaari.Schedule.Performance

    @create_attrs %{
      name: "some name",
      desc: "some description",
      seqnum: 1
    }

    @update_attrs %{
      name: "some updated name",
      desc: "some updated description",
      seqnum: 2
    }

    @valid_attrs %{name: "some name", desc: "some description", seqnum: 1}

    @invalid_attrs %{name: nil, desc: nil, seqnum: nil}

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
      assert performance.name == "some name"
      assert performance.desc == "some description"
      assert performance.seqnum == 1
    end

    test "create_performance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_performance(@invalid_attrs)
    end

    test "update_performance/2 with valid data updates the performance" do
      performance = performance_fixture()

      assert {:ok, %Performance{} = performance} =
               Schedule.update_performance(performance, @update_attrs)

      assert performance.name == "some updated name"
      assert performance.desc == "some updated description"
      assert performance.seqnum == 2
    end

    test "update_performance/2 with invalid data returns error changeset" do
      performance = performance_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Schedule.update_performance(performance, @invalid_attrs)

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

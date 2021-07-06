defmodule Runosaari.ScheduleTest do
  use Runosaari.DataCase

  alias Runosaari.Schedule

  describe "performances" do
    alias Runosaari.Schedule.Performance

    @create_attrs %{
      name: "some name",
      paragraph1: "some paragraph1",
      paragraph2: "some paragraph2",
      paragraph3: "some paragraph3",
      paragraph4: "some paragraph4",
      paragraph5: "some paragraph5",
      paragraph6: "some paragraph6",
      paragraph7: "some paragraph7",
      paragraph8: "some paragraph8",
      paragraph9: "some paragraph9",
      seqnum: 1
    }

    @update_attrs %{
      name: "some updated name",
      paragraph1: "some updated paragraph1",
      paragraph2: "some updated paragraph2",
      paragraph3: "some updated paragraph3",
      paragraph4: "some updated paragraph4",
      paragraph5: "some updated paragraph5",
      paragraph6: "some updated paragraph6",
      paragraph7: "some updated paragraph7",
      paragraph8: "some updated paragraph8",
      paragraph9: "some updated paragraph9",
      seqnum: 2
    }

    @valid_attrs %{
      name: "some name",
      paragraph1: "some paragraph1",
      paragraph2: "some paragraph2",
      paragraph3: "some paragraph3",
      paragraph4: "some paragraph4",
      paragraph5: "some paragraph5",
      paragraph6: "some paragraph6",
      paragraph7: "some paragraph7",
      paragraph8: "some paragraph8",
      paragraph9: "some paragraph9",
      seqnum: 1
    }

    @invalid_attrs %{
      name: nil,
      paragraph1: nil,
      paragraph2: nil,
      paragraph3: nil,
      paragraph4: nil,
      paragraph5: nil,
      paragraph6: nil,
      paragraph7: nil,
      paragraph8: nil,
      paragraph9: nil,
      seqnum: nil
    }

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
      assert performance.paragraph1 == "some paragraph1"
      assert performance.paragraph2 == "some paragraph2"
      assert performance.paragraph3 == "some paragraph3"
      assert performance.paragraph4 == "some paragraph4"
      assert performance.paragraph5 == "some paragraph5"
      assert performance.paragraph6 == "some paragraph6"
      assert performance.paragraph7 == "some paragraph7"
      assert performance.paragraph8 == "some paragraph8"
      assert performance.paragraph9 == "some paragraph9"
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
      assert performance.paragraph1 == "some updated paragraph1"
      assert performance.paragraph2 == "some updated paragraph2"
      assert performance.paragraph3 == "some updated paragraph3"
      assert performance.paragraph4 == "some updated paragraph4"
      assert performance.paragraph5 == "some updated paragraph5"
      assert performance.paragraph6 == "some updated paragraph6"
      assert performance.paragraph7 == "some updated paragraph7"
      assert performance.paragraph8 == "some updated paragraph8"
      assert performance.paragraph9 == "some updated paragraph9"
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

  describe "workshops" do
    alias Runosaari.Schedule.Workshop

    @valid_attrs %{name: "some name", text: "some text", seqnum: 42}
    @update_attrs %{name: "some updated name", text: "some updated text", seqnum: 43}
    @invalid_attrs %{seqnum: nil, text: nil}

    def workshop_fixture(attrs \\ %{}) do
      {:ok, workshop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_workshop()

      workshop
    end

    test "list_workshops/0 returns all workshops" do
      workshop = workshop_fixture()
      assert Schedule.list_workshops() == [workshop]
    end

    test "get_workshop!/1 returns the workshop with given id" do
      workshop = workshop_fixture()
      assert Schedule.get_workshop!(workshop.id) == workshop
    end

    test "create_workshop/1 with valid data creates a workshop" do
      assert {:ok, %Workshop{} = workshop} = Schedule.create_workshop(@valid_attrs)
      assert workshop.seqnum == 42
      assert workshop.text == "some text"
    end

    test "create_workshop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_workshop(@invalid_attrs)
    end

    test "update_workshop/2 with valid data updates the workshop" do
      workshop = workshop_fixture()
      assert {:ok, %Workshop{} = workshop} = Schedule.update_workshop(workshop, @update_attrs)
      assert workshop.seqnum == 43
      assert workshop.text == "some updated text"
    end

    test "update_workshop/2 with invalid data returns error changeset" do
      workshop = workshop_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_workshop(workshop, @invalid_attrs)
      assert workshop == Schedule.get_workshop!(workshop.id)
    end

    test "delete_workshop/1 deletes the workshop" do
      workshop = workshop_fixture()
      assert {:ok, %Workshop{}} = Schedule.delete_workshop(workshop)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_workshop!(workshop.id) end
    end

    test "change_workshop/1 returns a workshop changeset" do
      workshop = workshop_fixture()
      assert %Ecto.Changeset{} = Schedule.change_workshop(workshop)
    end
  end
end

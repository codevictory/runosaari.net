defmodule Runosaari.RegistrationTest do
  use Runosaari.DataCase

  alias Runosaari.Registration

  describe "performers" do
    alias Runosaari.Registration.Performer

    @valid_attrs %{
      confirmed: true,
      email: "some email",
      fname: "some fname",
      lname: "some lname",
      tel: "some tel",
      desc: "some desc",
      date1: true,
      date2: true,
      date3: true,
      bus: true,
      accom: true,
      seqnum: 1
    }
    @update_attrs %{
      confirmed: false,
      email: "some updated email",
      fname: "some updated fname",
      lname: "some updated lname",
      tel: "some updated tel",
      desc: "some updated desc",
      date1: true,
      date2: true,
      date3: true,
      bus: true,
      accom: true,
      seqnum: 2
    }
    @invalid_attrs %{
      confirmed: nil,
      email: nil,
      fname: nil,
      lname: nil,
      tel: nil,
      desc: nil,
      date1: nil,
      date2: nil,
      date3: nil,
      bus: nil,
      accom: nil,
      seqnum: nil
    }

    def performer_fixture(attrs \\ %{}) do
      {:ok, performer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Registration.create_performer()

      performer
    end

    test "list_performers/0 returns all performers" do
      performer = performer_fixture()
      assert Registration.list_performers() == [performer]
    end

    test "get_performer!/1 returns the performer with given id" do
      performer = performer_fixture()
      assert Registration.get_performer!(performer.id) == performer
    end

    test "create_performer/1 with valid data creates a performer" do
      assert {:ok, %Performer{} = performer} = Registration.create_performer(@valid_attrs)
      assert performer.confirmed == true
      assert performer.email == "some email"
      assert performer.fname == "some fname"
      assert performer.lname == "some lname"
      assert performer.tel == "some tel"
      assert performer.desc == "some desc"
      assert performer.date1 == true
      assert performer.date2 == true
      assert performer.date3 == true
      assert performer.bus == true
      assert performer.accom == true
      assert performer.seqnum == 1
    end

    test "create_performer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registration.create_performer(@invalid_attrs)
    end

    test "update_performer/2 with valid data updates the performer" do
      performer = performer_fixture()

      assert {:ok, %Performer{} = performer} =
               Registration.update_performer(performer, @update_attrs)

      assert performer.confirmed == false
      assert performer.email == "some updated email"
      assert performer.fname == "some updated fname"
      assert performer.lname == "some updated lname"
      assert performer.tel == "some updated tel"
      assert performer.desc == "some updated desc"
      assert performer.date1 == true
      assert performer.date2 == true
      assert performer.date3 == true
      assert performer.bus == true
      assert performer.accom == true
      assert performer.seqnum == 2
    end

    test "update_performer/2 with invalid data returns error changeset" do
      performer = performer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Registration.update_performer(performer, @invalid_attrs)

      assert performer == Registration.get_performer!(performer.id)
    end

    test "delete_performer/1 deletes the performer" do
      performer = performer_fixture()
      assert {:ok, %Performer{}} = Registration.delete_performer(performer)
      assert_raise Ecto.NoResultsError, fn -> Registration.get_performer!(performer.id) end
    end

    test "change_performer/1 returns a performer changeset" do
      performer = performer_fixture()
      assert %Ecto.Changeset{} = Registration.change_performer(performer)
    end
  end
end

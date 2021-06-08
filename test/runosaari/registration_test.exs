defmodule Runosaari.RegistrationTest do
  use Runosaari.DataCase

  alias Runosaari.Registration

  describe "performers" do
    alias Runosaari.Registration.Performer

    @create_attrs %{
      name: "some name",
      paragraph1: "some paragraph 1",
      paragraph2: "some paragraph 2",
      paragraph3: "some paragraph 3",
      paragraph4: "some paragraph 4",
      paragraph5: "some paragraph 5",
      link: "some link",
      photo_path: "some photo path",
      confirmed: false
    }

    @update_attrs %{
      name: "some updated name",
      paragraph1: "some updated paragraph 1",
      paragraph2: "some updated paragraph 2",
      paragraph3: "some updated paragraph 3",
      paragraph4: "some updated paragraph 4",
      paragraph5: "some updated paragraph 5",
      link: "some updated link",
      photo_path: "some updated photo path",
      confirmed: true
    }

    @valid_attrs %{
      name: "some name",
      paragraph1: "some paragraph 1",
      paragraph2: "some paragraph 2",
      paragraph3: "some paragraph 3",
      paragraph4: "some paragraph 4",
      paragraph5: "some paragraph 5",
      link: "some link",
      photo_path: "some photo path",
      confirmed: false
    }

    @invalid_attrs %{
      name: nil,
      paragraph1: nil,
      paragraph2: nil,
      paragraph3: nil,
      paragraph4: nil,
      paragraph5: nil,
      link: nil,
      photo_path: nil,
      confirmed: false
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
      assert performer.name == "some name"
      assert performer.paragraph1 == "some paragraph 1"
      assert performer.paragraph2 == "some paragraph 2"
      assert performer.paragraph3 == "some paragraph 3"
      assert performer.paragraph4 == "some paragraph 4"
      assert performer.paragraph5 == "some paragraph 5"
      assert performer.link == "some link"
      assert performer.photo_path == "some photo path"
      assert performer.confirmed == false
    end

    test "create_performer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registration.create_performer(@invalid_attrs)
    end

    test "update_performer/2 with valid data updates the performer" do
      performer = performer_fixture()

      assert {:ok, %Performer{} = performer} =
               Registration.update_performer(performer, @update_attrs)

      assert performer.name == "some updated name"
      assert performer.paragraph1 == "some updated paragraph 1"
      assert performer.paragraph2 == "some updated paragraph 2"
      assert performer.paragraph3 == "some updated paragraph 3"
      assert performer.paragraph4 == "some updated paragraph 4"
      assert performer.paragraph5 == "some updated paragraph 5"
      assert performer.link == "some updated link"
      assert performer.photo_path == "some updated photo path"
      assert performer.confirmed == true
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

  describe "visitors" do
    alias Runosaari.Registration.Visitor

    @valid_attrs %{
      accom: true,
      shared: true,
      date1: true,
      date2: true,
      date3: true,
      email: "some email",
      fname: "some fname",
      lname: "some lname",
      tel: "some tel"
    }
    @update_attrs %{
      accom: false,
      shared: false,
      date1: false,
      date2: false,
      date3: false,
      email: "some updated email",
      fname: "some updated fname",
      lname: "some updated lname",
      tel: "some updated tel"
    }
    @invalid_attrs %{
      accom: nil,
      shared: nil,
      date1: nil,
      date2: nil,
      date3: nil,
      email: nil,
      fname: nil,
      lname: nil,
      tel: nil
    }

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Registration.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Registration.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Registration.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Registration.create_visitor(@valid_attrs)
      assert visitor.accom == true
      assert visitor.shared == true
      assert visitor.date1 == true
      assert visitor.date2 == true
      assert visitor.date3 == true
      assert visitor.email == "some email"
      assert visitor.fname == "some fname"
      assert visitor.lname == "some lname"
      assert visitor.tel == "some tel"
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Registration.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{} = visitor} = Registration.update_visitor(visitor, @update_attrs)
      assert visitor.accom == false
      assert visitor.shared == false
      assert visitor.date1 == false
      assert visitor.date2 == false
      assert visitor.date3 == false
      assert visitor.email == "some updated email"
      assert visitor.fname == "some updated fname"
      assert visitor.lname == "some updated lname"
      assert visitor.tel == "some updated tel"
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Registration.update_visitor(visitor, @invalid_attrs)
      assert visitor == Registration.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Registration.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Registration.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Registration.change_visitor(visitor)
    end
  end
end

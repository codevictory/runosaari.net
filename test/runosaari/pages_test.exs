defmodule Runosaari.PagesTest do
  use Runosaari.DataCase

  alias Runosaari.Pages

  describe "index_paragraphs" do
    alias Runosaari.Pages.Index

    @valid_attrs %{content: "some content", seqnum: 42}
    @update_attrs %{content: "some updated content", seqnum: 43}
    @invalid_attrs %{content: nil, seqnum: nil}

    def index_fixture(attrs \\ %{}) do
      {:ok, index} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pages.create_index()

      index
    end

    test "list_index_paragraphs/0 returns all index_paragraphs" do
      index = index_fixture()
      assert Pages.list_index_paragraphs() == [index]
    end

    test "get_index!/1 returns the index with given id" do
      index = index_fixture()
      assert Pages.get_index!(index.id) == index
    end

    test "create_index/1 with valid data creates a index" do
      assert {:ok, %Index{} = index} = Pages.create_index(@valid_attrs)
      assert index.content == "some content"
      assert index.seqnum == 42
    end

    test "create_index/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pages.create_index(@invalid_attrs)
    end

    test "update_index/2 with valid data updates the index" do
      index = index_fixture()
      assert {:ok, %Index{} = index} = Pages.update_index(index, @update_attrs)
      assert index.content == "some updated content"
      assert index.seqnum == 43
    end

    test "update_index/2 with invalid data returns error changeset" do
      index = index_fixture()
      assert {:error, %Ecto.Changeset{}} = Pages.update_index(index, @invalid_attrs)
      assert index == Pages.get_index!(index.id)
    end

    test "delete_index/1 deletes the index" do
      index = index_fixture()
      assert {:ok, %Index{}} = Pages.delete_index(index)
      assert_raise Ecto.NoResultsError, fn -> Pages.get_index!(index.id) end
    end

    test "change_index/1 returns a index changeset" do
      index = index_fixture()
      assert %Ecto.Changeset{} = Pages.change_index(index)
    end
  end

  describe "info_paragraphs" do
    alias Runosaari.Pages.Info

    @valid_attrs %{content: "some content", seqnum: 42}
    @update_attrs %{content: "some updated content", seqnum: 43}
    @invalid_attrs %{content: nil, seqnum: nil}

    def info_fixture(attrs \\ %{}) do
      {:ok, info} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pages.create_info()

      info
    end

    test "list_info_paragraphs/0 returns all info_paragraphs" do
      info = info_fixture()
      assert Pages.list_info_paragraphs() == [info]
    end

    test "get_info!/1 returns the info with given id" do
      info = info_fixture()
      assert Pages.get_info!(info.id) == info
    end

    test "create_info/1 with valid data creates a info" do
      assert {:ok, %Info{} = info} = Pages.create_info(@valid_attrs)
      assert info.content == "some content"
      assert info.seqnum == 42
    end

    test "create_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pages.create_info(@invalid_attrs)
    end

    test "update_info/2 with valid data updates the info" do
      info = info_fixture()
      assert {:ok, %Info{} = info} = Pages.update_info(info, @update_attrs)
      assert info.content == "some updated content"
      assert info.seqnum == 43
    end

    test "update_info/2 with invalid data returns error changeset" do
      info = info_fixture()
      assert {:error, %Ecto.Changeset{}} = Pages.update_info(info, @invalid_attrs)
      assert info == Pages.get_info!(info.id)
    end

    test "delete_info/1 deletes the info" do
      info = info_fixture()
      assert {:ok, %Info{}} = Pages.delete_info(info)
      assert_raise Ecto.NoResultsError, fn -> Pages.get_info!(info.id) end
    end

    test "change_info/1 returns a info changeset" do
      info = info_fixture()
      assert %Ecto.Changeset{} = Pages.change_info(info)
    end
  end
end

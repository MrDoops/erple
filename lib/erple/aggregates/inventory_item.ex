defmodule Erple.Aggregates.InventoryItem do
  @moduledoc """
  An item that we are responsible for processing.
  """
  defstruct [
    :id,
    :name,
    :product_id,
    :quantity,
  ]

  alias __MODULE__
  alias Erple.Commands.{
    CreateInventoryItem,
    RenameInventoryItem,
    AddInventoryItems,
    RemoveInventoryItems,
  }
  alias Erple.Events.{
    InventoryItemCreated,
    InventoryItemRenamed,
    InventoryItemsCheckedIn,
    InventoryItemsRemoved,
  }

  def execute() do

  end

  def apply(%InventoryItem{} = item, %InventoryItemCreated{} = created) do
    %InventoryItem{ item |
      id: created.id,
      name: created.name,
      product_id: created.product_id,
      quantity: created.initial_count,
    }
  end

  def apply(%InventoryItem{} = item, %InventoryItemRenamed{} = renamed) do
    %InventoryItem{ item |
      name: renamed.name,
    }
  end

  def apply(%InventoryItem{quantity: quantity} = item, %InventoryItemsCheckedIn{} = checked_in) do
    %InventoryItem{ item |
      quantity: quantity + checked_in.quantity,
    }
  end

  def apply(%InventoryItem{quantity: quantity} = item, %InventoryItemsRemoved{} = removed) do
    %InventoryItem{ item |
      quantity: quantity - removed.quantity,
    }
  end
end

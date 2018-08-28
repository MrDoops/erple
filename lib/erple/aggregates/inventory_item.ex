defmodule Erple.Aggregates.InventoryItem do
  @moduledoc """
  An item that we are responsible for processing.
  """
  defstruct [
    :id,
    :name,
    :product_id,
    :count,
  ]

  alias __MODULE__
  alias Erple.Commands.{
    CreateInventoryItem,
    DeactivateInventoryItem,
    RenameInventoryItem,
    AddInventoryItems,
    RemoveInventoryItems,
  }
  alias Erple.Events.{
    InventoryItemCreated,
    InventoryItemDeactivated,
    InventoryItemRenamed,
    InventoryItemsCheckedIn,
    InventoryItemsRemoved,
  }

  def apply(%__MODULE__{} = item, %InventoryItemCreated{} = created) do
    %__MODULE__{
      id: created.id,
      name: created.name,
      product_id: created.product_id,
      count: created.initial_count,
    }
  end

  def apply(%InventoryItemDeactivated{} = deactivated) do

  end

  def apply(%InventoryItemRenamed{} = renamed) do

  end

  def apply(%InventoryItemsCheckedIn{} = checked_in) do

  end

  def apply(%InventoryItemsRemoved{} = removed) do

  end
end

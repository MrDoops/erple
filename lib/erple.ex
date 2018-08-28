defmodule Erple do
  @moduledoc """
  Erple is a simple event-sourced Enterprise Resource Planning tool.

  These requirements are being derived for a small-medium sized residential Solar Company.
  This should fit the use case of any field-service type business that keeps inventory.

  It makes sense for inventory management solutions to be event-sourced because of the added auditablity.
  Event-sourcing also happens to make applications both scalable and naturally compatible for blockchain integrations.

  ## Current Focuses

    * Warehouse / Repo functionality
      - A repo might be a vehicle or a warehouse.
      - 'Warehouse' might be too strong a word for your use case. So lets keep naming flexible.
    * Repos have many inventory items
      - Transfers of inventory items to another repo
    * Picklists
      - A set of items to be prepared for a specific date, probably for transfer to a vehicle, or consumption.
    * Product/Items
      - Pricing / Price Books?
    * Orders? Purchase Orders?
  """
  alias __MODULE__
  alias Erple.Projections.{
    Product,
    InventoryItem,
    Warehouse,
    Repo,
    Vehicle,
  }
  alias Erple.Commands.{
    CreateProduct,
    AddInventoryItems,
    ActivateProduct,
    DeactivateProduct,
    SchedulePicklist,
    TransferInventory,
  }
  alias Erple.Queries.{
    AvailableInventory,
    ActiveProducts,
    PendingTransfers,
    ScheduledPicklists,
  }
  alias Erple.{Repo, Router}

  def add_product(%{} = attrs) do
    add_product =
      attrs
      |> CreateProduct.new()
      |> CreateProduct.assign_id()

    with :ok <- Router.dispatch(add_product, consistency: :string) do
      get(Product, add_product.id)
    else
      reply -> reply
    end
  end

  defp get(schema, id) do
    case Repo.get(schema, id) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end
end

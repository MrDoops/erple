defmodule Erple.Events.InventoryItemCreated do
  defstruct [
    :id,
    :name,
    :initial_count,
    :product_id,
  ]
end

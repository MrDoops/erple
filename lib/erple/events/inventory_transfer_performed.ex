defmodule Erple.Events.InventoryTransferPerformed do
  defstruct [
    :id,
    :items,
    :from,
    :to,
  ]
end

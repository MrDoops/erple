# Erple

Erple is a simple event-sourced Enterprise Resource Planning tool.

These requirements are being derived for a small-medium sized residential Solar Company.
This should fit the use case of any field-service type business that keeps inventory.
If there's anything domain specific it's for b2b vendor concerns.

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

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `erple` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:erple, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/erple](https://hexdocs.pm/erple).


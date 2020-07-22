defmodule MyAppWeb.FormLive do
  use MyAppWeb, :live_view

  defmodule Customer do
    use Ecto.Schema

    import Ecto.Changeset

    embedded_schema do
      field :name, :string
    end

    def changeset(schema, params \\ %{}) do
      cast(schema, params, [:name])
    end
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, changeset: Customer.changeset(%Customer{}), name: "")}
  end

  @impl true
  def handle_event("validate", %{"customer" => customer_params}, socket) do
    changeset =
      %Customer{}
      |> Customer.changeset(customer_params)
      |> Map.put(:action, :validate)

    customer = Ecto.Changeset.apply_changes(changeset)

    {:noreply, assign(socket, changeset: changeset, name: customer.name)}
  end
end

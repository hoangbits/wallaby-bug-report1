defmodule AppWeb.FeatureCase do
  @moduledoc """
  Reuse wallaby case.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import AppWeb.FeatureCase
      use Wallaby.Feature


      alias AppWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint AppWeb.Endpoint
    end
  end

  setup tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(App.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(App.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)

    {:ok, session: session}
  end
end

# wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, AppWeb.Endpoint.url)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(App.Repo, :manual)

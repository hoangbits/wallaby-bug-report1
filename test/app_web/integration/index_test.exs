defmodule AppWeb.Integration.IndexTest do
  use AppWeb.FeatureCase, async: true

  # it will pass if we use: async: false
  # use AppWeb.FeatureCase, async: false


  #      ** (MatchError) no match of right hand side value: {:already, :allowed}
  # stacktrace:
  # (wallaby 0.29.1) lib/wallaby/feature.ex:174: Wallaby.Feature.Utils.checkout_ecto_repos/2
  # (elixir 1.12.3) lib/enum.ex:1582: Enum."-map/2-lists^map/1-0-"/2
  # (wallaby 0.29.1) lib/wallaby/feature.ex:164: Wallaby.Feature.Utils.maybe_checkout_repos/1
  # test/app_web/integration/index_test.exs:2: AppWeb.Integration.IndexTest.__ex_unit_setup_1/1
  # test/app_web/integration/index_test.exs:1: AppWeb.Integration.IndexTest.__ex_unit__/2


  feature "renders index", %{session: session} do
    session
    |> visit("/")
    |> assert_text("Phoenix")
  end

end

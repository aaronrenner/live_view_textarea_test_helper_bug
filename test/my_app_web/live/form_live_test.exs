defmodule MyAppWeb.FormLiveTest do
  use MyAppWeb.ConnCase

  import Phoenix.LiveViewTest

  test "renders the same data after multiple render change events", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/form")

    assert view
           |> element("form")
           |> render_change(%{"customer" => %{"name" => "Aaron"}}) =~
             ~s|<pre class="result">Aaron</pre>|

    assert view
           |> element("form")
           |> render_change(%{"customer" => %{}}) =~
             ~s|<pre class="result">Aaron</pre>|
  end
end

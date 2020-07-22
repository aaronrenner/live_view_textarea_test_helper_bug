# MyApp

This app recreates an issue with LiveView's test helpers where each time
`render_change` is called, it prepends an additional newline to the beginning of
a textarea's value.

To run the tests and see the failure:

```elixir
$ mix deps.get
$ mix test
```

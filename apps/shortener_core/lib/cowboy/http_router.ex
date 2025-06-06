defmodule Cowboy.HttpRouter do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/:short_url" do
    response = GenServer.call(ShortenerServer, {:redirect, short_url})

    case response do
      :error ->
        send_resp(conn, 404, "Link inexistente")

      long_url ->
        conn
        |> Plug.Conn.resp(:found, "")
        |> Plug.Conn.put_resp_header("location", "#{long_url}")
    end
  end

  post "/encurtar" do
    #GenServer.call(ShortenerServer, {:shorten_url, long_url})
  end

  match _ do
    send_resp(conn, 404, "Oops!")
  end
end

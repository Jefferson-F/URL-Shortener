defmodule Cowboy.HttpRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/:args" do
    conn |> Plug.Conn.resp(:found, "") |> Plug.Conn.put_resp_header("location", "https://google.com")
  end
  match _ do
    send_resp(conn, 404, "Oops!")
  end

end

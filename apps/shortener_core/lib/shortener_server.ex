defmodule ShortenerServer do
  use GenServer
  def init(state) do
    {:ok, state}
  end

  def handle_call(:shorten_url, _from, state) do
    {:reply, :ok, state}

  end

end

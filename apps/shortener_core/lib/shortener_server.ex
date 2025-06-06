defmodule ShortenerServer do
  use GenServer
  alias Shorten.Url
  alias Shorten.Repo

  def init(state) do
    {:ok, state}
  end

  def handle_call(long_url, _from, state) do
    short_url = Nanoid.generate(10)
    _resultado_banco = generate_short_url(short_url, long_url)
    {:reply, :ok, state} # Mudança de estado será adicionado futuramente, estou focado em outras coisas momentaneamente
  end

  def generate_short_url(short_url, long_url) do
    %Url{} |> Url.changeset(%{:id => short_url, :long_url => long_url}) |> Repo.insert()
  end
end

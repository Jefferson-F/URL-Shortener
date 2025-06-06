defmodule ShortenerServer do
  use GenServer
  alias Shorten.Url
  alias Shorten.Repo

  def init(state) do
    {:ok, state}
  end

  def handle_call({:shorten_url, long_url}, _from, state) do
    short_url = Nanoid.generate(10)
    resultado_banco = generate_short_url(short_url, long_url)

    case resultado_banco do
      {:error, _} -> {:reply, :error, state}
      {:ok, _} -> {:reply, :ok, state}
    end

    # Mudança de estado será adicionado futuramente, estou focado em outras coisas momentaneamente
    {:reply, :ok, state}
  end

  def handle_call({:redirect, short_url}, _from, state) do
    Url_response = Repo.get(Url, short_url)

    case Url_response do
      nil -> {:reply, :error, state}
      _ -> {:reply, Url_response.long_url(), state}
    end
  end

  def generate_short_url(short_url, long_url) do
    %Url{} |> Url.changeset(%{:id => short_url, :long_url => long_url}) |> Repo.insert()
  end
end

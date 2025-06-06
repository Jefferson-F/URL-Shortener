defmodule ShortenerCore do
  @moduledoc """
  Documentation for `ShortenerCore`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ShortenerCore.hello()
      :world

  """
  def shorten_url(long_url) do
    short_URL = Nanoid.generate(10)
    {:ok, {OriginalURL, short_URL}}
  end
end

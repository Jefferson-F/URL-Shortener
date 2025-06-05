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
  def shorten_url(OriginalURL) do
    short_URL = Nanoid.generate(10)
    {:ok, {OriginalURL, short_URL}}
  end

end

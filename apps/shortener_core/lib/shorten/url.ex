defmodule Shorten.Url do
  use Ecto.Schema
  @primary_key {:id, :string, autogenerate: false}
  schema "shorturls" do
    field :long_url, :string
  end

end

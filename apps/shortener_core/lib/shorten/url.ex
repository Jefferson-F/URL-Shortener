defmodule Shorten.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
  schema "shorturls" do
    field(:long_url, :string)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:long_url])
    |> validate_required([:long_url])
    |> validate_long_url_format()
  end

  defp validate_long_url_format(changeset) do
    uri = Ecto.Changeset.get_field(changeset, :long_url)

    case uri do
      nil ->
        changeset

      _ ->
        long_url = URI.parse(uri)
        scheme_valid = validate_scheme_url(long_url)
        host_valid = validate_host_url(long_url)

        case {scheme_valid, host_valid} do
          {{:ok, :scheme}, {:ok, :host}} ->
            changeset

          {{:error, message}, {:error, message}} ->
            Ecto.Changeset.add_error(changeset, :long_url, message)

          {{:error, message}, {:ok, :host}} ->
            Ecto.Changeset.add_error(changeset, :long_url, message)

          {{:ok, :scheme}, {:error, message}} ->
            Ecto.Changeset.add_error(changeset, :long_url, message)
        end
    end
  end

  defp validate_scheme_url(long_url) when long_url.scheme != nil do
    {:ok, :scheme}
  end

  defp validate_scheme_url(long_url) when long_url.scheme == nil do
    {:error, "URL inválida"}
  end

  defp validate_host_url(long_url) when long_url.host != nil do
    {:ok, :host}
  end

  defp validate_host_url(long_url) when long_url.host == nil do
    {:error, "URL inválida"}
  end
end

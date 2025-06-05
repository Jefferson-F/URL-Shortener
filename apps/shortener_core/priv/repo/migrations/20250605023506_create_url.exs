defmodule Shorten.Repo.Migrations.CreateUrl do
  use Ecto.Migration

  def change do
    create table(:short_urls, primary_key: false) do
      add :id, :string, primary_key: true, size: 10
      add :long_url, :string
    end

  end
end

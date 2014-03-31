class AddSlugs < ActiveRecord::Migration
  def change
    add_column :organisations, :slug, :string
    add_column :places, :slug, :string
    add_column :premises, :slug, :string

    add_index :organisations, :slug, unique: true
    add_index :places, :slug
    add_index :premises, :slug
  end
end

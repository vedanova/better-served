class AddUuidToPlace < ActiveRecord::Migration
  def change
    add_column :places, :uuid, :string
  end
end

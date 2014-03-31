class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :uuid
      t.references :place, index: true

      t.timestamps
    end
    add_index :items, :uuid
  end
  add_foreign_key(:items, :place)
end


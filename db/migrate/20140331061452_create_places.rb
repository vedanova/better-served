class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.references :premise, index: true

      t.timestamps
    end
    add_foreign_key(:places, :premises)
  end
end

class CreatePremises < ActiveRecord::Migration
  def change
    create_table :premises do |t|
      t.references :organisation, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
    add_foreign_key(:premises, :organisations)
  end
end

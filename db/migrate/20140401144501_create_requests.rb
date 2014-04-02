class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :item, index: true
      t.string :type
      t.text :content
      t.string :subject
      t.string :email
      t.string :phone

      t.timestamps
    end
    add_foreign_key :requests, :items
  end
end

class AddQrDataUrlToItems < ActiveRecord::Migration
  def change
    add_column :items, :qr_data_url, :text
  end
end

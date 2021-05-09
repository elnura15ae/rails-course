class CreateCartsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :carts_items do |t|
      
      t.timestamps
    end
  end
end

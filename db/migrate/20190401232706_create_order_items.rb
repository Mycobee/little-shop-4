class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :order_price
      t.integer :quantity
      t.boolean :fulfilled

      t.timestamps
    end
  end
end

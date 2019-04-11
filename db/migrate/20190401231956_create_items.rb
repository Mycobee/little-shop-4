class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image_url, default: "https://emblemsbf.com/img/77148.jpg"
      t.integer :quantity, default: 0
      t.float :base_price
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end

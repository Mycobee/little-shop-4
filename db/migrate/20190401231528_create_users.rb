class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :role, default: 0
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end

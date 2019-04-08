require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Relationship" do
    it {should have_many :items}
    it {should have_many :orders}
    #verify that users don't need items through order_items
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
  end
  describe 'Instance Methods' do
    it '.orders should return all order in which a merchant has an associated item' do
      merchant = create(:merchant)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(merchant)

      item_1 = Item.create(name: "Snickers", description: "Chocolate and caramel", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 12, base_price: 1.99, enabled: true )
      item_2 = Item.create(name: "Chips", description: "Crunchy and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 20, base_price: 2.99, enabled: true )
      item_3 = Item.create(name: "Pretzels", description: "Salty and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 5, base_price: 1.99, enabled: true )

      item_4 = Item.create(name: "Snickers", description: "Chocolate and caramel", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 12, base_price: 1.99, enabled: true )
      item_5 = Item.create(name: "Chips", description: "Crunchy and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 20, base_price: 2.99, enabled: true )
      item_6 = Item.create(name: "Pretzels", description: "Salty and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 5, base_price: 1.99, enabled: true )

      merchant.items << [item_1, item_2, item_3, item_4, item_5, item_6]

      user = create(:user)

      order_1 = Order.create(status: "pending", user: user)
      order_2 = Order.create(status: "pending", user: user)

      order_item_1 = OrderItem.create(order: order_1, item: item_1, quantity: 3, price: item_1.base_price)
      order_item_2 = OrderItem.create(order: order_1, item: item_2, quantity: 4, price: item_2.base_price)
      order_item_3 = OrderItem.create(order: order_1, item: item_3, quantity: 5, price: item_3.base_price)

      order_item_4 = OrderItem.create(order: order_2, item: item_4, quantity: 5, price: item_4.base_price)
      order_item_5 = OrderItem.create(order: order_2, item: item_5, quantity: 5, price: item_5.base_price)
      order_item_6 = OrderItem.create(order: order_2, item: item_6, quantity: 5, price: item_6.base_price)

      expect(merchant.orders).to eq([order_1, order_2])
      expect(order_1.total_items).to eq(12)
      expect(order_1.total_value).to eq(27.88)
      expect(order_2.total_items).to eq(15)
      expect(order_2.total_value).to eq(34.85)
    end
  end
end

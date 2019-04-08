require 'rails_helper'


RSpec.describe Item, type: :model do
  describe "Relationship" do
    it {should have_many :order_items}
    it {should have_many(:orders).through :order_items}
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :image_url}
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :base_price}
  end

  describe "Instance Methods" do
    
    it '.merchant_name' do
      merchant = User.create!(id: 1, name: 'bob', email: 'bob@bob', address: 'this is it', city: 'jackson', state: 'MS', zip_code: 39211, password: 'password', role: 1)
      item = merchant.items.create!(name: "thing1", description: "do a thing", image_url: "https://picsum.photos/200/300?image=1", base_price: 3.50, quantity: 8)
      
      expect(item.merchant_name).to eq(merchant.name)
    end
  end
end

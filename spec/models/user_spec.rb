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
    it '#item_disable' do
     new_merchant = create(:merchant)
     item_1 = create(:item)
     item_2 = create(:item)
     item_3 = create(:item)
     new_merchant.items << [item_1, item_2, item_3]
     new_merchant.item_disable 

     item_1.reload
     item_2.reload
     item_3.reload

     expect(item_1.enabled).to eq(false)
     expect(item_2.enabled).to eq(false)
     expect(item_3.enabled).to eq(false)
    end
  end
end

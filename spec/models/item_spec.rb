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

    it ".avg_f_time" do
      @user = create(:user)
      @merch_1 = create(:user, role: "merchant")
      @item_1 = @merch_1.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @order_1 = create(:order, status: "shipped_order", user: @user)
      @order_2 = create(:order, status: "shipped_order", user: @user)
      @order_3 = create(:order, status: "shipped_order", user: @user)
      @order_4 = create(:order, status: "shipped_order", user: @user)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 5.days.ago, updated_at: 30.minutes.ago)
      @order_item_2 = create(:order_item, order: @order_2, item: @item_1, fulfilled: true, created_at: 2.hour.ago, updated_at: 45.minutes.ago)
      @order_item_3 = create(:order_item, order: @order_3, item: @item_1,  fulfilled: true, created_at: 3.hour.ago, updated_at: 15.minutes.ago)
      @order_item_4 = create(:order_item, order: @order_4, item: @item_1,  fulfilled: true, created_at: 14.hour.ago, updated_at: 25.minutes.ago)

      expect(@item_1.avg_f_time).to include("1 day 10:16")
    end
  end
end

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
    it {should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0)}
    it {should validate_numericality_of(:base_price).is_greater_than_or_equal_to(0.00)}
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
      @order_1 = create(:shipped_order, user: @user)
      @order_2 = create(:shipped_order, user: @user)
      @order_3 = create(:shipped_order, user: @user)
      @order_4 = create(:shipped_order, user: @user)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 5.days.ago, updated_at: 30.minutes.ago)
      @order_item_2 = create(:order_item, order: @order_2, item: @item_1, fulfilled: true, created_at: 2.hour.ago, updated_at: 45.minutes.ago)
      @order_item_3 = create(:order_item, order: @order_3, item: @item_1,  fulfilled: true, created_at: 3.hour.ago, updated_at: 15.minutes.ago)
      @order_item_4 = create(:order_item, order: @order_4, item: @item_1,  fulfilled: true, created_at: 14.hour.ago, updated_at: 25.minutes.ago)

      expect(@item_1.avg_f_time).to include("1 day 10:16")
    end

    it ".fulfilled?" do
      @user = create(:user)
      @merch = create(:user, role: "merchant")
      @item_1 = @merch.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @item_3 = @merch.items.create(name:"Item 3", description: "cool", quantity: 50, base_price: 3.0 )
      @item_2 = @merch.items.create(name:"Item 2", description: "get lost", quantity: 0, base_price: 3.0, enabled: false  )
      @order_1 = create(:shipped_order, user: @user)
      @order_2 = create(:shipped_order, user: @user)
      @order_3 = create(:shipped_order, user: @user)
      @order_4 = create(:shipped_order, user: @user)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 1.hour.ago, updated_at: 30.minutes.ago)

      expect(@item_1.fulfilled?).to eq(true)
      expect(@item_2.fulfilled?).to eq(false)
    end
    xit ".top_five" do
      user = create(:user)
      merchant = create(:merchant)
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)
      item_4 = create(:item)
      item_5 = create(:item)
      item_6 = create(:item)
      item_7 = create(:item)
      item_8 = create(:item)
      item_9 = create(:item)
      item_10 = create(:item)
      item_11 = create(:item)
      item_12 = create(:item)
      item_13 = create(:item)
      item_14 = create(:item)
      item_15 = create(:item)

      merchant.items << [item_1, item_2, item_3, item_4, item_5, item_6, item_7, item_8, item_9, item_10, item_11, item_12, item_13, item_14, item_15]

      expect(@items.top_five).to eq("baluga whale")
    end
  end
end
# As any kind of user on the system
# When I visit the items index page ("/items")
# I see an area with statistics:
# - the top 5 most popular items by quantity purchased, plus the quantity bought
# - the bottom 5 least popular items, plus the quantity bought
#
# "Popularity" is determined by total quantity of that item fulfilled

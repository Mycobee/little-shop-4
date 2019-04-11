require 'rails_helper'


RSpec.describe Item, type: :model do
  describe "Relationship" do
    it {should have_many :order_items}
    it {should have_many(:orders).through :order_items}
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
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
    it ".top_five" do
          merchant = create(:merchant)

          item_1 = create(:item, user: merchant, quantity: 100, name: "item 1")
          item_2 = create(:item, user: merchant, quantity: 100, name: "item 2")
          item_3 = create(:item, user: merchant, quantity: 100, name: "item 3")
          item_4 = create(:item, user: merchant, quantity: 100, name: "item 4")
          item_5 = create(:item, user: merchant, quantity: 100, name: "item 5")
          item_6 = create(:item, user: merchant, quantity: 100, name: "item 6")
          item_7 = create(:item, user: merchant, quantity: 100, name: "item 7")
          item_8 = create(:item, user: merchant, quantity: 100, name: "item 8")
          item_9 = create(:item, user: merchant, quantity: 100, name: "item 9")
          item_10 = create(:item, user: merchant, quantity: 100, name: "item 10")
          item_11 = create(:item, user: merchant, quantity: 100, name: "item 11")
          item_12 = create(:item, user: merchant, quantity: 100, name: "item 12")
          item_13 = create(:item, user: merchant, quantity: 100, name: "item 13")
          item_14 = create(:item, user: merchant, quantity: 100, name: "item 14")
          item_15 = create(:item, user: merchant, quantity: 100, name: "item 15")

          user = create(:user)
          order_1 = create(:order, user: user)

          unfulfilled_order_item = create(:order_item, order: order_1, item: item_6, quantity: 30)
          fulfilled_order_item_1 = create(:fulfilled_order_item, order: order_1, item: item_5, quantity: 1)
          fulfilled_order_item_2 = create(:fulfilled_order_item, order: order_1, item: item_8, quantity: 2)
          fulfilled_order_item_3 = create(:fulfilled_order_item, order: order_1, item: item_11, quantity: 3)
          fulfilled_order_item_4 = create(:fulfilled_order_item, order: order_1, item: item_2, quantity: 4)
          fulfilled_order_item_5 = create(:fulfilled_order_item, order: order_1, item: item_7, quantity: 5)
          fulfilled_order_item_6 = create(:fulfilled_order_item, order: order_1, item: item_10, quantity: 6)
          fulfilled_order_item_7 = create(:fulfilled_order_item, order: order_1, item: item_4, quantity: 7)
          fulfilled_order_item_8 = create(:fulfilled_order_item, order: order_1, item: item_6, quantity: 8)
          fulfilled_order_item_9 = create(:fulfilled_order_item, order: order_1, item: item_12, quantity: 9)
          fulfilled_order_item_10 = create(:fulfilled_order_item, order: order_1, item: item_15, quantity: 10)
          fulfilled_order_item_11 = create(:fulfilled_order_item, order: order_1, item: item_13, quantity: 11)
          fulfilled_order_item_12 = create(:fulfilled_order_item, order: order_1, item: item_3, quantity: 12)
          fulfilled_order_item_13 = create(:fulfilled_order_item, order: order_1, item: item_14, quantity: 13)
          fulfilled_order_item_14 = create(:fulfilled_order_item, order: order_1, item: item_9, quantity: 14)
          fulfilled_order_item_15 = create(:fulfilled_order_item, order: order_1, item: item_1, quantity: 15)
          fulfilled_order_item_15 = create(:fulfilled_order_item, order: order_1, item: item_1, quantity: 15)

          @top = [item_1, item_9, item_14, item_3, item_13]
          @bottom = [item_5, item_8, item_11, item_2, item_7]

      expect(Item.top_five).to eq(@top)
      expect(Item.bottom_five).to eq(@bottom)
    end
    it ".quantity_bought" do
      merchant = create(:merchant)

      item_1 = create(:item, user: merchant, quantity: 100, name: "item 1")
      item_2 = create(:item, user: merchant, quantity: 100, name: "item 2")
      item_3 = create(:item, user: merchant, quantity: 100, name: "item 3")
      item_4 = create(:item, user: merchant, quantity: 100, name: "item 4")
      item_5 = create(:item, user: merchant, quantity: 100, name: "item 5")
      item_6 = create(:item, user: merchant, quantity: 100, name: "item 6")
      item_7 = create(:item, user: merchant, quantity: 100, name: "item 7")
      item_8 = create(:item, user: merchant, quantity: 100, name: "item 8")
      item_9 = create(:item, user: merchant, quantity: 100, name: "item 9")
      item_10 = create(:item, user: merchant, quantity: 100, name: "item 10")
      item_11 = create(:item, user: merchant, quantity: 100, name: "item 11")
      item_12 = create(:item, user: merchant, quantity: 100, name: "item 12")
      item_13 = create(:item, user: merchant, quantity: 100, name: "item 13")
      item_14 = create(:item, user: merchant, quantity: 100, name: "item 14")
      item_15 = create(:item, user: merchant, quantity: 100, name: "item 15")

      user = create(:user)
      order_1 = create(:order, user: user)
      order_2 = create(:order, user: user)

      unfulfilled_order_item = create(:order_item, order: order_1, item: item_6, quantity: 30)
      fulfilled_order_item_1 = create(:fulfilled_order_item, order: order_1, item: item_5, quantity: 1)
      fulfilled_order_item_2 = create(:fulfilled_order_item, order: order_1, item: item_8, quantity: 2)
      fulfilled_order_item_3 = create(:fulfilled_order_item, order: order_1, item: item_11, quantity: 3)
      fulfilled_order_item_4 = create(:fulfilled_order_item, order: order_1, item: item_2, quantity: 4)
      fulfilled_order_item_5 = create(:fulfilled_order_item, order: order_1, item: item_7, quantity: 5)
      fulfilled_order_item_6 = create(:fulfilled_order_item, order: order_1, item: item_10, quantity: 6)
      fulfilled_order_item_7 = create(:fulfilled_order_item, order: order_1, item: item_4, quantity: 7)
      fulfilled_order_item_8 = create(:fulfilled_order_item, order: order_1, item: item_6, quantity: 8)
      fulfilled_order_item_9 = create(:fulfilled_order_item, order: order_1, item: item_12, quantity: 9)
      fulfilled_order_item_10 = create(:fulfilled_order_item, order: order_1, item: item_15, quantity: 10)
      fulfilled_order_item_11 = create(:fulfilled_order_item, order: order_1, item: item_13, quantity: 11)
      fulfilled_order_item_12 = create(:fulfilled_order_item, order: order_1, item: item_3, quantity: 12)
      fulfilled_order_item_13 = create(:fulfilled_order_item, order: order_1, item: item_14, quantity: 13)
      fulfilled_order_item_14 = create(:fulfilled_order_item, order: order_1, item: item_9, quantity: 14)
      fulfilled_order_item_15 = create(:fulfilled_order_item, order: order_1, item: item_1, quantity: 15)
      fulfilled_order_item_16 = create(:fulfilled_order_item, order: order_2, item: item_1, quantity: 10)

      @top = [item_1, item_9, item_14, item_3, item_13]
      @bottom = [item_5, item_8, item_11, item_2, item_7]

      expect(item_1.quantity_bought).to eq(25)
      expect(item_9.quantity_bought).to eq(14)
      expect(item_14.quantity_bought).to eq(13)
      expect(item_3.quantity_bought).to eq(12)
      expect(item_13.quantity_bought).to eq(11)
      expect(item_5.quantity_bought).to eq(1)
      expect(item_8.quantity_bought).to eq(2)
      expect(item_11.quantity_bought).to eq(3)
      expect(item_2.quantity_bought).to eq(4)
      expect(item_7.quantity_bought).to eq(5)
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

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when visit items" do
    before :each do
      @merch_1 = create(:user, role: "merchant")
      @merch_2 = create(:user, role: "merchant")
      @merch_3 = create(:user, role: "merchant")
      @merch_4 = create(:user, role: "merchant")
      @item_1 = @merch_1.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @item_2 = @merch_2.items.create(name:"Item 2", description: "wow", quantity: 23, base_price: 35.50 )
      @item_3 = @merch_1.items.create(name:"Item 3", description: "fooly", quantity: 10, base_price: 3.65 )
      @item_4 = @merch_3.items.create(name:"Item 4", description: "no way", quantity: 70, base_price: 5000.0, enabled: false )
      @item_5 = @merch_3.items.create(name:"Item 5", description: "expensive", quantity: 40, base_price: 456.0 )
      @item_6 = @merch_1.items.create(name:"Item 6", description: "cheap", quantity: 5, base_price: "$1.0" )
      @item_7 = @merch_1.items.create(name:"Item 7", description: "get lost", quantity: 0, base_price: 3.0, enabled: false  )
      @item_8 = @merch_4.items.create(name:"Item 8", description: "could do better", quantity: 490, base_price: 45.0 )
      visit root_path

      click_link "Items"
    end

    it "should see all items and info" do
      expect(current_path).to eq(items_path)
      expect(page).to have_content("Items Catalogue")
      expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_link(@item_1.name)
      expect(page).to have_content(@item_1.user.name)
      expect(page).to have_content(@item_1.quantity)
      expect(page).to have_content(@item_1.base_price)

      expect(page).to have_link(@item_2.name)
      expect(page).to have_css("img[src*='#{@item_2.image_url}']")
      expect(page).to have_content(@item_2.user.name)
      expect(page).to have_content(@item_2.quantity)
      expect(page).to have_content(@item_2.base_price)

      expect(page).to have_link(@item_3.name)
      expect(page).to have_css("img[src*='#{@item_3.image_url}']")
      expect(page).to have_content(@item_3.user.name)
      expect(page).to have_content(@item_3.quantity)
      expect(page).to have_content(@item_3.base_price)

      expect(page).to have_link(@item_5.name)
      expect(page).to have_css("img[src*='#{@item_5.image_url}']")
      expect(page).to have_content(@item_5.user.name)
      expect(page).to have_content(@item_5.quantity)
      expect(page).to have_content(@item_5.base_price)

      expect(page).to have_link(@item_6.name)
      expect(page).to have_css("img[src*='#{@item_6.image_url}']")
      expect(page).to have_content(@item_6.user.name)
      expect(page).to have_content(@item_6.quantity)
      expect(page).to have_content(@item_6.base_price)

      expect(page).to have_link(@item_8.name)
      expect(page).to have_css("img[src*='#{@item_8.image_url}']")
      expect(page).to have_content(@item_8.user.name)
      expect(page).to have_content(@item_8.quantity)
      expect(page).to have_content(@item_8.base_price)
    end

    it "should not show items that are disabled" do

      expect(page).to_not have_content(@item_4.name)
      expect(page).to_not have_content(@item_7.name)
    end

    it "should have image link to item show page" do

      find(".image#{@item_1.id}").click

      expect(current_path).to eq(item_path(@item_1))

      visit items_path

      find(".image#{@item_2.id}").click

      expect(current_path).to eq(item_path(@item_2))
    end
  end
  describe 'When I visit items index page' do
    it "There is an area for statistics, 5 most popular and 5 least popular" do
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


      visit items_path

      within(".top-five-#{item_1.id}") do
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(fulfilled_order_item_15.quantity + fulfilled_order_item_16.quantity)
      end
      within(".top-five-#{item_9.id}") do
      expect(page).to have_content(item_9.name)
      expect(page).to have_content(fulfilled_order_item_14.quantity)
      end
      within(".top-five-#{item_14.id}") do
      expect(page).to have_content(item_14.name)
      expect(page).to have_content(fulfilled_order_item_13.quantity)
      end
      within(".top-five-#{item_3.id}") do
      expect(page).to have_content(item_3.name)
      expect(page).to have_content(fulfilled_order_item_12.quantity)
      end
      within(".top-five-#{item_13.id}") do
      expect(page).to have_content(item_13.name)
      expect(page).to have_content(fulfilled_order_item_11.quantity)
      end

  save_and_open_page

      within(".bottom-five-#{item_5.id}") do
      expect(page).to have_content(item_5.name)
      expect(page).to have_content(fulfilled_order_item_1.quantity)
      end
      within(".bottom-five-#{item_8.id}") do
      expect(page).to have_content(item_8.name)
      expect(page).to have_content(fulfilled_order_item_2.quantity)
      end
      within(".bottom-five-#{item_11.id}") do
      expect(page).to have_content(item_11.name)
      expect(page).to have_content(fulfilled_order_item_3.quantity)
      end
      within(".bottom-five-#{item_2.id}") do
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(fulfilled_order_item_4.quantity)
      end
      within(".bottom-five-#{item_7.id}") do
      expect(page).to have_content(item_7.name)
      expect(page).to have_content(fulfilled_order_item_5.quantity)
      end
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

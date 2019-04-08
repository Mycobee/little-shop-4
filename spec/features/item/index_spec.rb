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
end

require 'rails_helper'

RSpec.describe 'Merchant Item index page' do
  describe 'when I visit items page as a merchant' do
    before :each do
      @user = create(:user)
      @merch = create(:user, role: "merchant")
      @item_1 = @merch.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @item_2 = @merch.items.create(name:"Item 2", description: "get lost", quantity: 0, base_price: 3.0, enabled: false  )
      @order_1 = create(:order, status: "shipped_order", user: @user)
      @order_2 = create(:order, status: "shipped_order", user: @user)
      @order_3 = create(:order, status: "shipped_order", user: @user)
      @order_4 = create(:order, status: "shipped_order", user: @user)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 1.hour.ago, updated_at: 30.minutes.ago)
      @order_item_2 = create(:order_item, order: @order_2, item: @item_1, fulfilled: true, created_at: 2.hour.ago, updated_at: 45.minutes.ago)

      visit login_path

      fill_in "Email", with: @merch.email
      fill_in "Password", with: @merch.password

      click_button "Log In"

      click_link "Merchant Items Page"
    end

    it "should see items index page" do

      expect(current_path).to eq(dashboard_items_path)
      expect(page).to have_link("Add Item")

      within ".item#{@item_1.id}" do
        expect(page).to have_content(@item_1.id)
        expect(page).to have_content(@item_1.name)
        expect(page).to have_css("img[src*='#{@item_1.image_url}']")
        expect(page).to have_content(@item_1.quantity)
        expect(page).to have_content(@item_1.base_price)
        expect(page).to have_button("Edit")
      end

      within ".item#{@item_2.id}" do
        expect(page).to have_content(@item_2.id)
        expect(page).to have_content(@item_2.name)
        expect(page).to have_css("img[src*='#{@item_2.image_url}']")
        expect(page).to have_content(@item_2.quantity)
        expect(page).to have_content(@item_2.base_price)
        expect(page).to have_button("Edit")
      end
    end

    it "should have a disable button if enabled" do
      within ".item#{@item_1.id}" do
        expect(page).to have_button("Disable")
      end
    end

    it "should have a Enable button if enabled" do
      within ".item#{@item_2.id}" do
        expect(page).to have_button("Enable")
      end
    end

    it "should have a delete button if never been ordered" do
      within ".item#{@item_2.id}" do
        expect(page).to have_content("Delete Item")
      end

      within ".item#{@item_1.id}" do
        expect(page).to_not have_content("Delete Item")
      end
    end
  end
end

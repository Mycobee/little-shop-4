require 'rails_helper'

RSpec.describe 'Merchant Item index page' do
  describe 'when I visit items page as a merchant' do
    before :each do

      @merch = create(:user, role: "merchant")
      @item_1 = @merch.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @item_2 = @merch.items.create(name:"Item 3", description: "fooly", quantity: 10, base_price: 3.65 )
      @item_3 = @merch.items.create(name:"Item 6", description: "cheap", quantity: 5, base_price: "$1.0" )
      @item_7 = @merch.items.create(name:"Item 7", description: "get lost", quantity: 0, base_price: 3.0, enabled: false  )

      visit login_path

      fill_in "Email", with: @merch.email
      fill_in "Password", with: @merch.password

      click_button "Log In"

      click_link "Merchant Items Page"
    end

    it "should see items index page" do
      save_and_open_page
      expect(current_path).to eq(dashboard_items)
      expect(page).to have_link("Add item")
      expect(page).to have_content(@item_1.id)
      expect(page).to have_content(@item_1.name)
        expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_content(@item_1.quantity)
      expect(page).to have_content(@item_1.base_price)
    end
  end
end

require 'rails_helper'

RSpec.describe "Add new item" do
  describe 'as a merchant' do
    it "I click on the link to add a new item and see a form" do
      @merchant = create(:merchant)
      @item_1 = @merchant.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@merchant)

      visit dashboard_items_path

      click_link "Add Item"

      expect(current_path).to eq(new_dashboard_item_path)

      fill_in "Name", with: "PS4"
      fill_in "Description", with: "Gaming System"
      fill_in "Base price", with: 3.55
      fill_in "Quantity", with: 25

      click_on 'Create Item'
      
      expect(current_path).to eq(dashboard_items_path)
      expect(page).to have_content("PS4 was created")
    end
  end
end

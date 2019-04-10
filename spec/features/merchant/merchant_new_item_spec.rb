require 'rails_helper'

RSpec.describe "Add new item" do
  describe 'as a merchant' do
    it "I click on the link to add a new item and see a form" do
      @merchant = create(:merchant)

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
      # save_and_open_page
      expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_content("PS4")
      expect(page).to have_content("Gaming System")
      expect(page).to have_content("$3.55")
      expect(page).to have_content(25)
    end
  end
end

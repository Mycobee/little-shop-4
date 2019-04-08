require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit my cart' do

    it 'tells me to visit register or login to checkout' do
      item_1 = create(:item, base_price: 10)
      item_2 = create(:item, base_price: 10)
      item_3 = create(:item, base_price: 10)

      visit items_path

      within "##{item_1.id}" do
          click_button "Add to Cart"
      end

      within "##{item_2.id}" do
          click_button "Add to Cart"
      end

      within "##{item_3.id}" do
          click_button "Add to Cart"
      end

      visit items_path

      expect(page).to have_content("You must register or login to finish checking out.")
    end
  end
end

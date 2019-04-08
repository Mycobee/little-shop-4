require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when visit item show page" do
    before :each do
      @merch_1 = create(:user, role: "merchant", id: 1)
      @item_1 = @merch_1.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @order = create(:order)
      @order_item = create(:order_item, created_at: 1.hour.ago, updated_at: 30.mins.ago)

      
      binding.pry

      visit item_path(@item_1)
    end

    it "should display itme info" do
      binding.pry
      expect(page).to have_content("#{@item_1.name}")
      expect(page).to have_content("#{@item_1.description}")
      expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_content("#{@item_1.merchant.name}")
      expect(page).to have_content("#{@merch_1.name}")
      expect(page).to have_content("#{@merch_1.name}")
    end
  end
end

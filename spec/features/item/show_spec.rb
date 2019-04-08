require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when visit item show page" do
    before :each do
      @user = create(:user)
      @merch_1 = create(:user, role: "merchant")
      @item_1 = @merch_1.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @order_1 = create(:shipped_order, user: @user)
      @order_2 = create(:shipped_order, user: @user)
      @order_3 = create(:shipped_order, user: @user)
      @order_4 = create(:shipped_order, user: @user)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 1.hour.ago, updated_at: 30.minutes.ago)
      @order_item_2 = create(:order_item, order: @order_2, item: @item_1, fulfilled: true, created_at: 2.hour.ago, updated_at: 45.minutes.ago)
      @order_item_3 = create(:order_item, order: @order_3, item: @item_1,  fulfilled: true, created_at: 3.hour.ago, updated_at: 15.minutes.ago)
      @order_item_4 = create(:order_item, order: @order_4, item: @item_1,  fulfilled: true, created_at: 14.hour.ago, updated_at: 25.minutes.ago)

      visit item_path(@item_1)
    end

    it "should display item info" do

      expect(page).to have_content("#{@item_1.name}")
      expect(page).to have_content("Description: #{@item_1.description}")
      expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_content("Merchant: #{@item_1.merchant_name}")
      expect(page).to have_content("Amount: #{@item_1.quantity}")
      expect(page).to have_content("Price: $#{@item_1.base_price}")
      expect(page).to have_content("Average Fulfillment Time: #{@item_1.avg_f_time}")
      expect(page).to have_button("Add to Cart")
    end
  end
end

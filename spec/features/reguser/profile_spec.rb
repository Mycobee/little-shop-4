require 'rails_helper'


RSpec.describe 'As a registered user' do
  describe 'when I visit my profile page' do
    it 'I see all of my personal data on the page except password' do

      user = create(:user)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_content(user.name)
      expect(page).to have_content("Address: #{user.address}")
      expect(page).to have_content("City: #{user.city}")
      expect(page).to have_content("State: #{user.state}")
      expect(page).to have_content("Zip Code: #{user.zip_code}")
      expect(page).to have_content("Email: #{user.email}")
      expect(page).to have_link("Edit Profile")
    end

    xit 'After orders are placed, I a see a link on my profile page called My Orders' do
      @user = create(:user)
      @merchant = create(:merchant)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@user)

      @merch_1 = create(:merchant)
      @item_1 = @merch_1.items.create(name:"Item 1", description: "cool", quantity: 50, base_price: 3.0 )
      @order_1 = create(:order, status: :shipped)
      @order_2 = create(:order, status: :shipped)
      @order_3 = create(:order, status: :shipped)
      @order_4 = create(:order, status: :shipped)

      @order_item_1 = create(:order_item, order: @order_1, item: @item_1, fulfilled: true, created_at: 1.hour.ago, updated_at: 30.minutes.ago)
      @order_item_2 = create(:order_item, order: @order_2, item: @item_1, fulfilled: true, created_at: 2.hour.ago, updated_at: 45.minutes.ago)
      @order_item_3 = create(:order_item, order: @order_3, item: @item_1,  fulfilled: true, created_at: 3.hour.ago, updated_at: 15.minutes.ago)
      @order_item_4 = create(:order_item, order: @order_4, item: @item_1,  fulfilled: true, created_at: 14.hour.ago, updated_at: 25.minutes.ago)

      @user.orders << [@order_1, @order_2, @order_3, @order_4]

      visit profile_path

      expect(page).to have_link("My Orders")

      click_link "My Orders"

      expect(current_path).to eq('/profile/orders')

      visit profile_orders_path

      expect(page).to have_content("My Orders")
    end
  end
end

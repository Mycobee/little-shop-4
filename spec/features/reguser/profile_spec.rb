require 'rails_helper'


RSpec.describe 'As a registered user' do
  describe 'when I visit my profile page' do
    it 'I see all of my personal data on the page except password' do

      @user = create(:user)
      @merchant = create(:merchant)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@user)

      visit profile_path

      expect(page).to have_content(@user.name)
      expect(page).to have_content("Address: #{@user.address}")
      expect(page).to have_content("City: #{@user.city}")
      expect(page).to have_content("State: #{@user.state}")
      expect(page).to have_content("Zip Code: #{@user.zip_code}")
      expect(page).to have_content("Email: #{@user.email}")
      expect(page).to have_link("Edit Profile")
    end
  end
  describe "When I visit my profile orders page /profile/orders" do
    describe "I see every order i've made" do
      it "Including order id, date created, date updated, status, item quantity, total items" do

        reg_user = create(:user)

        allow_any_instance_of(ApplicationController).to \
        receive(:current_user).and_return(reg_user)

        order_1 = create(:order, user: reg_user)
          item_1 = create(:item)
            order_item_1 = create(:order_item, order: order_1, item: item_1)
          item_2 = create(:item)
            order_item_2 = create(:order_item, order: order_1, item: item_2)
          item_3 = create(:item)
            order_item_3 = create(:order_item, order: order_1, item: item_3)

        order_2 = create(:packaged_order, user: reg_user)
          item_4 = create(:item)
            order_item_4 = create(:order_item, order: order_2, item: item_4)
          item_5 = create(:item)
            order_item_5 = create(:order_item, order: order_2, item: item_5)
          item_6 = create(:item)
            order_item_6 = create(:order_item, order: order_2, item: item_6)

        order_3 = create(:shipped_order, user: reg_user)
          item_7 = create(:item)
            order_item_7 = create(:order_item, order: order_3, item: item_7)
          item_8 = create(:item)
            order_item_8 = create(:order_item, order: order_3, item: item_8)

        order_4 = create(:cancelled_order, user: reg_user)
          item_9 = create(:item)
            order_item_9 = create(:order_item, order: order_4, item: item_9)
          item_10 = create(:item)
            order_item_10 = create(:order_item, order: order_4, item: item_10)


        visit profile_orders_path(reg_user)


        expect(page).to have
        within("#order-#{order_1.id}") do
          find_link("#{order_1.id}")
          expect(page).to have_content("Order Created: #{order_1.created_at}")
          expect(page).to have_content("Order updated: #{order_1.updated_at}")
          expect(page).to have_content(order_1.status)
          expect(page).to have_content("Total Items #{order_1.items.count}")
          expect(page).to have_content("Total Cost: #{order_1.grand_total}")
        end

        within("#order-#{order_2.id}") do
          find_link("#{order_2.id}")
          expect(page).to have_content("Order Created: #{order_2.created_at}")
          expect(page).to have_content("Order updated: #{order_2.updated_at}")
          expect(page).to have_content(order_2.status)
          expect(page).to have_content("Total Items #{order_2.items.count}")
          expect(page).to have_content("Total Cost: #{order_2.grand_total}")
        end

        within("#order-#{order_3.id}") do
          find_link("#{order_3.id}")
          expect(page).to have_content("Order Created: #{order_3.created_at}")
          expect(page).to have_content("Order updated: #{order_3.updated_at}")
          expect(page).to have_content(order_3.status)
          expect(page).to have_content("Total Items #{order_3.items.count}")
          expect(page).to have_content("Total Cost: #{order_3.grand_total}")
        end

        within("#order-#{order_4.id}") do
          find_link("#{order_4.id}")
          expect(page).to have_content("Order Created: #{order_4.created_at}")
          expect(page).to have_content("Order updated: #{order_4.updated_at}")
          expect(page).to have_content(order_4.status)
          expect(page).to have_content("Total Items #{order_4.items.count}")
          expect(page).to have_content("Total Cost: #{order_4.grand_total}")
        end
      end
    end
  end
end


# As a registered user
# When I visit my Profile Orders page, "/profile/orders"
# I see every order I've made, which includes the following information:
# - the ID of the order, which is a link to the order show page
# - the date the order was made
# - the date the order was last updated
# - the current status of the order
# - the total quantity of items in the order
# - the grand total of all items for that order

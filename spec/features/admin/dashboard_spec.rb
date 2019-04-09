require 'rails_helper'

describe "As an admin user" do
  describe 'When I log into my dashboard /admin/dashboard' do
    it 'Then I see all the orders in the system' do
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      order_1 = create(:packaged_order)
      order_2 = create(:order)
      order_3 = create(:shipped_order)
      order_4 = create(:cancelled_order)
      @orders = Order.all
      @sorted = @orders.sort_by_status

      visit admin_dashboard_path

      expect(page).to have_content(order_1.user.name)
      expect(page).to have_content(order_2.user.name)
      expect(page).to have_content(order_3.user.name)
      expect(page).to have_content(order_4.user.name)

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_2.id)
      expect(page).to have_content(order_3.id)
      expect(page).to have_content(order_4.id)

      expect(page).to have_content(order_1.created_at)
      expect(page).to have_content(order_2.created_at)
      expect(page).to have_content(order_3.created_at)
      expect(page).to have_content(order_4.created_at)

      expect(@orders.sort_by_status).to eq(@sorted)
    end
    it 'user names are links to admin view' do
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      order_1 = create(:packaged_order)
      order_2 = create(:order)
      order_3 = create(:shipped_order)
      order_4 = create(:cancelled_order)

      visit admin_dashboard_path

      click_link "#{order_1.user.name}"

      expect(current_path).to eq(admin_user_path(order_1.user))

      visit admin_dashboard_path

      click_link "#{order_2.user.name}"

      expect(current_path).to eq(admin_user_path(order_2.user))

      visit admin_dashboard_path

      click_link "#{order_3.user.name}"

      expect(current_path).to eq(admin_user_path(order_3.user))

      visit admin_dashboard_path

      click_link "#{order_4.user.name}"

      expect(current_path).to eq(admin_user_path(order_4.user))

    end
  end
end

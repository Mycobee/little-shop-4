require 'rails_helper'

RSpec.describe "As an admin user" do
  describe "When I click new users link in the nav" do
    it "the current URI route is /admin/users" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)
      merchant_1  = create(:merchant)
      merchant_2  = create(:merchant)
      merchant_3  = create(:merchant)
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)

      visit root_path

      expect(page).to have_link("Users")

      click_link "Users"

      expect(current_path).to eq(admin_users_path)

      expect(page).to have_content(user_1.name)
      expect(page).to have_content(user_2.name)
      expect(page).to have_content(user_3.name)
      expect(page).to_not have_content(merchant_1.name)
      expect(page).to_not have_content(merchant_2.name)
      expect(page).to_not have_content(merchant_3.name)
    end
    it 'each user name is a link to show page for that user' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)
      merchant_1  = create(:merchant)
      merchant_2  = create(:merchant)
      merchant_3  = create(:merchant)
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)

      visit admin_users_path

      click_link "#{user_1.name}"

      expect(current_path).to eq(admin_user_path(user_1))
    end
    it "Should show the date each user registered" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)
      merchant_1  = create(:merchant)
      merchant_2  = create(:merchant)
      merchant_3  = create(:merchant)
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)

      visit admin_users_path

      expect(page).to have_content(user_1.created_at)
      expect(page).to have_content(user_2.created_at)
      expect(page).to have_content(user_3.created_at)
    end
    it 'shows a button to upgrade to merchant' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)
      merchant_1  = create(:merchant)
      merchant_2  = create(:merchant)
      merchant_3  = create(:merchant)
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)

      visit admin_users_path

      expect(page).to have_button("Upgrade to Merchant")
    end
  end
end

# As an admin user
# When I click a new "Users" link in the nav (only visible to admins)
# Then my current URI route is "/admin/users"
# Only admin users can reach this path.
# I see all users in the system who are not merchants nor admins.
# Each user's name is a link to a show page for that user ("/admin/users/5")
# Next to each user's name is the date they registered
# Next to each user's name is a button that says 'Upgrade to Merchant'

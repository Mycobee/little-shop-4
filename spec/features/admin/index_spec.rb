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

  describe "When I visit the merchant index page" do
    describe "And click on the disable button" do
      it 'There is a flash message saying merchant account disabled' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to \
        receive(:current_user).and_return(admin)

        merchant = create(:merchant)

        visit merchants_path

        within(".merchant-activation-#{merchant.id}") do
          click_button('Disable')
        end

        expect(current_path).to eq(merchants_path)
        within(".merchant-activation-#{merchant.id}") do
          expect(page).to_not have_button("Disable")
        end
        expect(page).to have_content("Merchant account has been disabled")

        merchant = User.where(id: "#{merchant.id}").first

        expect(merchant.enabled?).to eq(false)
      end

      it 'and a disabled merchant account can not log in' do
        merchant = create(:merchant, enabled: false)
        visit login_path
        fill_in "Email", with: merchant.email
        fill_in "Password", with: merchant.password

        click_button "Log In"
        expect(page).to have_content("Access Denied")
      end
    end

    describe 'and click on the enable button' do
      it 'There is a flash message saying the merchant account is enabled' do
        admin = create(:admin)
        allow_any_instance_of(ApplicationController).to \
        receive(:current_user).and_return(admin)

        merchant = create(:merchant, enabled: false)

        visit merchants_path


        within(".merchant-activation-#{merchant.id}") do
          click_button('Enable')
        end

        expect(current_path).to eq(merchants_path)
        within(".merchant-activation-#{merchant.id}") do
          expect(page).to_not have_button("Enable")
        end
        expect(page).to have_content("Merchant account has been enabled")

        merchant = User.where(id: "#{merchant.id}").first

        expect(merchant.enabled?).to eq(true)
      end

      it 'and an enabled merchant account can log in' do
        merchant = create(:merchant, enabled: true)
        visit login_path
        fill_in "Email", with: merchant.email
        fill_in "Password", with: merchant.password

        click_button "Log In"
        expect(current_path).to eq(dashboard_path)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "login workflow" do
  context 'as regular user' do
    it "Allows user to log if good credentials" do
      reg_user = create(:user)

      visit root_path

      click_link "Login"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: reg_user.email
      fill_in "Password", with: reg_user.password

      click_button "Log In"
      expect(page).to have_content("Logged in as #{reg_user.name}")
      expect(current_path).to eq(profile_path)
    end
  end

  context 'as a merchant' do
    it "Allows user to login as a Merchant" do
      merch_user = create(:merchant)

      visit root_path

      click_link "Login"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: "#{merch_user.email}"
      fill_in "Password", with: "#{merch_user.password}"

      # save_and_open_page
      click_button "Log In"
      expect(page).to have_content("Logged in as #{merch_user.name}")
      expect(current_path).to eq(dashboard_path)
    end
  end


  context 'as a admin' do
    it "Allows user to login as a Merchant" do
      admin_user = create(:admin)

      visit root_path

      click_link "Login"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: "#{admin_user.email}"
      fill_in "Password", with: "#{admin_user.password}"

      # save_and_open_page
      click_button "Log In"
      expect(page).to have_content("Logged in as #{admin_user.name}")
      expect(current_path).to eq(admin_dashboard_path)
    end
  end
  describe 'As a visitor' do
    context 'when I visit /login, and I submit valid information' do
      it 'I am redirected to a login page and see flash message for bad credentials' do
        user = create(:user)

        visit login_path

        fill_in "Email", with: "#{user.email}"
        fill_in "Password", with: "wrong password"
        click_button "Log In"

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Your credentials were incorrect")
      end
    end
  end
end

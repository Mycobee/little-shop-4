require 'rails_helper'

RSpec.describe "login workflow" do
  context 'as regular user' do
    it "Allows user to log if good credentials" do
      reg_user = create(:user)

      visit root_path

      click_link "Login"

      expect(current_path).to eq(login_path)

      fill_in "Email", with: "#{reg_user.email}"
      fill_in "Password", with: "#{reg_user.password}"

      # save_and_open_page
      click_button "Log In"
      expect(page).to have_content("#{reg_user.name} logged in.")
      expect(current_path).to eq(user_path(reg_user))
    end
  end
end

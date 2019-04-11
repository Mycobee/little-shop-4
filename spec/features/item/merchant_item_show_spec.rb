require 'rails_helper'

RSpec.describe "As a merchant" do
  describe "when I visit my dashboard" do
    before :each do

      @merch_1 = create(:user, role: "merchant", id: 1)

      visit login_path

      fill_in "Email", with: @merch_1.email
      fill_in "Password", with: @merch_1.password

      click_button "Log In"

      visit dashboard_path
    end

    it "should see a link to go to the merchants items page" do

      expect(current_path).to eq(dashboard_path)


      click_link "Merchant Items Page"

      expect(current_path).to eq(dashboard_items_path)

    end
  end
end

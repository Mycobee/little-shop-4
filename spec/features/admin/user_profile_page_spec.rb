require 'rails_helper'

RSpec.describe 'As an admin' do
  describe 'when I visit a users profile page' do

    before :each do
      @user = create(:user)
      @admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@admin)

    end

    it 'I should see same information as user except edit button' do

      visit admin_user_path(@user)

      expect(page).to have_content(@user.name)
      expect(page).to have_content("Address: #{@user.address}")
      expect(page).to have_content("City: #{@user.city}")
      expect(page).to have_content("State: #{@user.state}")
      expect(page).to have_content("Zip Code: #{@user.zip_code}")
      expect(page).to have_content("Email: #{@user.email}")
      expect(page).to_not have_link("Edit Profile")

    end

    it 'I should see a link to upgrade the users account to become a merchant' do
      visit admin_user_path(@user)
      
      expect(page).to have_link("upgrade")


    end
  end
end

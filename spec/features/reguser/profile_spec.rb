require 'rails_helper'


RSpec.describe 'As a registered user' do
  describe 'when I visit my profile page' do
    it 'I see all of my personal data on the page except password' do

      @user = create(:user)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@user)

      visit profile_path(@user)

      expect(page).to have_content(@user.name)
      expect(page).to have_content("Address: #{@user.address}")
      expect(page).to have_content("City: #{@user.city}")
      expect(page).to have_content("State: #{@user.state}")
      expect(page).to have_content("Zip Code: #{@user.zip_code}")
      expect(page).to have_content("Email: #{@user.email}")
      expect(page).to have_link("Edit Profile")
    end
  end
end

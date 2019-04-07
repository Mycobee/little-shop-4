require 'rails_helper'


RSpec.describe 'As a registered User' do
  describe "I see a link to edit my profile data" do
    it "When I click the link I'm taken to an edit form profile/edit" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_link("Edit Profile")
      click_link "Edit Profile"

      expect(current_path).to eq(edit_profile_path)
    end
  end
  describe 'I see a form like the registration page' do
    it 'Form contains all user information except the password field is left blank' do

      user = create(:user)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)

      visit edit_profile_path

      expect(page).to have_field("Name", placeholder: user.name)
      expect(page).to have_field("Address", placeholder: user.address)
      expect(page).to have_field("City", placeholder: user.city)
      expect(page).to have_field("State", placeholder: user.state)
      expect(page).to have_field("Zip code", placeholder: user.zip_code)
      expect(page).to have_field("Email", placeholder: user.email)
      find_field('New password')
      find_field('Confirm password')
      find_button('Update User')
    end
  end
  describe 'I can change any or all of my information' do
    it 'I click Update User, am redirected to profile page, and have updated profile flash message' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)

      visit edit_profile_path

      fill_in 'Email', with: "user_updated_email@gmail.com"
      fill_in 'City', with: 'Portland'
      fill_in 'Zip code', with: '21990'

      click_button "Update User"

      expect(current_path).to eq(profile_path)

      expect(page).to have_content("Profile Information Updated")
      expect(page).to have_content(user.name)
      expect(page).to have_content("Address: #{user.address}")
      expect(page).to have_content("City: Portland")
      expect(page).to have_content("State: #{user.state}")
      expect(page).to have_content("Zip Code: 21990")
      expect(page).to have_content("Email: user_updated_email@gmail.com")
      expect(page).to have_link("Edit Profile")
    end
  end
end

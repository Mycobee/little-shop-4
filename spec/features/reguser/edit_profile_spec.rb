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

      expect(find_field('Name').value).to eq(user.name
      expect(find_field('Address').value).to eq user.address
      expect(find_field('City').value).to eq user.city
      expect(find_field('State').value).to eq user.state
      expect(find_field('Zip code').value).to eq user.zip_code
      expect(find_field('Email').value).to eq user.email

      # find_field('Name').should_have_content(user.name)
      # find_field('Address').should_have_content(user.address)
      # find_field('City').should_have_content(user.city)
      # find_field('State').should_have_content(user.state)
      # find_field('Zip code').should_have_content(user.zip_code)
      # find_field('Email').should_have_content(user.email)
      find_field('New password')
      find_field('Confirm password')
    end
  end
end
# expect(current_path).to eq(new_user_path)
# fill_in 'Name', with: 'Deonte'
# fill_in 'Address', with: '189 E Belleview ln'
# fill_in 'City', with: 'Denver'
# fill_in 'State', with: 'CO'
# fill_in 'Zip code', with: '80015'
# fill_in 'Email', with: email
# fill_in 'Password', with: 'password'
# fill_in 'Confirm password', with: 'password'
#
# click_button 'Create User'

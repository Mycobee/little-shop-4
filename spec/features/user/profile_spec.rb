require 'rails_helper'


RSpec.describe 'As a registered user' do
  describe 'when I visit my profile page' do
    it 'I see all of my personal data on the page except password' do

      reg_user = User.create(name: 'John Peterson', address: '1011 west 13th St', city: 'Denver', state: "CO", zip_code: 80206, email: 'johnpeterson@gmail.com', password_digest: 'jp32@yolo', enabled: true, role: 1)

      visit profile_path(reg_user)

      expect(page).to have_content("Name: #{reg_user.name}")
      expect(page).to have_content("Address: #{reg_user.address}")
      expect(page).to have_content("City: #{reg_user.city}")
      expect(page).to have_content("State: #{reg_user.state}")
      expect(page).to have_content("Zip Code: #{reg_user.zip_code}")
      expect(page).to have_content("Email: #{reg_user.email}")
    end
  end
end

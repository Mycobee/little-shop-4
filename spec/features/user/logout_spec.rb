require 'rails_helper'

RSpec.describe 'As a registered user' do
    describe 'When i visit the logout path' do     
        it 'redirects me to the root path' do
            reg_user = create(:user)
            visit login_path
            
            fill_in 'Email', with: reg_user.email 
            fill_in 'Password', with: reg_user.password 
            click_button("Log In")
            expect(current_path).to eq(profile_path)
            click_link("Log Out")
            expect(current_path).to eq(root_path)
            expect(page).to have_content("You are logged out")
        end
    end
end
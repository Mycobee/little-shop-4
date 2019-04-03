require 'rails_helper'


RSpec.describe 'as a registered user' do
    describe 'I see a navbar' do
        it 'has functional links' do
            @user = create(:user)
            
            allow_any_instance_of(ApplicationController).to \
            receive(:current_user).and_return(@user)
            
            visit root_path
            save_and_open_page
            expect(page).to have_link("Home")
            expect(page).to have_link("Items")
            expect(page).to have_link("Merchants")
            expect(page).to have_link("Shopping Cart")
            expect(page).to have_link("Log Out")
            expect(page).to have_link("Profile")
            expect(page).to have_content("Logged in as #{@user.name}")
            expect(page).to_not have_link("Login")
            
            # click_link("Items")
            # expect(current_path).to eq("/items")

            # click_link("Merchants")
            # expect(current_path).to eq("/merchants")

            # click_link("Shopping Cart")
            # expect(current_path).to eq("/cart")

            # # click_link("Profile")
            # # expect(current_path).to eq("/profile")

            # click_link("Home")
            # expect(current_path).to eq(root_path)
        end
    end
end

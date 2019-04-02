require 'rails_helper'


RSpec.describe 'as a registered user' do
    describe 'I see a navbar' do
        it 'has functional links' do
            visit root_path

            expect(page).to have_link("Home")
            expect(page).to have_link("Items")
            expect(page).to have_link("Merchants")
            expect(page).to have_link("Shopping Cart")
            expect(page).to have_link("Log Out")
            expect(page).to have_link("Profile")

            click_link("Items")
            expect(current_path).to eq("/items")

            click_link("Merchants")
            expect(current_path).to eq("/merchants")
            
            click_link("Shopping Cart")
            expect(current_path).to eq("/cart")

            click_link("Profile")
            expect(current_path).to eq("/profile")
            
            click_link("Home")
            expect(current_path).to eq(root_path)
            
            click_link("Log Out")
            expect(current_path).to eq(root_path)
            expect(page).to_not have_link("Profile")
            ## Test "Logged in as <username" here
        end
    end
end
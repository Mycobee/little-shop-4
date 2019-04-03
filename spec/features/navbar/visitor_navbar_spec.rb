require 'rails_helper'

RSpec.describe 'as a visitor' do
    describe 'I see a navbar' do
        xit 'has functional links' do
            visit root_path

            expect(page).to have_link("Home")
            expect(page).to have_link("Items")
            expect(page).to have_link("Merchants")
            expect(page).to have_link("Shopping Cart")
            expect(page).to have_link("Login")
            expect(page).to have_link("Register")

            click_link("Items")
            expect(current_path).to eq("/items")

            click_link("Merchants")
            expect(current_path).to eq("/merchants")

            click_link("Shopping Cart")
            expect(current_path).to eq("/cart")

            click_link("Login")
            expect(current_path).to eq("/login")

            click_link("Register")
            expect(current_path).to eq(new_user_path)

            click_link("Home")
            expect(current_path).to eq(root_path)


            ## Test shopping cart item count here in time
        end
    end
end

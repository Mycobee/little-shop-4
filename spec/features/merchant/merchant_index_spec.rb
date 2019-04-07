require 'rails_helper'

RSpec.describe 'As a visitor viewing the merchants index' do
    context 'looking at all the active merchants' do
        before(:each) do
          @admin = create(:admin)
            @merchant_1 =  create(:merchant)
            @merchant_2 =  create(:merchant)
            @merchant_3 =  create(:merchant)
            @merchant_4 = create(:inactive_merchant)
        end



        it 'shows every merchant name, city, and address' do

            visit merchants_path
            save_and_open_page
            expect(page).to have_content("Name: #{@merchant_1.name}")
            expect(page).to have_content("Name: #{@merchant_2.name}")
            expect(page).to have_content("Name: #{@merchant_3.name}")

            expect(page).to have_content("City: #{@merchant_1.city}")
            expect(page).to have_content("City: #{@merchant_2.city}")
            expect(page).to have_content("City: #{@merchant_3.city}")

            expect(page).to have_content("State: #{@merchant_1.state}")
            expect(page).to have_content("State: #{@merchant_2.state}")
            expect(page).to have_content("State: #{@merchant_3.state}")

            expect(page).to have_content("Registration Date: #{@merchant_1.created_at}")
            expect(page).to have_content("Registration Date: #{@merchant_2.created_at}")
            expect(page).to have_content("Registration Date: #{@merchant_3.created_at}")

            save_and_open_page

            expect(page).to_not have_content(@merchant_4.name)

            within '.index_container' do
              expect(page).to_not have_content(@admin.name)
            end
        end
    end
end

require 'rails_helper'

RSpec.describe 'As a visitor viewing the merchants index' do
    context 'looking at all the active merchants' do
        before(:each) do
            @merchant_1 =  create(:merchant)
            @merchant_2 =  create(:merchant)
            @merchant_3 =  create(:merchant)
        end
        
        
        it 'shows every merchant name, city, and address' do
            visit merchants_path 
            
            expect(page).to have_content(@merchant_1.name)
            expect(page).to have_content(@merchant_2.name)
            expect(page).to have_content(@merchant_3.name)

            expect(page).to have_content(@merchant_1.city)
            expect(page).to have_content(@merchant_2.city)
            expect(page).to have_content(@merchant_3.city)

            expect(page).to have_content(@merchant_1.state)
            expect(page).to have_content(@merchant_2.state)
            expect(page).to have_content(@merchant_3.state)

            expect(page).to have_content(@merchant_1.created_at)
            expect(page).to have_content(@merchant_2.created_at)
            expect(page).to have_content(@merchant_3.created_at)
        end
    end
end
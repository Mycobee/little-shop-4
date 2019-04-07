require 'rails_helper'

RSpec.describe 'Admin visits a merchants index page, clicks and sees merchant' do
  context 'As an Admin' do

    it 'visits the index page of merchants and sees link to merchant profile page' do

      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      merchant_3 = create(:merchant)

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)




      visit merchants_path


      expect(page).to have_content("#{merchant_1.name}")
      expect(page).to have_content("#{merchant_1.name}")
      expect(page).to have_content("#{merchant_1.city}")
      expect(page).to have_content("#{merchant_1.state}")

      click_link merchant_2.name


      expect(current_path).to eq(admin_merchant_path(merchant_2))

    end

    it 'clicks link and sees the merchant show page' do

      merchant_2 = create(:merchant)

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      visit merchants_path

      click_link merchant_2.name

      expect(page).to have_content("#{merchant_2.name}")
    end
  end
end

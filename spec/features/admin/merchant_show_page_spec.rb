RSpec.describe 'Admin visits a merchants index page, clicks and sees merchant' do
  context 'As an Admin' do

    before :each do
      @merchant_1 = create(:merchant)
      @merchant_2 = create(:merchant)
      @merchant_3 = create(:merchant)
      @admin = create(:admin)



    end

    it 'visits the index page of merchants and sees merchant info' do

      visit merchants_path


      expect(page).to have_content("#{@merchant_1.name}")

      click_link @merchant_1.name
      save_and_open_page

      expect(page).to have_content("#{@merchant_1.name}")
      expect(page).to have_content("#{@merchant_1.city}")
      expect(page).to have_content("#{@merchant_1.state}")
    end
  end
end

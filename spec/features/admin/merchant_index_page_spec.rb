RSpec.describe 'Admin visits a merchants index page, clicks and sees merchant' do
  context 'As an Admin' do

    it 'visits the index page of merchants' do

      merchant_1 = create(:merchant)
      merchant_2 = create(:inactive_merchant)
      merchant_3 = create(:merchant)

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      visit merchants_path

      click_link merchant_2.name

      
      expect(page).to have_content("Disable #{merchant_1.name}?")
      expect(page).to have_button("Enable #{merchant_2.name}?")



    end
  end
end

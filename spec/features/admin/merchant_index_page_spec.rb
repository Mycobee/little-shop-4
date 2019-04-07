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

      save_and_open_page

      expect(page).to have_button("Disable")
      expect(page).to have_button("Enable")

    end
  end
end

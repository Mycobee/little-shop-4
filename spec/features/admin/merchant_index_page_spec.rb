RSpec.describe 'Admin visits a merchants index page, clicks and sees merchant' do
  context 'As an Admin' do

    it 'visits the index page of merchants and disables a merchant' do

      merchant_1 = create(:merchant)
      merchant_2 = create(:inactive_merchant)
      merchant_3 = create(:merchant)

      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(admin)

      visit merchants_path


      within(".merchant-activation-#{merchant_1.id}") do
        expect(page).to have_button("Disable")
      end

      within(".merchant-activation-#{merchant_2.id}") do
        expect(page).to have_button("Enable")
      end

      within(".merchant-activation-#{merchant_3.id}") do
        expect(page).to have_button("Disable")
      end
    end
  end
end

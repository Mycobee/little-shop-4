require 'rails_helper'

RSpec.describe 'As an admin' do
  describe 'When I visit a merchant dashboard' do
    before :each do

      @admin = create(:admin)
      @former_merchant = create(:merchant, role: 0)
      @merchant = create(:merchant)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(@admin)

    end

    it 'I see a link that downgrades the merchant account to regular user' do
      visit admin_merchant_path(@merchant)
      expect(page).to have_link("Downgrade to User")

      click_link("Downgrade to User")

      expect(current_path).to eq(admin_user_path(@merchant))
      downgraded_user = User.where(id: "#{@merchant.id}").first
      expect(downgraded_user.role).to eq("default")

      expect(current_path).to eq(admin_user_path(@merchant))
      expect(page).to have_content("#{@merchant.name} is now a user.")
    end

    it 'a downgraded merchant no longer has items for sale' do
     new_merchant = create(:merchant)
     item_1 = create(:item, user: new_merchant)
     item_2 = create(:item, user: new_merchant)
     item_3 = create(:item, user: new_merchant)
     item_4 = create(:item)
     

     visit admin_merchant_path(new_merchant)

     click_link("Downgrade to User")
     
     item_1.reload     
     item_2.reload
     item_3.reload
     expect(item_1.enabled).to eq(false)
     expect(item_2.enabled).to eq(false)
     expect(item_3.enabled).to eq(false)
     
     visit items_path
    
     expect(page).to_not have_content(item_1.name)
     expect(page).to_not have_content(item_2.name)
     expect(page).to_not have_content(item_3.name)
     expect(page).to have_content(item_4.name)
    end
  end
end

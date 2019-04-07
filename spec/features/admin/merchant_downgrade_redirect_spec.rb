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

    it 'sees a user profile page if merchant has been downgraded from regular user' do
      visit admin_merchant_path(@former_merchant)

      expect(current_path).to eq(admin_user_path(@former_merchant))
    end
  end
end

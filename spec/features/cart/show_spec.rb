require 'rails_helper'

RSpec.describe 'As a visitor or registered user without cart items' do
  describe 'When I visit my cart' do
    it 'I see a message that my cart is empty' do

      visit cart_path

      expect(page).to have_content("My Cart is Empty")
      #
    end
  end
end

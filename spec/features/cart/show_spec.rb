require 'rails_helper'

RSpec.describe 'As a visitor or registered' do
  describe 'When I visit my empty cart' do
    it 'I see a message that my cart is empty' do

      visit cart_path

      expect(page).to have_content("My Cart is Empty")
    end
  end

  describe 'when I visit my cart with items' do
    xit 'I add to cart and subtotal' do
      item_1 = create(:item, base_price: 10)
      item_2 = create(:item, base_price: 10)
      item_3 = create(:item, base_price: 10)
      
      cart = Cart.new
      cart.add_item(item_1)
      cart.add_item(item_2)
      cart.add_item(item_3)
      cart.add_item(item_3)
      visit cart_path
      
      expect(page).to have_content("Name: #{item_1.name}")
      expect(page).to have_content("Name: #{item_2.name}")
      expect(page).to have_content("Name: #{item_3.name}")

      expect(page).to have_content("Price: #{item_1.base_price}")
      expect(page).to have_content("Price: #{item_2.base_price}")
      expect(page).to have_content("Price: #{item_3.base_price}")

      expect(page).to have_content("Desired Quantity: #{item_1.quantity}")
      expect(page).to have_content("Desired Quantity: #{item_2.quantity}")
      expect(page).to have_content("Desired Quantity: #{item_3.quantity}")
      
      expect(page).to have_content("Subtotal: #{cart.subtotal(item_1)}")
      expect(page).to have_content("Subtotal: #{cart.subtotal(item_2)}")
      expect(page).to have_content("Subtotal: #{cart.subtotal(item_3)}")
      
      expect(page).to have_css("img[src*='#{item_1.image}']")
      expect(page).to have_css("img[src*='#{item_2.image}']")
      expect(page).to have_css("img[src*='#{item_3.image}']")

      expect(page).to have_content("Merchant: #{item_1.merchant_name}")
      expect(page).to have_content("Merchant: #{item_2.merchant_name}")
      expect(page).to have_content("Merchant: #{item_3.merchant_name}")

      expect(page).to have_content("Grand Total: #{cart.grand_total}")
      expect(page).to have_link("Empty Cart")
    end
  end
end

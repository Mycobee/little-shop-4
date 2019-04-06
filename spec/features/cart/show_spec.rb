require 'rails_helper'

<<<<<<< HEAD
RSpec.describe 'As a visitor or registered' do
  describe 'When I visit my empty cart' do
<<<<<<< Updated upstream
=======
RSpec.describe 'As a visitor or registered user' do
  describe 'When I visit my cart without cart items' do
>>>>>>> 91468f5af95e6adc3ea6f4351e62dc44604163ad
    it 'I see a message that my cart is empty' do
=======
    xit 'I see a message that my cart is empty' do
>>>>>>> Stashed changes

      visit cart_path

      expect(page).to have_content("My Cart is Empty")
    end
  end
<<<<<<< HEAD

  describe 'When I add items to my cart' do
    it 'A message is displayed' do
      item_1 = create(:item, base_price: 10)
      item_2 = create(:item, base_price: 10)
      item_3 = create(:item, base_price: 10)

      visit items_path
    end
  end

  describe 'when a user adds items to cart' do
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
=======
  describe 'When I visit my cart' do
    xit 'I see all items in my cart' do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)

      cart = Cart.new

      item_1.add_to_cart
      item_2.add_to_cart
      item_3.add_to_cart
      item_3.add_to_cart
      item_3.add_to_cart

      visit cart_path

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_3.name)

      expect(page).to have_content(item_1.price)
      expect(page).to have_content(item_2.price)
      expect(page).to have_content(item_3.price)

      expect(page).to have_css("img[src*='#{item_1.image_url}']")
      expect(page).to have_css("img[src*='#{item_2.image_url}']")
      expect(page).to have_css("img[src*='#{item_3.image_url}']")

      expect(page).to have_content("Desired Quantity: #{cart[:item_1]}")
      expect(page).to have_content("Desired Quantity: #{cart[:item_2]}")
      expect(page).to have_content("Desired Quantity: #{cart[:item_3]}")
>>>>>>> 91468f5af95e6adc3ea6f4351e62dc44604163ad
    end
  end
end

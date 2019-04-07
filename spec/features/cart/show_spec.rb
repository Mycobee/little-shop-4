require 'rails_helper'

RSpec.describe 'As a visitor or registered user' do
  describe 'When I visit my cart without cart items' do

    xit 'I see a message that my cart is empty' do


      visit cart_path

      expect(page).to have_content("My Cart is Empty")
    end
  end
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
    end
  end
end

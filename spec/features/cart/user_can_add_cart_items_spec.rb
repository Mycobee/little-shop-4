require 'rails_helper'

RSpec.describe 'When I add items to my cart' do
  it 'A message is displayed' do
    item_1 = create(:item)

    visit items_path

    click_button "Add to Cart"

    expect(page).to have_content("You now have 1 unit of #{item_1.name} in your cart.")
  end

  it "the message correctly increments for multiple items" do
    item_1 = create(:item)

    visit items_path

    click_button "Add to Cart"

    expect(page).to have_content("You now have 1 unit of #{item_1.name} in your cart.")

    click_button "Add to Cart"

    expect(page).to have_content("You now have 2 units of #{item_1.name} in your cart.")
  end

  it 'the total number of items in the cart increments' do
    item_1 = create(:item)

    visit items_path
    
    expect(page).to have_content("Cart: 0")

    click_button "Add to Cart"

    expect(page).to have_content("Cart: 1")
  end
end







































  # describe 'when a user adds items to cart' do
  #   xit 'I add to cart and subtotal' do
  #     item_1 = create(:item, base_price: 10)
  #     item_2 = create(:item, base_price: 10)
  #     item_3 = create(:item, base_price: 10)
      
  #     cart = Cart.new
  #     cart.add_item(item_1)
  #     cart.add_item(item_2)
  #     cart.add_item(item_3)
  #     cart.add_item(item_3)
  #     visit cart_path
      
  #     expect(page).to have_content("Name: #{item_1.name}")
  #     expect(page).to have_content("Name: #{item_2.name}")
  #     expect(page).to have_content("Name: #{item_3.name}")

  #     expect(page).to have_content("Price: #{item_1.base_price}")
  #     expect(page).to have_content("Price: #{item_2.base_price}")
  #     expect(page).to have_content("Price: #{item_3.base_price}")

  #     expect(page).to have_content("Desired Quantity: #{item_1.quantity}")
  #     expect(page).to have_content("Desired Quantity: #{item_2.quantity}")
  #     expect(page).to have_content("Desired Quantity: #{item_3.quantity}")
      
  #     expect(page).to have_content("Subtotal: #{cart.subtotal(item_1)}")
  #     expect(page).to have_content("Subtotal: #{cart.subtotal(item_2)}")
  #     expect(page).to have_content("Subtotal: #{cart.subtotal(item_3)}")
      
  #     expect(page).to have_css("img[src*='#{item_1.image}']")
  #     expect(page).to have_css("img[src*='#{item_2.image}']")
  #     expect(page).to have_css("img[src*='#{item_3.image}']")

  #     expect(page).to have_content("Merchant: #{item_1.merchant_name}")
  #     expect(page).to have_content("Merchant: #{item_2.merchant_name}")
  #     expect(page).to have_content("Merchant: #{item_3.merchant_name}")

  #     expect(page).to have_content("Grand Total: #{cart.grand_total}")
  #     expect(page).to have_link("Empty Cart")
  #   end 
  # end

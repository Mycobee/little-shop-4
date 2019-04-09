require 'rails_helper'

RSpec.describe 'When I add items to my cart' do
  it 'I will be able to empty the cart' do

    cart = Cart.new({})
    reg_user = create(:user)
    item_1 = create(:item)

    visit login_path

    fill_in "Email", with: reg_user.email
    fill_in "Password", with: reg_user.password

    click_button "Log In"

    visit items_path

    click_button "Add to Cart"

    visit cart_path(cart)

    click_link("Empty Cart")

    expect(page).to have_content("Cart: 0")
    expect(page).to have_content("My Cart is Empty")
  end
end

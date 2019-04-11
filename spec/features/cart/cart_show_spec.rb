require 'rails_helper'

RSpec.describe 'As a visitor or registered' do
  describe 'When I visit my empty cart' do
    it 'I see a message that my cart is empty' do
      cart = Cart.new({})

      visit cart_path(cart)

      expect(page).to have_content("My Cart is Empty")
    end
  end

  describe 'when a user adds items to cart' do
    before :each do
        @cart = Cart.new({})
        @item_1 = create(:item, base_price: 10)
        @item_2 = create(:item, base_price: 10)
        @item_3 = create(:item, base_price: 10)

        visit items_path

        within "##{@item_1.id}" do
            click_button "Add to Cart"
        end

        within "##{@item_2.id}" do
            click_button "Add to Cart"
        end

        within "##{@item_3.id}" do
            click_button "Add to Cart"
        end

        within "##{@item_3.id}" do
            click_button "Add to Cart"
        end

        visit cart_path(@cart)
    end

    it 'I add to cart and subtotal' do
      expect(page).to have_content("Name: #{@item_1.name}")
      expect(page).to have_content("Name: #{@item_2.name}")
      expect(page).to have_content("Name: #{@item_3.name}")

      expect(page).to have_content("Price: #{@item_1.base_price}")
      expect(page).to have_content("Price: #{@item_2.base_price}")
      expect(page).to have_content("Price: #{@item_3.base_price}")

      expect(page).to have_content("Desired Quantity: 1")
      expect(page).to have_content("Desired Quantity: 1")
      expect(page).to have_content("Desired Quantity: 2")

      expect(page).to have_content("Subtotal: $10.00")
      expect(page).to have_content("Subtotal: $10.00")
      expect(page).to have_content("Subtotal: $20.00")

      expect(page).to have_css("img[src*='#{@item_1.image_url}']")
      expect(page).to have_css("img[src*='#{@item_2.image_url}']")
      expect(page).to have_css("img[src*='#{@item_3.image_url}']")

      expect(page).to have_content("Merchant: #{@item_1.merchant_name}")
      expect(page).to have_content("Merchant: #{@item_2.merchant_name}")
      expect(page).to have_content("Merchant: #{@item_3.merchant_name}")

      expect(page).to have_content("Total Price: $40.00")
      expect(page).to have_link("Empty Cart")
    end
  end

  describe 'When a visitor changes the quantity of items in my cart' do
    it 'can change the quantity of the items in my cart' do
      cart = Cart.new({})
      item_1 = create(:item, base_price: 10)
      item_2 = create(:item, base_price: 40)

      visit items_path

      within "##{item_1.id}" do
          click_button "Add to Cart"
      end

      within "##{item_2.id}" do
          click_button "Add to Cart"
      end

      visit cart_path(cart)

      within(".quantity-count-#{item_1.id}") do
        fill_in 'Quantity', with: '8'
        click_button("Change Quantity")

        item_1.reload
        expect(item_1.quantity).to eq(8)
      end

      expect(page).to have_content("Cart Has Been Updated.")
      expect(page).to have_button("Remove From Cart")

      within "#remove-#{item_1.id}" do
        click_button "Remove From Cart"
      end
      item_1.reload

      expect(item_1.quantity).to eq(0)

      within "#remove-#{item_2.id}" do
        click_button "Remove From Cart"
      end

      expect(page).to have_content("My Cart is Empty")
    end
  end
end

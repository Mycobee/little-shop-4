require 'rails_helper'

RSpec.describe 'Merchant Show page shows profile information' do
  describe 'when I visit my dashboard page' do



  it 'It shows all of my merchant profile information' do
    @merch_user = create(:merchant)

    visit login_path

    fill_in "Email", with: @merch_user.email
    fill_in "Password", with: @merch_user.password

    click_button "Log In"

    visit merchant_dashboard_path


    expect(current_path).to eq(merchant_dashboard_path)
    expect(page).to have_content(@merch_user.name)
    expect(page).to have_content("Address: #{@merch_user.address}")
    expect(page).to have_content("City: #{@merch_user.city}")
    expect(page).to have_content("State: #{@merch_user.state}")
    expect(page).to have_content("Zip Code: #{@merch_user.zip_code}")
    expect(page).to have_content("Email: #{@merch_user.email}")
    expect(page).to have_link("Edit Profile")
    end
    xit 'If any users have pending orders containing items I sell I see a list of these orders' do
      merchant = create(:merchant)

      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(merchant)

      item_1 = Item.create(name: "Snickers", description: "Chocolate and caramel", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 12, base_price: 1.99, enabled: true )
      item_2 = Item.create(name: "Chips", description: "Crunchy and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 20, base_price: 2.99, enabled: true )
      item_3 = Item.create(name: "Pretzels", description: "Salty and delicious", image_url: "https://emblemsbf.com/img/77148.jpg", quantity: 5, base_price: 1.99, enabled: true )

      merchant.items << [item_1, item_2, item_3]

      user = create(:user)

      order_1 = Order.new(status: "pending", user: user)
      order_1.save

      order_item_1 = OrderItem.create(order: order_1, item: item_1, quantity: 3, price: item_1.base_price)
      order_item_2 = OrderItem.create(order: order_1, item: item_2, quantity: 4, price: item_1.base_price)
      order_item_3 = OrderItem.create(order: order_1, item: item_3, quantity: 5, price: item_1.base_price)

      visit merchant_dashboard_path

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_1.created_at)
      expect(order_1.total_items).to eq(12)
      expect(order_1.total_value).to eq(27.88)
    end
  end
end

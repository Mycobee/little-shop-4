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
  end
end

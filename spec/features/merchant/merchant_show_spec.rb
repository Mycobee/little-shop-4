require 'rails_helper'

RSpec.describe 'Merchant Show page shows profile information' do
  it 'Shows profile information for merchant' do

    merch_user = create(:merchant)

    visit dashboard_path

    expect(page).to have_content(merch_user.name)
    expect(page).to have_content("Address: #{merch_user.address}")
    expect(page).to have_content("City: #{merch_user.city}")
    expect(page).to have_content("State: #{merch_user.state}")
    expect(page).to have_content("Zip Code: #{merch_user.zip_code}")
    expect(page).to have_content("Email: #{merch_user.email}")
    expect(page).to have_link("Edit Profile")

  end
end

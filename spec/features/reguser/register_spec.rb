# require 'rails_helper'
#
# RSpec.describe 'As a registered user' do
#   describe 'when I visit login path' do
#     it 'as reguser it redirects me to my profile page' do
#
#       reg_user = User.create!(name: 'John Peterson', address: '1011 west 13th St', city: 'Denver', state: "CO", zip_code: 80206, email: 'johnpeterson@gmail.com', password: 'jp32@yolo', enabled: true, role: 0)
#
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(reg_user)
#
#       visit new_user_path
#
#       expect(current_path).to eq(profile_path)
#     end
#   end
# end

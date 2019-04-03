FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { "password" }
    sequence(:name) { |n| "User Name #{n}" }
    sequence(:address) { |n| "Address #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:state) { |n| "State #{n}" }
    sequence(:zip_code) { |n| "Zip #{n}" }
    role { 0 }
    enabled { true }
  end
  factory :inactive_user, parent: :user do
    sequence(:name) { |n| "Inactive User Name #{n}" }
    sequence(:email) { |n| "inactive_user_#{n}@gmail.com" }
    enabled { false }
  end

  factory :merchant, parent: :user do
    sequence(:email) { |n| "merchant_#{n}@gmail.com" }
    sequence(:name) { |n| "Merchant Name #{n}" }
    role { 1 }
    enabled { true }
  end
  factory :inactive_merchant, parent: :user do
    sequence(:email) { |n| "inactive_merchant_#{n}@gmail.com" }
    sequence(:name) { |n| "Inactive Merchant Name #{n}" }
    role { 1 }
    enabled { false }
  end

  factory :admin, parent: :user do
    sequence(:email) { |n| "admin_#{n}@gmail.com" }
    sequence(:name) { |n| "Admin Name #{n}" }
    role { 2 }
    enabled { true }
  end
end

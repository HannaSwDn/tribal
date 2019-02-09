FactoryBot.define do
  factory :user do
		sequence(:first_name) { |n| "John#{n}" }
    last_name { 'Doe' }
    sequence(:email) { |n| "trainee#{n}@mail.com" }
    password { 'password' }
		role { 0 }
  end
end

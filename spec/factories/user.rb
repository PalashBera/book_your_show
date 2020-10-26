FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email      { Faker::Internet.email }
    password   { Faker::Internet.password(min_length: 6, max_length: 128) }
    admin      { false }
  end

  factory :admin_user, parent: :user do
    admin { true }
  end
end

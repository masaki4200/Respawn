FactoryBot.define do
  factory :item do
    title { Faker::Lorem.characters(number:5) }
    description { Faker::Lorem.characters(number:20) }
    user
  end
end
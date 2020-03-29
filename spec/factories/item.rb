FactoryBot.define do
  factory :item do
    title { Faker::Lorem.characters(number:5) }
    description { Faker::Lorem.characters(number:20) }
    item_image_id { Faker::Lorem.characters(number:5) }
    user
  end
end
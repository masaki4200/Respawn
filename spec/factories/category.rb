FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number:5) }
    genre_status { 0 }
  end
end
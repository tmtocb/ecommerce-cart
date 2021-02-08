FactoryBot.define do
  factory :product do
    title { Faker::Lorem.word }
    price { 1 }
  end
end
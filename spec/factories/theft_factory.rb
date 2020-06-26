FactoryBot.define do
  factory :theft, class: Theft do
    title { Faker::Lorem.name }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    source_url { Faker::Internet.url }
    image_url { Faker::Internet.url }
  end
end

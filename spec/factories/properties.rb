FactoryGirl.define do
  factory :property do
    house_type 'house'
    title { Faker::Lorem.paragraph.first(15) }
    address { Faker::Lorem.paragraph.first(30) }
    zipcode { Faker::Address.zip_code.first(5) }
    country 'mx'
    notes { Faker::Lorem.paragraph }
  end
end

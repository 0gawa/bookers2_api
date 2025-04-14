FactoryBot.define do
  factory :book_comment do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 20) } 
    book
    user
  end
end

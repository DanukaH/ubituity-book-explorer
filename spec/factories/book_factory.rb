FactoryBot.define do
  factory :book do
    csv
    title { Faker::Book.title }
    author { Faker::Book.author }
    date_published { Faker::Date.in_date_period }
    publisher_name { Faker::Book.publisher }
    uuid { SecureRandom.uuid }
  end
end

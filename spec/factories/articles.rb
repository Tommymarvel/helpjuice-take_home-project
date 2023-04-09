FactoryBot.define do
  factory :article do
    title { Faker::Movie.unique.title }
    text { Faker::Movie.quote }
  end
end

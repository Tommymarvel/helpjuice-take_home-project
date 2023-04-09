FactoryBot.define do
  factory :query do
    query { Faker::Movie.unique.title }
    user
  end
end

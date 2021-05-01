FactoryBot.define do
  factory :list do
    incode { Faker::Number.number(digits: 6) }
    date { Date.today }
    association :item
  end
end

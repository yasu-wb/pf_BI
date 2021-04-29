FactoryBot.define do
  factory :item do
    incode { Faker::Number.number(digits: 6) }
    name { Faker::Beer.name }
    main_category_id { Faker::Number.between(from: 1, to: 3) }
    sub_category_id { Faker::Number.between(from: 1, to: 13) }
  end
end

FactoryBot.define do
  factory :user do
    number_id { Faker::Number.number(digits: 6) }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    in_charge1_id { Faker::Number.between(from: 1, to: 17) }
    in_charge2_id { Faker::Number.between(from: 1, to: 17) }
    in_charge3_id { Faker::Number.between(from: 1, to: 17) }
  end
end

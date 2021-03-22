FactoryBot.define do
  factory :user do
    number_id { Faker::Number.number(digits: 6) }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    in_charge1 { Faker::Number.between(from: 1, to: 13) }
    in_charge2 { Faker::Number.between(from: 1, to: 13) }
    in_charge3 { Faker::Number.between(from: 1, to: 13) }
  end
end
